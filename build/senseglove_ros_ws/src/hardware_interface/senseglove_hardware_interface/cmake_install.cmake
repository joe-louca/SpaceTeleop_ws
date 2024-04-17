# Install script for directory: /home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/hardware_interface/senseglove_hardware_interface

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/joe/SpaceTeleop_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/hardware_interface/senseglove_hardware_interface/catkin_generated/installspace/senseglove_hardware_interface.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_hardware_interface/cmake" TYPE FILE FILES
    "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/hardware_interface/senseglove_hardware_interface/catkin_generated/installspace/senseglove_hardware_interfaceConfig.cmake"
    "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/hardware_interface/senseglove_hardware_interface/catkin_generated/installspace/senseglove_hardware_interfaceConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_hardware_interface" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/hardware_interface/senseglove_hardware_interface/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/senseglove_hardware_interface" TYPE DIRECTORY FILES "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/hardware_interface/senseglove_hardware_interface/include/senseglove_hardware_interface/")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/senseglove_hardware_interface/senseglove_hardware_interface_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/senseglove_hardware_interface/senseglove_hardware_interface_node")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/senseglove_hardware_interface/senseglove_hardware_interface_node"
         RPATH "/home/joe/SpaceTeleop_ws/install/lib:/home/joe/SpaceTeleop_ws/devel/lib:/home/joe/kuka_ws/devel/lib:/opt/ros/noetic/lib:/opt/ros/noetic/lib/x86_64-linux-gnu:/opt/ros/noetic/lib:/home/joe/SpaceTeleop_ws/devel/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/senseglove_hardware_interface" TYPE EXECUTABLE FILES "/home/joe/SpaceTeleop_ws/devel/lib/senseglove_hardware_interface/senseglove_hardware_interface_node")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/senseglove_hardware_interface/senseglove_hardware_interface_node" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/senseglove_hardware_interface/senseglove_hardware_interface_node")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/senseglove_hardware_interface/senseglove_hardware_interface_node"
         OLD_RPATH "/opt/ros/noetic/lib:/home/joe/SpaceTeleop_ws/devel/lib:/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/SenseGlove_API/lib/linux/Ubuntu/x86-64/release:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
         NEW_RPATH "/home/joe/SpaceTeleop_ws/install/lib:/home/joe/SpaceTeleop_ws/devel/lib:/home/joe/kuka_ws/devel/lib:/opt/ros/noetic/lib:/opt/ros/noetic/lib/x86_64-linux-gnu:/opt/ros/noetic/lib:/home/joe/SpaceTeleop_ws/devel/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/senseglove_hardware_interface/senseglove_hardware_interface_node")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_hardware_interface" TYPE DIRECTORY FILES
    "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/hardware_interface/senseglove_hardware_interface/config"
    "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/hardware_interface/senseglove_hardware_interface/launch"
    )
endif()

