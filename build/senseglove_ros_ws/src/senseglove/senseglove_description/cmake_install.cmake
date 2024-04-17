# Install script for directory: /home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_description

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_description/catkin_generated/installspace/senseglove_description.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_description/cmake" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_description/cmake/senseglove_description-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_description/cmake" TYPE FILE FILES
    "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_description/catkin_generated/installspace/senseglove_descriptionConfig.cmake"
    "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_description/catkin_generated/installspace/senseglove_descriptionConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_description" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_description/package.xml")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_description/urdf" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_description/dk1_left.urdf")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_description/urdf" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_description/dk1_right.urdf")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_description/urdf" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_description/nova_left.urdf")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_description/urdf" TYPE FILE FILES "/home/joe/SpaceTeleop_ws/build/senseglove_ros_ws/src/senseglove/senseglove_description/nova_right.urdf")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/senseglove_description" TYPE DIRECTORY FILES "/home/joe/SpaceTeleop_ws/src/senseglove_ros_ws/src/senseglove/senseglove_description/urdf")
endif()

