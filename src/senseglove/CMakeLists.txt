cmake_minimum_required( VERSION 3.10 )

project(senseglove)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#Optimization parameters
set(CMAKE_BUILD_TYPE RELEASE)
set(CMAKE_CXX_FLAGS "-O2")

# Add SGConnect
message(STATUS "Attempting to add the SGCoreCpp project at ${CMAKE_CURRENT_SOURCE_DIR}../../")
include(${CMAKE_CURRENT_SOURCE_DIR}/libs/SGConnect/LinkSGConnect.cmake) # Runs the module that include SGCoreCpp into this project
message(STATUS "Done!")

# Add SGCore
message(STATUS "Attempting to add the SGCoreCpp project at ${CMAKE_CURRENT_SOURCE_DIR}../../")
include(${CMAKE_CURRENT_SOURCE_DIR}/libs/SGCoreCpp/LinkSGCoreCpp.cmake) # Runs the module that include SGCoreCpp into this project
message(STATUS "Done!")



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

set (CMAKE_RUNTIME_OUTPUT_DIRECTORY                
	${PROJECT_SOURCE_DIR}/bin)


# Include directories
include_directories(
    ./include
    /opt/ros/noetic/include
    /opt/ros/noetic/lib
    )

set(ALL_LIBS
    #${SGCONNECT_BIN_DEBUG}
    ${SGCONNECT_BIN_RELEASE}
    #${SGCORE_BIN_DEBUG}
    ${SGCORE_BIN_RELEASE}
)

set(SOURCES)


# target
add_executable(senseglove_node senseglove_node.cpp ${SOURCES})

target_include_directories(senseglove_node PRIVATE )

add_dependencies(senseglove_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(senseglove_node 
  ${catkin_LIBRARIES}
)
    
target_link_libraries(senseglove_node ${ALL_LIBS}
        -I/opt/ros/noetic/include
        -L/opt/ros/noetic/lib
        -lroscpp
        -lrostime
        -lrosconsole
        -lroscpp_serialization
)