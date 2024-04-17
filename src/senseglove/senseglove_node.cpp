/*
A console application demonstrating the intended use of a SenseGlove interface.
Used to compile the programs in the SGCoreCpp/test folder.
*/

#include <iostream> //Output to console
#include <stdio.h>

#include <thread>  //To pause the main() while vibrating
#include <chrono>  //To pause the thread for std::chrono::seconds

#include <ros/ros.h>
#include<std_msgs/Float32.h>
#include<std_msgs/Float32MultiArray.h>
#include <geometry_msgs/PointStamped.h>

#include "Library.h" //Contains version information on SGCore / SGConnect Libraries
#include "SenseCom.h" //Functions to check scanning process - and to start it if need be.

#include "HapticGlove.h" //Haptic Glove Interfacing
#include "Tracking.h" //To calculate wrist location based on fixed hardware offsets.
#include "SG_FFBCmd.h" //force-feedback command(s)
#include "SG_BuzzCmd.h" //vibration command(s)

class listener
  	{
     	public:
			std::vector<float> fingercontact_msg;
			float TH_buzz, F1_buzz, F2_buzz, F3_buzz, F4_buzz, TH_force, F1_force, F2_force, F3_force, F4_force, msg_time;
			bool msg_received = false;
			void Contacts_Callback(const std_msgs::Float32MultiArray::ConstPtr& msg);
   	};

	void listener::Contacts_Callback(const std_msgs::Float32MultiArray::ConstPtr& msg)
    {
		const std_msgs::Float32MultiArray* data = msg.get();
		listener::TH_buzz = data->data[0];
		listener::F1_buzz = data->data[1];
		listener::F2_buzz = data->data[2];
		listener::F3_buzz = data->data[3];
		listener::F4_buzz = data->data[4];		
		listener::TH_force = data->data[5];
		listener::F1_force = data->data[6];
		listener::F2_force = data->data[7];
		listener::F3_force = data->data[8];
		listener::F4_force = data->data[9];
		listener::msg_time = data->data[10];
		listener::msg_received = true;
    }

void Publish_TP(double value, ros::Publisher ros_pub)
{
	std_msgs::Float32 TP_msg;
	TP_msg.data = value;
	ros_pub.publish(TP_msg);
}

void Publish_A(float* angles, ros::Publisher ros_pub)
{
	std_msgs::Float32MultiArray angles_msg;
	//rad2deg = 180.0/M_PI;
	angles_msg.data.clear();
	for (int i = 0; i<17; i++)
	{
		angles_msg.data.push_back( angles[i] );
	}

	//angles_msg.data = angles;
	ros_pub.publish(angles_msg);
}

void Publish_P(SGCore::Kinematics::Vect3D joint_p, ros::Publisher ros_pub)
{
	geometry_msgs::PointStamped joint_p_msg;
	joint_p_msg.header.stamp = ros::Time::now();
	joint_p_msg.point.x = joint_p.x;
	joint_p_msg.point.y = joint_p.y;
	joint_p_msg.point.z = joint_p.z;
	ros_pub.publish(joint_p_msg);
}

