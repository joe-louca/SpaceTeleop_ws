cmake_minimum_required (VERSION 3.5.0)
project (haption)

include_directories(/opt/ros/noetic/include /opt/ros/noetic/lib)


find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  sensor_msgs
  moveit_commander
  moveit_msgs
  geometry_msgs
  tf2_ros
  tf2_geometry_msgs
)

#find_package(catkin REQUIRED COMPONENTS roscpp)
#catkin_package()

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY                
	${PROJECT_SOURCE_DIR}/bin)

link_directories(${PROJECT_SOURCE_DIR}/linux/lib) #virtuoseAPI.so
link_directories(${PROJECT_SOURCE_DIR}/linux/bin) #virtuoseAPI.a

add_executable (haption_node haption.cpp)
target_link_libraries(haption_node
        virtuose
        dl
        -I/opt/ros/noetic/include
        -L/opt/ros/noetic/lib
        -lroscpp
        -lrostime
        -lrosconsole
        -lroscpp_serialization
)
