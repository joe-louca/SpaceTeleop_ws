#!/usr/bin/env python

import rospy
from geometry_msgs.msg import WrenchStamped
import serial
import sys
from struct import unpack

class RESENSE():
    def __init__(self, address=0):
        rospy.init_node('ResenseFTSensorNode_'+address, anonymous=True)

        # Prepare the publisher and subscriber, based on the topic        
        wrench_msg = WrenchStamped()
        pub = rospy.Publisher('/ResenseFTSensor_'+address, WrenchStamped, queue_size=1)

        # Set some parameters
        ser = serial.Serial(port='/dev/ttyACM' + address, baudrate=2000000)
        rate_hz = 1000  
        t0 = rospy.get_time()
        r = rospy.Rate(rate_hz)

        while not rospy.is_shutdown():
            t0 = rospy.get_time()
            # Read the data and convert to floats
            line = ser.read(28)
            try:
                [CH2, CH1, CH4, CH3, CH6, CH5, temp] = unpack('fffffff', line[0:28])
                
                # Publish the data
                wrench_msg.header.stamp = rospy.get_rostime()
                wrench_msg.header.frame_id = address
                wrench_msg.wrench.force.x = CH2
                wrench_msg.wrench.force.y = CH1
                wrench_msg.wrench.force.z = CH4
                wrench_msg.wrench.torque.x = CH3
                wrench_msg.wrench.torque.y = CH6
                wrench_msg.wrench.torque.z = CH5

                pub.publish(wrench_msg)

            except:
                print('error reading serial ' +str(rospy.get_time()))
                
            r.sleep()

        # close the 
        ser.close()

if __name__ == '__main__':
    ft_node = RESENSE(sys.argv[1])




