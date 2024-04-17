#include <iostream>
#include <string>
#include "haption/VirtuoseAPI.h"

#include <ros/ros.h>

#include <geometry_msgs/TwistStamped.h>
#include <std_msgs/Int16.h>

#include <sys/time.h>
#include <ctime>

#define _USE_MATH_DEFINES
 
#include <cmath>

#define HAPTION_CONTROLLER_IP "localhost" //"192.168.100.53"


VirtContext VC;

class listener
  {
     public:
     	float ft_delay[6];
     	void FT_Callback(const geometry_msgs::TwistStamped::ConstPtr& msg);

   };

    void listener::FT_Callback(const geometry_msgs::TwistStamped::ConstPtr& msg)
    {
	const geometry_msgs::TwistStamped* data = msg.get();


	listener::ft_delay[0] = data->twist.linear.x;
	listener::ft_delay[1] = data->twist.linear.y;
	listener::ft_delay[2] = data->twist.linear.z;

	listener::ft_delay[3] = data->twist.angular.x;
	listener::ft_delay[4] = data->twist.angular.y;
	listener::ft_delay[5] = data->twist.angular.z;
    }


    bool openConnectionToHaption(VirtContext & VC)
    {
    	int r;
        VC = virtOpen("localhost");
        if (VC == NULL)
        {
            fprintf(stderr, "Error connecting to haption: %s\n", virtGetErrorMessage(virtGetErrorCode(NULL)));
			std::cout<<"failed here"<<std::endl;
            return false;
        }
        else
        {
            float identity[7] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f};
            
            r = virtSetIndexingMode(VC, INDEXING_ALL);		// Offset to move the workspace somehwere more reasonable
            	if (r != 0) {fprintf(stderr, "Error occured in SetIndexingMode: %s\n", virtGetErrorMessage(virtGetErrorCode(VC)));}
		
            r = virtSetForceFactor(VC, 1.0f);				// set force factor
            	if (r != 0) {fprintf(stderr, "Error occured in SetForceFactor: %s\n", virtGetErrorMessage(virtGetErrorCode(VC)));}
		
            r = virtSetSpeedFactor(VC, 1.0f);				// set speed factor
            	if (r != 0) {fprintf(stderr, "Error occured in SetSpeedFactor: %s\n", virtGetErrorMessage(virtGetErrorCode(VC)));}
		
            r = virtSetTimeoutValue(VC, 0.1f);			// set simulator integration timestep
            	if (r != 0) {fprintf(stderr, "Error occured in SetTimeoutValue: %s\n", virtGetErrorMessage(virtGetErrorCode(VC)));}
		
            r = virtSetBaseFrame(VC, identity);	 		// set the base reference frame with respect to the environment reference frame    
            	if (r != 0) {fprintf(stderr, "Error occured in SetBaseFrame: %s\n", virtGetErrorMessage(virtGetErrorCode(VC)));}
		
	    r = virtSetObservationFrame(VC, identity);		// set the position of the observation reference frame with respect to the environment reference frame           
            	if (r != 0) {fprintf(stderr, "Error occured in SetObservationFrame: %s\n", virtGetErrorMessage(virtGetErrorCode(VC)));}
		
	    r = virtSetCommandType(VC, COMMAND_TYPE_IMPEDANCE);	// set the command type
            	if (r != 0) {fprintf(stderr, "Error occured in SetCommandType: %s\n", virtGetErrorMessage(virtGetErrorCode(VC)));}

            r = virtSetPowerOn(VC, 1);
            	if (r != 0) {fprintf(stderr, "Error occured in SetPowerOn: %s\n", virtGetErrorMessage(virtGetErrorCode(VC)));}
            return true;
        }
    }

    bool closeConnectionToHaption(VirtContext & VC)
    {
        int result = virtClose(VC);
        if (result != 0)
        {
            fprintf(stderr, "Error occurred in haption close: %s\n", virtGetErrorMessage(virtGetErrorCode(VC)));
            return false;
        }
        else {
            return true;
        }
    }

   

    void Publish_Twist(float* cmd, ros::Publisher ros_pub, float clutch_counter)
    {  // Publish cmd as TwistStamped - followed by gripper_cmd, clutch_counter, frame_id, timestamp
  	geometry_msgs::TwistStamped cmd_msg;
  	std::string clutch = std::to_string(clutch_counter);
  	
    	cmd_msg.twist.linear.x = cmd[0];
    	cmd_msg.twist.linear.y = cmd[1];
    	cmd_msg.twist.linear.z = cmd[2];
    	cmd_msg.twist.angular.x = cmd[3];
    	cmd_msg.twist.angular.y = cmd[4];
    	cmd_msg.twist.angular.z = cmd[5];
		cmd_msg.header.frame_id = clutch;
    	cmd_msg.header.stamp = ros::Time::now();
      	ros_pub.publish(cmd_msg);
    }


    
