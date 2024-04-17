#!/usr/bin/env python

import rospy
from std_msgs.msg import Float32MultiArray
import serial
import sys
from struct import unpack

class RESENSE():
    def __init__(self, address=0):
        rospy.init_node('ResenseFTSensorNode', anonymous=True)

        # Prepare the publisher and subscriber, based on the topic        
        msg = Float32MultiArray()
        pub = rospy.Publisher('/FingerJointAngles', Float32MultiArray, queue_size=1)

        # Set some parameters
        rate_hz = 10  
        r = rospy.Rate(rate_hz)

        while not rospy.is_shutdown():
            msg.data = [1.0, 0.0, 0.0, 0.0,  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,  0.0, 0.0, 0.0, 0.0]
            pub.publish(msg)
            r.sleep()


if __name__ == '__main__':
    ft_node = RESENSE()