int main(int argc, char* argv[])
{
	// Intrinsic delay:
	// Outgoing data = 10-29 ms 
		// The Nova Glove sends its sensor data at a rate of 60 Hz, which can add up to 16.67 ms.
		// Sending this data to another device will take between 10-12.5 ms.
	// Incoming data = 15-22.5 ms
		// Time to send a new command (e.g. Setting a Force-Feedback level from 0% to 100%) and it activating on the glove will take between 15 to 22.5 ms

	int c;
	int frame = 0;
	float left_buzz, left_force, right_buzz, right_force;
	SGCore::HandProfile cachedProfile;
	SGCore::HandPose handPose;


	// Setup publisher nodes for each joint on each finger
	argc = 0;
	argv = NULL;
	ros::init(argc, argv, "SenseGloveNova");
    ros::NodeHandle n;

	bool haptics_on;
	ros::param::get("/haptics_on", haptics_on);
	// ros::Publisher F0_J0_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F0/J0/Position", 1);
	// ros::Publisher F0_J1_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F0/J1/Position", 1);
	// ros::Publisher F0_J2_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F0/J2/Position", 1);
	// ros::Publisher F0_J3_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F0/J3/Position", 1);
	// ros::Publisher F1_J0_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F1/J0/Position", 1);
	// ros::Publisher F1_J1_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F1/J1/Position", 1);
	// ros::Publisher F1_J2_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F1/J2/Position", 1);
	// ros::Publisher F1_J3_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F1/J3/Position", 1);
	// ros::Publisher F2_J0_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F2/J0/Position", 1);
	// ros::Publisher F2_J1_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F2/J1/Position", 1);
	// ros::Publisher F2_J2_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F2/J2/Position", 1);
	// ros::Publisher F2_J3_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F2/J3/Position", 1);
	// ros::Publisher F3_J0_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F3/J0/Position", 1);
	// ros::Publisher F3_J1_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F3/J1/Position", 1);
	// ros::Publisher F3_J2_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F3/J2/Position", 1);
	// ros::Publisher F3_J3_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F3/J3/Position", 1);
	// ros::Publisher F4_J0_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F4/J0/Position", 1);
	// ros::Publisher F4_J1_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F4/J1/Position", 1);
	// ros::Publisher F4_J2_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F4/J2/Position", 1);
	// ros::Publisher F4_J3_Position_pub = n.advertise<geometry_msgs::PointStamped>("/F4/J3/Position", 1);
	
	ros::Publisher FingerJointAngles_pub = n.advertise<std_msgs::Float32MultiArray>("/FingerJointAngles", 1);
	//ros::Publisher FingerJointVelocities_pub = n.advertise<std_msgs::Float32MultiArray>("/FingerJointVelocities", 1);
	ros::Publisher TPdist_pub = n.advertise<std_msgs::Float32>("/TPDistance", 1);
	ros::Publisher TPvel_pub = n.advertise<std_msgs::Float32>("/TPVelocity", 1);

	// Collate these into an array
	// ros::Publisher position_rospubbers[5][5] = { {F0_J0_Position_pub, F0_J1_Position_pub, F0_J2_Position_pub, F0_J3_Position_pub},
	// 											 {F1_J0_Position_pub, F1_J1_Position_pub, F1_J2_Position_pub, F1_J3_Position_pub},
	// 											 {F2_J0_Position_pub, F2_J1_Position_pub, F2_J2_Position_pub, F2_J3_Position_pub},
	// 											 {F3_J0_Position_pub, F3_J1_Position_pub, F3_J2_Position_pub, F3_J3_Position_pub},
	// 											 {F4_J0_Position_pub, F4_J1_Position_pub, F4_J2_Position_pub, F4_J3_Position_pub} };
	
	listener list;
    ros::Subscriber Contact_sub = n.subscribe<std_msgs::Float32MultiArray>("/FingerContacts", 1, &listener::Contacts_Callback, &list);
	
	// API can set vibration and forces at 200Hz at steps from 0-100
	int rate_hz = 200;
	ros::Rate loop_rate(rate_hz);

	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
	// Checking the Library

	// Displaying Library information - Useful to know when asking for any kind of support
	{
	std::cout << "Testing " + SGCore::Library::Version() + ", compiled for " + SGCore::Library::BackEndVersion();
	if (SGCore::Library::GetBackEndType() == SGCore::BackEndType::SharedMemory) // By default, your library will be compiled to use Shared Memory via the SGConnect library
    {
		std::cout << " using " + SGCore::Library::SGConnectVersion(); //If you replace SGConnect.dll, this will give you its current version number.
    }
	std::cout << std::endl;
	std::cout << "The source code for this program is located in the SGCoreCs/test/ folder." << std::endl;
	std::cout << "=========================================================================" << std::endl;
	}

	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
	// Ensuring connectivity

	// Connecting to SenseGlove devices is done in a separate "Connection Process" - contained in the SGConnect library.
	// We can test if this Connection Process is running on this PC. Usually, it runs inside SenseCom.
	// It's good practice to start this process if your user has not sone so yet.
	{
		bool connectionsActive = SGCore::SenseCom::ScanningActive(); //returns true if SenseCom (or another program) has started the SenseGlove Communications Process.
        // std::cout << "Scanning for SenseGlove Active: " + std::to_string(connectionsActive) << std::endl; 
        
		if (!connectionsActive) // If this process is not running yet, we can "Force-Start" SenseCom. Provided it has run on this PC at least once.
		{
			// std::cout << "SenseCom is not yet running. Without it, we cannot connect to SenseGlove devices." << std::endl;
			bool startedSenseCom = SGCore::SenseCom::StartupSenseCom(); //Returns true if the process was started.
			if (startedSenseCom)
			{
				// std::cout << "Successfully started SenseCom. It will take a few seconds to connect..." << std::endl;
				connectionsActive = SGCore::SenseCom::ScanningActive(); //this will return false immedeately after you called StartupSenseCom(). Because the program has yet to initialize.
																		// Even if SenseCom started and the connections process is active, there's no guarantee that the user has turned their device(s) on. More on that later.
			}
			else // If StartupSenseCom() returns false, you've either never run SenseCom, or it is already running. But at that point, the ScanningActive() should have returned true. 
			{
				// std::cout << "Could not Start the SenseCom process. This is not yet implemented in our C++ API.";
			}
			// std::cout << std::endl;
		}
	}

	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
	// Accessing Haptic Gloves

	// You interface with SenseGlove devices through an instance of a HapticGlove class.
	// At any point in your program, you can try to grab a SenseGlove Device. There's no guarantee that one is connected, though.
	// Let's try and grab a Haptic Glove, a class from which both our Nova Glove and SenseGlove DK1 Exoskeletons derive.
	// Using the HapticGlove as opposed to the specific Nova / SenseGlove class allows your software to be compatible with both types of devices (as well as any other types of gloves we add later).
	{
		std::shared_ptr<SGCore::HapticGlove> testGlove; //SGCore.HapticGlove - The class from which all of our gloves derive. For this reason, we use a (smart) pointer, rather than a class itself.
		bool gotHapticGlove = SGCore::HapticGlove::GetGlove(testGlove); //GetGlove returns the first glove connected to your system - doesn't care if it's a left or a right hand.
		if (!gotHapticGlove) //For this exercise, I'll keep trying to connect to a glove.
		{
			std::cout << "Failed to Detect a Haptic Glove on your System. Please ensure your device is paired or connected via USB." << std::endl;
			std::cout << "Exiting" << std::endl;
			return 0;
		}

		// If we were looking for a specific hand, we can pass a boolean to the GetGlove function. I know you have at least one - or you wouldn't have passed this section.
				
		std::shared_ptr<SGCore::HapticGlove> leftGlove, rightGlove;
		bool gotLeft  = SGCore::HapticGlove::GetGlove(false, leftGlove); // passing false returns the first connected left hand
		bool gotRight = SGCore::HapticGlove::GetGlove(true,  rightGlove); // passing true returns the first connected right hand

		// Alternatively, you can get a list of all connected Haptic Gloves on your system
		std::vector<std::shared_ptr<SGCore::HapticGlove>> allGloves = SGCore::HapticGlove::GetHapticGloves();

		std::cout << "There are " + std::to_string(allGloves.size()) + " Haptic Glove(s) connected to your system." << std::endl;

		if (gotLeft)
		{ std::cout << "Your Left hand is " + leftGlove->ToString() << std::endl;; }
		else
		{ std::cout << "You have no left hands connected to your system." << std::endl; }

		if (gotRight)
		{ std::cout << "Your Right hand is " + rightGlove->ToString() << std::endl; }
		else
		{ std::cout << "You have no right hands connected to your system." << std::endl; }

		std::cout << "The first Haptic Glove connected to your system is " + testGlove->ToString() + " - we will use this one for testing." << std::endl;;
		std::cout << std::endl;
	}

	//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
	// Using a Haptic Glove instance

	// SenseGlove Devices are chached inside the SGCore library. The GetGloves() function returns a reference to them, not a copy.
	// Let's pretend this is a frame of your simulation
	// Once you have a HapticGlove instance , you request specific data.
	{
		// Basic Device Information
		bool rightHand = true; // I'm going to use this for the next part of this test.
		std::shared_ptr<SGCore::HapticGlove> testGlove;
		if (SGCore::HapticGlove::GetGlove(testGlove)) //remember, if this function returns true, we've succesfully connected to a Glove.
        {
			rightHand = testGlove->IsRight();	//Returns true if this is a right hand. If false, this is a left hand.
			std::string deviceID = testGlove->GetDeviceID();	//The Device's Unique Identifier. Useful if you have multiple of them.
			std::string type = SGCore::SGDevice::ToString(testGlove->GetDeviceType()); //The DeviceType (SenseGlove DK1, SenseGlove Nova, etc.)
			std::cout << deviceID + " is a " + (rightHand ? "Right" : "Left") + " hand whose deviceType is " + type << std::endl;
        }
		// if the above returned false, there is no glove. So there's no use to run the tests.

		//// Calibrate the max min joint ranges for this glove
		{
		std::cout << "Connected to a " << (testGlove->IsRight() ? "right" : "left") << "-handed SenseGlove. Staring calibration" << std::endl;

		/* 
		Our goal is to find the min / max sensor values, which correspond to the user opening their hand and making a fist.
		We can only update this range after parsing sensor data, which happens when accessing sensorData, glovePoses or handPoses.
		In our VR use cases, we pull new hand data each frame, and so this min/max range is updated automatically. 
		In this example, we will update the range twice; once when the hand is 'open', once when it is closed into a fist.
		*/ 		

		// Step 1: Open hand - Calibrates extension
		std::cout << std::endl;
		std::cout << "Step 1: Place your hand on a flat surface, like a table, and spread your thumb and fingers." << std::endl;
		std::cout << "Once your hand is in the right position, press Return to continue" << std::endl; 
		c = getchar();
		
		// This function updates the calibration range of testGlove.
		testGlove->UpdateCalibrationRange(); // Instead of this method, you can also use the GetSensorData(), GetGlovePose() or GetHandPose function instead.

		// Step 2: Fist - Calibrates flexion
		std::cout << "Step 1: Done." << std::endl;
		std::cout << std::endl;
		std::cout << "Step 2: Close your hand into a fist. Make sure your fingers aren't wrapped around your thumb." << std::endl;
		std::cout << "Once your hand is in the right position, press Return to continue" << std::endl;
		c = getchar();

		// This function updates the calibration range of testGlove. 
		testGlove->UpdateCalibrationRange();

		// At this point, we've collected data while the hand was open, and when it was closed. 
		// The calibration range should now have the two extremes to interpolate between.
		// Let's check & ouput the ranges:
		std::vector<SGCore::Kinematics::Vect3D> minRanges, maxRanges;
		testGlove->GetCalibrationRange(minRanges, maxRanges);
		
		// The calibration ranges contain the x, y, z values, which represent the pronation/supination, flexion/extension, and abduction/adduction movements respectively, in radians. 
		// For readability's sake, we'll print out the flexion/extension values in degrees.
		// float rad2Deg = 180 / M_PI;
		// std::cout << std::endl << "Evaluated the following calibration range for extension/flexion" << std::endl;
		// std::cout << "Extensions: ";
		// for (int f = 0; f < minRanges.size(); f++)
		// {
		// 	std::cout << std::to_string((int)(rad2Deg * minRanges[f].y));
		// 	if (f < minRanges.size() - 1) { std::cout << ", "; }
		// }
		// std::cout << std::endl << "Flexions: ";
		// for (int f = 0; f < maxRanges.size(); f++)
		// {
		// 	std::cout << std::to_string((int)(rad2Deg * maxRanges[f].y));
		// 	if (f < maxRanges.size() - 1) { std::cout << ", "; }
		// }
		// std::cout << std::endl;

		// Now we apply the calibration to a default profile
		cachedProfile = SGCore::HandProfile::Default( testGlove->IsRight() ); //a default profile for the right-sided glove.
		testGlove->ApplyCalibration(cachedProfile);

		// // And can now use it to calculate handPoses
		// if (testGlove->GetHandPose(cachedProfile, handPose))
		// {
		// 	std::cout << std::endl << "With these ranges, we've calculated the following hand angles:" << std::endl;
		// 	std::cout << handPose.ToString() << std::endl;
		// }
		// else
		// {
		// 	std::cout << "Something went wrong while trying to calucate a handPose. Perhaps a packet was dropped or an exception occurs." << std::endl;
		// }
		
		// Finally, we can store the profile in its serialized form to use later
		std::string serializedProfile = cachedProfile.Serialize();

		// And Deserialize it back into a useable profile
		SGCore::HandProfile loadedProfile = SGCore::HandProfile::Deserialize(serializedProfile);
		


		
		}

		

		std::shared_ptr<SGCore::HapticGlove> glove;
		if (SGCore::HapticGlove::GetGlove(rightHand, glove))
        {
			//Step 1: Hand Pose
			//SGCore::HandPose handPose;
			SGCore::Kinematics::Vect3D jointP;
			SGCore::Kinematics::Vect3D wristP;
			SGCore::Kinematics::Quat wristR;
			SGCore::Kinematics::Vect3D jointA;
			float jointAs[17];
			int f0_force, f1_force, f2_force, f3_force, f4_force, f0_vib, f1_vib, f2_vib, f3_vib, f4_vib;

			//std::vector<std::vector<SGCore::Kinematics::Vect3D>> flat_hand_angles=SGCore::Kinematics::Anatomy.HandAngles_Flat(rightHand);
			
			SGCore::Kinematics::Vect3D thumb_pointer_vector;
			SGCore::Kinematics::Vect3D thumb;
			SGCore::Kinematics::Vect3D finger;
			double thumb_pointer_distance;
			double thumb_pointer_distance_last;
			double thumb_pointer_velocity;		
			bool first_loop = true;
			bool publish_v = false;
			int count = 0;
			
			std::cout<<"Make an L shape with your thumb and pointer.  Press Return to continue."<<std::endl;
			c = getchar();
			if (glove->GetHandPose(cachedProfile, handPose)) //returns the HandPose based on the latest device data, using the latest Profile and the default HandGeometry
			{			
				thumb_pointer_vector = handPose.jointPositions[1][3] - handPose.jointPositions[0][3];
				thumb_pointer_distance = abs(pow( (pow(thumb_pointer_vector.x, 2) + pow(thumb_pointer_vector.y,2) + pow(thumb_pointer_vector.z,2)), 0.5));
				ros::param::set("/TP_MAX", thumb_pointer_distance);
				std::cout<<"Glove control started."<<std::endl;
			}

			while (ros::ok())
			{
				ros::param::get("/haptics_on", haptics_on);
				if (glove->GetHandPose(cachedProfile, handPose)) //returns the HandPose based on the latest device data, using the latest Profile and the default HandGeometry
				{
					wristP = SGCore::Kinematics::Vect3D::zero; //TODO; Get these off your tracker
					wristR = SGCore::Kinematics::Quat::identity; //TODO; Get these off your tracker
					for (int f = 0; f < 5; f++) //finger (f), [0..4].
					{
						for (int j = 0; j < 4; j++) //Joint Index; proximal to distal, where 4 = fingerTip.
						{	
							// Publish positions of each joint
							// position of the hand joints in 3D space, in millimeters, relative to the wrist (0, 0, 0). 
							// JointPositions is a 5x4 array of Vectors
							jointP = wristP + (wristR * handPose.jointPositions[f][j]);
							// Publish_P(jointP, position_rospubbers[f][j]);
						}
					}

					// Publish Finger Joint Angles
					jointAs[0] = handPose.handAngles[0][0].x;
					jointAs[1] = handPose.handAngles[0][0].z;
					jointAs[2] = handPose.handAngles[0][0].y;
					jointAs[3] = handPose.handAngles[0][1].y;
					jointAs[4] = handPose.handAngles[0][2].y;

					jointAs[5] = handPose.handAngles[1][0].z;
					jointAs[6] = handPose.handAngles[1][0].y;
					jointAs[7] = handPose.handAngles[1][1].y;
					jointAs[8] = handPose.handAngles[1][2].y;

					jointAs[9] = handPose.handAngles[2][0].z;
					jointAs[10] = handPose.handAngles[2][0].y;
					jointAs[11] = handPose.handAngles[2][1].y;
					jointAs[12] = handPose.handAngles[2][2].y;

					jointAs[13] = handPose.handAngles[3][0].z;
					jointAs[14] = handPose.handAngles[3][0].y;
					jointAs[15] = handPose.handAngles[3][1].y;
					jointAs[16] = handPose.handAngles[3][2].y;
					// 1x17 array
					// Thumb: CMC Twist, CMC Flex, CMC Abduct, MCP Flex, IP Flex,
					// Fingers: MCP Abduct, MCP Flex, PIP Flex,  DIP Flex}
					Publish_A(jointAs, FingerJointAngles_pub);

					// Publish Thumb-Pointer distance
					thumb_pointer_vector = handPose.jointPositions[1][3] - handPose.jointPositions[0][3];
					
					thumb_pointer_distance = abs(pow( (pow(thumb_pointer_vector.x, 2) + pow(thumb_pointer_vector.y,2) + pow(thumb_pointer_vector.z,2)), 0.5));
					
					double thumb_d = pow(pow(handPose.jointPositions[0][3].x,2)+pow(handPose.jointPositions[0][3].y,2)+pow(handPose.jointPositions[0][3].z,2),0.5); 
					double finger_d = pow(pow(handPose.jointPositions[1][3].x,2)+pow(handPose.jointPositions[1][3].y,2)+pow(handPose.jointPositions[1][3].z,2),0.5);
					double dot = handPose.jointPositions[1][3].x*handPose.jointPositions[0][3].x + handPose.jointPositions[1][3].y*handPose.jointPositions[0][3].y + handPose.jointPositions[1][3].z*handPose.jointPositions[0][3].z;
					double a_cosine = dot/(thumb_d*finger_d);
					double c = pow(thumb_d*thumb_d + finger_d*finger_d - 2*finger_d*thumb_d*a_cosine, 0.5);
					//std::cout<< c <<", "<< thumb_pointer_distance<<std::endl;




					//std::cout<< (handPose.jointPositions[1][3].x) - (handPose.jointPositions[0][3].x) << std::endl;
					if (first_loop){thumb_pointer_distance_last = thumb_pointer_distance;}
					
					if (publish_v)
					{
						double tmp_dp = (thumb_pointer_distance-thumb_pointer_distance_last);
						if (abs(tmp_dp) > 0.001) {thumb_pointer_velocity = tmp_dp/(0.005*5);}
						else{thumb_pointer_velocity=0;}
						Publish_TP(thumb_pointer_velocity, TPvel_pub);
						thumb_pointer_distance_last = thumb_pointer_distance;
					}

					//if (thumb_pointer_distance<0) {thumb_pointer_distance=0;}
					Publish_TP(thumb_pointer_distance, TPdist_pub);
					//Publish_TP(thumb_pointer_velocity, TPvel_pub);

					//thumb_pointer_distance_last = thumb_pointer_distance;
					first_loop = false;
					count+=1;
					if (count==5)
					{
						publish_v = true;
						count = 0;
					}
					else {publish_v = false;}
				}
				else //This function could return false if no data for this glove is available (yet).
				{
					std::cout << "Something went wrong trying to access the HandPose of " + glove->ToString() + ". Try again later.";
				}

				// Subscribe to sensor readings for each finger and apply feedback
				if (haptics_on)
				{
					if (list.msg_received)
					{
						//Force-Feedback Command
						glove->SendHaptics(SGCore::Haptics::SG_FFBCmd(list.TH_force, list.F1_force, list.F2_force, list.F3_force, 0) );
						
						//Vibro Command
						glove->SendHaptics(SGCore::Haptics::SG_BuzzCmd(list.TH_buzz, list.F1_buzz, list.F2_buzz, list.F3_buzz, 0) );

						//list.msg_received = false;
					}
				}

				// Spin ROS
				frame +=1;
				ros::spinOnce();
				loop_rate.sleep();	
				//glove->StopHaptics(); //turns off all Vibration and Force-Feedback. 
			}
			glove->StopHaptics(); //turns off all Vibration and Force-Feedback. 

		}
		//If there is no more glove, we don't need to do anything this frame.
	}
}

