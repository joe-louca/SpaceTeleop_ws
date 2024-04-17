#!/bin/bash

#
# virtuoseDemo -mv deamon_ip_addresse#virtuose_portToApi Haptic_type 
#
#		Haptic_type specify the type of Haption Haptic device
#		Haptic_type = {v3d15-25|v3dv4|desktop|v6dDesktop|v6dv4|v6d35-45|v6d35-40|scaleOne|6Dinverse|orthese|eduFroce|hglove_v6dv4|hglove_v6d35-45|hglove_v6d35-40}
#				v3d15-25 		: Virtuose 3D15-25
#				v3dv4			: Virtuose 3D standard 50cm forearm
#				desktop 		: old version of Virtuose 6D Desktop
#				v6dDesktop		: Virtuose 6D Desktop standard
#				v3dDesktop		: Virtuose 3D Desktop standard
#				v6dv4 			: Virtuose 6D standard 50cm forearm
#				v6d35-45		: Virtuose 6D 45cm forearm
#				v6d35-40		: Virtuose 6D 40cm forearm
#				scaleOne		: virtuose on table XYZ
#				6Dinverse		: Virtuose 6D inverse
#				orthese			: Able othese
#				eduForce		: eduFroce standard
#				hglove_v6dv4 	: HGlove with Virtuose 6D standard 50cm forearm
#				hglove_v6d35-45 : HGlove with Virtuose 6D 45cm forearm
#				hglove_v6d35-40 : HGlove with Virtuose 6D 40cm forearm
#
#		ip_adresse specify the ethernet IP address
# 		if you have a Haptic device with a black PC tower: IP_Address of the Haptic Device
#			if you have a Haptic Service: IP_Address of the Workstation who run the Haptic Service
#				By default the application port is 5000, if you have change this port you need to
#				explicitely specify the port number by: ip_address#port_number
#
# Some examples
# 	Virtuose 6Ddesktop with a black PC tower with an IP_address of 192.168.100.6
# virtuoseDemo -mv 192.168.100.6 desktop
#
# 	Virtuose 6D normal stand with a black PC tower with an IP_address of 192.168.100.12 or 
#		Virtuose 6D normal stand and Haptic Service with different PC for Worstation (192.168.100.12) and 
#		the Application Station: (with default application port 5000)
# virtuoseDemo -mv 192.168.100.12 v6d35-45
#
# 	Virtuose 6D normal stand and Haptic Service with same PC for Worstation and 
#		the Application Station: (with default application port 5000)
# virtuoseDemo -mv 127.0.0.1#5000 v6dv4 1.0
#
# 	Virtuose 6D Desktop standard with the Haptic Service running on the PC with port 53210 (default port since 2018)
#		Set the tool mass to 0.3 kg.
# virtuoseDemo -mv 127.0.0.1#53210 v6dDesktop 0.3
#
# 	Virtuose 3D Desktop standard with the Haptic Service running on the PC with port 53210 (default port since 2018)
#		Set the tool mass to 0.3 kg.
# virtuoseDemo -mv 127.0.0.1#53210 v3dDesktop 0.3
#
#		eduForce standard device
#	virtuoseDemo -mv 127.0.0.1#53210 eduForce 0.5
#
#		HGlove connected on a standard Virtuose 6D
# 	All the Haptic services of the HGlove and Virtuose are running on the same PC in local (127.0.0.1)
# 	The device port of the Virtuose is 53210, 
#		the device port of the HGlove thumb finger must be VirtuosePort+1 (53211),
#		the device port of the HGlove index finger must be VirtuosePort+2 (53212),
#		the device port of the HGlove middle finger must be VirtuosePort+3 (53213)
#
#	virtuoseDemo -mv 127.0.0.1#53210 hglove_v6dv4 0.2
#
# 	Virtuose 6D TAO and Haptic Service with same PC for Worstation and 
#		the Application Station
# 	rotation of 90 degrees on the left
# 	the device must be on the right side.
#   virtuoseDemo -mv 127.0.0.1#53210 v6dv4TAO_right 1.0
#
#
# 	Virtuose 6D TAO and Haptic Service with same PC for Worstation and 
#		the Application Station
# 	rotation of 90 degrees on the right
# 	the device must be on the left side.
#   virtuoseDemo -mv 127.0.0.1#53210 v6dv4TAO_left 1.0


export LD_LIBRARY_PATH=.
./virtuoseDemo -mv 127.0.0.1#53210 v6dv4 1.0

 
