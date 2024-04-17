# Install script for directory: /home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_shared_resources

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_shared_resources/msg" TYPE FILE FILES
    "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/msg/FingerDistanceFloats.msg"
    "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/msg/FingerDistances.msg"
    "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/msg/KinematicsVect3D.msg"
    "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/msg/SenseGloveState.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_shared_resources/srv" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/srv/Calibrate.srv")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_shared_resources/cmake" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/catkin_generated/installspace/senseglove_shared_resources-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/joe/SpaceTeleop_ws/devel/include/senseglove_shared_resources")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/joe/SpaceTeleop_ws/devel/share/roseus/ros/senseglove_shared_resources")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/joe/SpaceTeleop_ws/devel/share/common-lisp/ros/senseglove_shared_resources")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/joe/SpaceTeleop_ws/devel/share/gennodejs/ros/senseglove_shared_resources")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/joe/SpaceTeleop_ws/devel/lib/python3/dist-packages/senseglove_shared_resources")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/joe/SpaceTeleop_ws/devel/lib/python3/dist-packages/senseglove_shared_resources")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/catkin_generated/installspace/senseglove_shared_resources.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_shared_resources/cmake" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/catkin_generated/installspace/senseglove_shared_resources-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_shared_resources/cmake" TYPE FILE FILES
    "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/catkin_generated/installspace/senseglove_shared_resourcesConfig.cmake"
    "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/catkin_generated/installspace/senseglove_shared_resourcesConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_shared_resources" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_shared_resources/package.xml")
endif()

