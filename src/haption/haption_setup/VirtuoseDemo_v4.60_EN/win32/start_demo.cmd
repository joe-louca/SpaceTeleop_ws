@echo off
rem
rem virtuoseDemo -mv ip_addresse Haptic_type
rem
rem		Haptic_type specify the type of Haption Haptic device
rem		Haptic_type = {v3d15-25|desktop|v6dDesktop|v6dv4|v6d35-45|v6d35-40|scaleOne|6Dinverse|orthese|eduFroce|hglove_v6dv4|hglove_v6d35-45|hglove_v6d35-40}
rem				v3d15-25 		: Virtuose 3D15-25
rem				desktop 		: old version of Virtuose 6D Desktop
rem				v6dDesktop		: Virtuose 6D Desktop standard
rem				v3dDesktop		: Virtuose 3D Desktop standard
rem				v6dv4 			: Virtuose 6D standard 50cm forearm
rem				v6d35-45		: Virtuose 6D 45cm forearm
rem				v6d35-40		: Virtuose 6D 40cm forearm
rem				scaleOne		: virtuose on table XYZ
rem				6Dinverse		: Virtuose 6D inverse
rem				orthese			: Able othese
rem				eduForce		: eduFroce standard
rem				hglove_v6dv4 	: HGlove with Virtuose 6D standard 50cm forearm
rem				hglove_v6d35-45 : HGlove with Virtuose 6D 45cm forearm
rem				hglove_v6d35-40 : HGlove with Virtuose 6D 40cm forearm
rem
rem		ip_adresse specify the ethernet IP address
rem 		if you have a Haptic device with a black PC tower: IP_Address of the Haptic Device
rem			if you have a Haptic Service: IP_Address of the Workstation who run the Haptic Service
rem				By default the application port is 5000, if you have change this port you need to
rem				explicitely specify the port number by: ip_address#port_number
rem
rem Some examples
rem 	Virtuose 6Ddesktop with a black PC tower with an IP_address of 192.168.100.6
rem virtuoseDemo -mv 192.168.100.6 desktop 0.3
rem
rem 	Virtuose 6D normal stand with a black PC tower with an IP_address of 192.168.100.12 or 
rem		Virtuose 6D normal stand and Haptic Service with different PC for Worstation (192.168.100.12) and 
rem		the Application Station: (with default application port 5000)
rem virtuoseDemo -mv 192.168.100.12 v6d35-45 1.0
rem
rem 	Virtuose 6D normal stand and Haptic Service with same PC for Worstation and 
rem		the Application Station: (with default application port 5000)
rem virtuoseDemo -mv 127.0.0.1#5000 v6dv4 1.0
rem
rem 	Virtuose 6D Desktop standard with the Haptic Service running on the PC with port 53210 (default port since 2018)
rem		Set the tool mass to 0.3 kg.
rem virtuoseDemo -mv 127.0.0.1#53210 v6dDesktop 0.3
rem
rem 	Virtuose 3D Desktop standard with the Haptic Service running on the PC with port 53210 (default port since 2018)
rem		Set the tool mass to 0.3 kg.
rem virtuoseDemo -mv 127.0.0.1#5017 v3dDesktop 0.3
rem
rem		eduForce standard device
rem	virtuoseDemo -mv 127.0.0.1#53210 eduForce 0.5
rem
rem		HGlove connected on a standard Virtuose 6D
rem 	All the Haptic services of the HGlove and Virtuose are running on the same PC in local (127.0.0.1)
rem 	The device port of the Virtuose is 53210, 
rem		the device port of the HGlove thumb finger must be VirtuosePort+1 (53211),
rem		the device port of the HGlove index finger must be VirtuosePort+2 (53212),
rem		the device port of the HGlove middle finger must be VirtuosePort+3 (53213)
rem
rem	virtuoseDemo -mv 127.0.0.1#53210 hglove_v6dv4 0.2
rem
rem 	Virtuose 6D TAO and Haptic Service with same PC for Worstation and 
rem		the Application Station
rem 	rotation of 90 degrees on the left
rem 	the device must be on the right side.
rem virtuoseDemo -mv 127.0.0.1#53210 v6dv4TAO_right 1.0
rem
rem
rem 	Virtuose 6D TAO and Haptic Service with same PC for Worstation and 
rem		the Application Station
rem 	rotation of 90 degrees on the right
rem 	the device must be on the left side.
rem virtuoseDemo -mv 127.0.0.1#53210 v6dv4TAO_left 1.0


virtuoseDemo -mv 127.0.0.1#53210 eduForce 0.5


rem
@echo on



rem
@echo on