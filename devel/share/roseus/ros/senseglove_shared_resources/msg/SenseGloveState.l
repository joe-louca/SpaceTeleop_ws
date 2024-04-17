;; Auto-generated. Do not edit!


(when (boundp 'senseglove_shared_resources::SenseGloveState)
  (if (not (find-package "SENSEGLOVE_SHARED_RESOURCES"))
    (make-package "SENSEGLOVE_SHARED_RESOURCES"))
  (shadow 'SenseGloveState (find-package "SENSEGLOVE_SHARED_RESOURCES")))
(unless (find-package "SENSEGLOVE_SHARED_RESOURCES::SENSEGLOVESTATE")
  (make-package "SENSEGLOVE_SHARED_RESOURCES::SENSEGLOVESTATE"))

(in-package "ROS")
;;//! \htmlinclude SenseGloveState.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass senseglove_shared_resources::SenseGloveState
  :super ros::object
  :slots (_header _joint_names _position _absolute_velocity _hand_position _finger_tip_positions ))

(defmethod senseglove_shared_resources::SenseGloveState
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:joint_names __joint_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:absolute_velocity __absolute_velocity) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:hand_position __hand_position) ())
    ((:finger_tip_positions __finger_tip_positions) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _joint_names __joint_names)
   (setq _position __position)
   (setq _absolute_velocity __absolute_velocity)
   (setq _hand_position __hand_position)
   (setq _finger_tip_positions __finger_tip_positions)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:joint_names
   (&optional __joint_names)
   (if __joint_names (setq _joint_names __joint_names)) _joint_names)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:absolute_velocity
   (&optional __absolute_velocity)
   (if __absolute_velocity (setq _absolute_velocity __absolute_velocity)) _absolute_velocity)
  (:hand_position
   (&rest __hand_position)
   (if (keywordp (car __hand_position))
       (send* _hand_position __hand_position)
     (progn
       (if __hand_position (setq _hand_position (car __hand_position)))
       _hand_position)))
  (:finger_tip_positions
   (&rest __finger_tip_positions)
   (if (keywordp (car __finger_tip_positions))
       (send* _finger_tip_positions __finger_tip_positions)
     (progn
       (if __finger_tip_positions (setq _finger_tip_positions (car __finger_tip_positions)))
       _finger_tip_positions)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string[] _joint_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _joint_names)) 4
    ;; float32[] _position
    (* 4    (length _position)) 4
    ;; float32[] _absolute_velocity
    (* 4    (length _absolute_velocity)) 4
    ;; senseglove_shared_resources/KinematicsVect3D[] _hand_position
    (apply #'+ (send-all _hand_position :serialization-length)) 4
    ;; senseglove_shared_resources/KinematicsVect3D[] _finger_tip_positions
    (apply #'+ (send-all _finger_tip_positions :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string[] _joint_names
     (write-long (length _joint_names) s)
     (dolist (elem _joint_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float32[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _absolute_velocity
     (write-long (length _absolute_velocity) s)
     (dotimes (i (length _absolute_velocity))
       (sys::poke (elt _absolute_velocity i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; senseglove_shared_resources/KinematicsVect3D[] _hand_position
     (write-long (length _hand_position) s)
     (dolist (elem _hand_position)
       (send elem :serialize s)
       )
     ;; senseglove_shared_resources/KinematicsVect3D[] _finger_tip_positions
     (write-long (length _finger_tip_positions) s)
     (dolist (elem _finger_tip_positions)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string[] _joint_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _joint_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float32[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _absolute_velocity
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _absolute_velocity (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _absolute_velocity i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; senseglove_shared_resources/KinematicsVect3D[] _hand_position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _hand_position (let (r) (dotimes (i n) (push (instance senseglove_shared_resources::KinematicsVect3D :init) r)) r))
     (dolist (elem- _hand_position)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; senseglove_shared_resources/KinematicsVect3D[] _finger_tip_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _finger_tip_positions (let (r) (dotimes (i n) (push (instance senseglove_shared_resources::KinematicsVect3D :init) r)) r))
     (dolist (elem- _finger_tip_positions)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get senseglove_shared_resources::SenseGloveState :md5sum-) "ca87b488181e10549b08892cbeda5ca5")
(setf (get senseglove_shared_resources::SenseGloveState :datatype-) "senseglove_shared_resources/SenseGloveState")
(setf (get senseglove_shared_resources::SenseGloveState :definition-)
      "# A message for senseglove data
Header header

string[] joint_names
float32[] position
float32[] absolute_velocity
KinematicsVect3D[] hand_position
KinematicsVect3D[] finger_tip_positions
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: senseglove_shared_resources/KinematicsVect3D
float32 x
float32 y
float32 z
")



(provide :senseglove_shared_resources/SenseGloveState "ca87b488181e10549b08892cbeda5ca5")


