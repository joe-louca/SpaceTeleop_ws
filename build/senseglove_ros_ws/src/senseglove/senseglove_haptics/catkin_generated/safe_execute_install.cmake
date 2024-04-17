execute_process(COMMAND "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_haptics/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_haptics/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