int main(int argc, char* argv[])
{
    double ft_factor = 1.0; 		// scaling factor for forces to apply to haption
    double ft_user_scale = 10.0; 	// ft scale factor from gui
    
    // Set up a ros node with publisher and subscriber
    ros::init(argc, argv, "Haption");
    ros::NodeHandle n;
    ros::Publisher p_pub = n.advertise<geometry_msgs::TwistStamped>("/p_hap_out", 1);
    ros::Publisher v_pub = n.advertise<geometry_msgs::TwistStamped>("/v_hap_out", 1);
    //ros::Publisher gripper_pub = n.advertise<std_msgs::Int16>("/gripper_cmd", 1);
    std_msgs::Int16 gripper_msg;
    
    listener list;
    ros::Subscriber F_sub = n.subscribe<geometry_msgs::TwistStamped>("/F_hap_in", 1, &listener::FT_Callback, &list);
    
    // Set the loop rate
    int rate_hz = 1000;
    float timestep;
    //n.getParam("rate_hz",rate_hz);
    ros::Rate loop_rate(rate_hz);
    n.getParam("timestep",timestep);


    // Declare some function result variables
    bool func_result;
    int virt_result;
    
    // Declare button and gripper control variables    
    int buttons[4] = {0,0,0,0};
    int left_btn = 0;
    int mid_btn = 0;
    int force_fb_btn = 0;
    int last_left_btn = 0;
    int last_mid_btn = 0;
    int last_force_fb_btn = 0;
    int deadman = 0;
    int last_deadman = 0;
    bool force_fb_checker = false;
    bool first_loop = true;
        
    // Declare some useful variables
    int clutch_counter = 0;
    int gripper_cmd = 0;
    float p_hap[6] = {};
    float p_hap_last[6] = {};
    float v_hap[6] = {};
    float ft_set[6] = {};
    
    // Open connection to haption    
    func_result = openConnectionToHaption(VC);
    
    // Make sure force feedback button is not pressed to start
    std::cout<<"Haption: Force feedback button must be un-pressed to start"<<std::endl;
    for (int i = 0; i < 5; i++) {virtGetButton(VC, i+1, &buttons[i]);}
    force_fb_btn = buttons[2];

    while(!force_fb_checker)
    {
	if(force_fb_btn==0) {force_fb_checker = true;}
	else
	{
	    for (int i = 0; i < 5; i++) {virtGetButton(VC, i+1, &buttons[i]);}
	    force_fb_btn = buttons[2];
	}
    }	    
    if(func_result)
    {
	    while (ros::ok())
	    {        
	    	virtGetDeadMan(VC, &deadman);
	    	if(deadman == 1)
	    	{
	    		if (clutch_counter == 0) 
	    		{
	    			double start_time = ros::Time::now().toSec();
	    			n.setParam("start_time",start_time);
	    		}
	    		
	    		// Update clutch counter
	    		if((deadman == 1) && (last_deadman == 0)) 
	    		{
	    			clutch_counter += 1;
	    			first_loop = true;
	    		}

			// Get haption velocity and publish
		    	virt_result = virtGetSpeed(VC, v_hap);
		    	virt_result = virtGetPosition(VC, p_hap);

				Publish_Twist(v_hap, v_pub, clutch_counter);
				Publish_Twist(p_hap, p_pub, clutch_counter);
				
		    	// if (first_loop != true)
		    	// {
		    	// 	for (int i = 0; i < 3; i++)
		    	// 	{
		    	// 		v_hap[i] = (p_hap[i] - p_hap_last[i])/timestep;
			    // 	}
				// 	//std::cout<<"x: "<<v_hap[0]<<" y: "<<v_hap[1]<<" z: "<<v_hap[2]<<std::endl;
		    	// }
		    	// for(int i = 0; i < 3; i++) {p_hap_last[i] = p_hap[i];}
		    	first_loop = false;
		    	
		    	
		    	// Get haption buttons input : 0/1 [left, mid, force_fb, right(?)]
		    	for (int i = 0; i < 5; i++) {virtGetButton(VC, i+1, &buttons[i]);}
			left_btn = buttons[0];
			mid_btn = buttons[1];
			force_fb_btn = buttons[2];
			
			// If middle button pressed then toggle gripper control
		    	// if ((mid_btn==1) && (last_mid_btn==0)) 
		    	// {
		    	// 	// Toggle gripper control (0 = open, 1 = closed)
		    	// 	if (gripper_cmd == 0) {gripper_cmd = 1;}
		    	// 	else if (gripper_cmd == 1) {gripper_cmd = 0;}
		    		
				// // Send command
		    	// 	//gripper_msg.data = gripper_cmd;
		    	// 	//gripper_pub.publish(gripper_msg);
		    		
		    	// }
		    	// last_mid_btn = mid_btn;
		    	
		    	
		    	
			if (force_fb_btn==1)
			{	
				// Scale force direction based on user setting
				n.getParam("ft_user_scale",ft_user_scale);	
							
				// Convert subscriber array to a new array because ft_delay[0] is dodgy for some reason.
				for(int i=0;i<3;i++) 
				{
					ft_set[i] = list.ft_delay[i]*ft_factor*(ft_user_scale/100.0);
					ft_set[i+3] = list.ft_delay[i+3]*ft_factor*(ft_user_scale/100.0);
				}

				// Get forces within safe range
				for(int i=0; i<3; i++)
				{
					if(ft_set[i]>5.0f) {ft_set[i]=5.0f;}
					if(ft_set[i]<-5.0f) {ft_set[i]=-5.0f;}
					if(ft_set[i+3]>0.3f) {ft_set[i+3]=0.3f;}
					if(ft_set[i+3]<-0.3f){ft_set[i+3]=-0.3f;}
				}
					
			    	// Apply forces to haption
				virt_result = virtAddForce(VC, ft_set);
				
				// Update force feedback button tracker
		    		last_force_fb_btn = 1;
		    	}
		    	
		    	// Reset connection if force_fb or deadman unpressed
		    	if (((last_force_fb_btn==1)&&(force_fb_btn==0)))// || ((last_deadman==1)&&(deadman==0)))
			{
				std::cout<<"Haption: Turning off force feedback... stay still"<<std::endl;
				func_result = closeConnectionToHaption(VC);
				sleep(0.01);
				func_result = openConnectionToHaption(VC);
				sleep(0.01);
				std::cout<<"Haption: Force feedback off... continue control"<<std::endl;
				
			}
			last_force_fb_btn = force_fb_btn;
		}
		else
		{	
			for(int i=0;i<6;i++) {v_hap[i] = 0.0;}
			Publish_Twist(v_hap, v_pub, clutch_counter);
		}
		// Update deadman toggle
		last_deadman = deadman;
		
		// Spin ROS
		ros::spinOnce();
		loop_rate.sleep();	
	    }
    }
    func_result = closeConnectionToHaption(VC);
    
    return 0;
}