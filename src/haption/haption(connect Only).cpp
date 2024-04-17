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
    
int main(int argc, char* argv[])
{
    bool func_result;
    // Open connection to haption    
	VC = virtOpen("localhost");
	if (VC == NULL)
	{
		fprintf(stderr, "Error connecting to haption: %s\n", virtGetErrorMessage(virtGetErrorCode(NULL)));
	}
	else
	{
		int result = virtClose(VC);
	}
    return 0;
}