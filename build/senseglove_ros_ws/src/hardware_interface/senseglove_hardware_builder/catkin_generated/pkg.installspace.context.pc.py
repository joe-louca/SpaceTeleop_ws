# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;roslib;senseglove_hardware;urdf".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lsenseglove_hardware_builder".split(';') if "-lsenseglove_hardware_builder" != "" else []
PROJECT_NAME = "senseglove_hardware_builder"
PROJECT_SPACE_DIR = "/home/joe/SpaceTeleop_ws/install"
PROJECT_VERSION = "2.0.0"
