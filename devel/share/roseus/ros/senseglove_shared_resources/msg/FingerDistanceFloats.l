;; Auto-generated. Do not edit!


(when (boundp 'senseglove_shared_resources::FingerDistanceFloats)
  (if (not (find-package "SENSEGLOVE_SHARED_RESOURCES"))
    (make-package "SENSEGLOVE_SHARED_RESOURCES"))
  (shadow 'FingerDistanceFloats (find-package "SENSEGLOVE_SHARED_RESOURCES")))
(unless (find-package "SENSEGLOVE_SHARED_RESOURCES::FINGERDISTANCEFLOATS")
  (make-package "SENSEGLOVE_SHARED_RESOURCES::FINGERDISTANCEFLOATS"))

(in-package "ROS")
;;//! \htmlinclude FingerDistanceFloats.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass senseglove_shared_resources::FingerDistanceFloats
  :super ros::object
  :slots (_th_ff _th_mf _th_rf _th_lf ))

(defmethod senseglove_shared_resources::FingerDistanceFloats
  (:init
   (&key
    ((:th_ff __th_ff) (instance std_msgs::Float64 :init))
    ((:th_mf __th_mf) (instance std_msgs::Float64 :init))
    ((:th_rf __th_rf) (instance std_msgs::Float64 :init))
    ((:th_lf __th_lf) (instance std_msgs::Float64 :init))
    )
   (send-super :init)
   (setq _th_ff __th_ff)
   (setq _th_mf __th_mf)
   (setq _th_rf __th_rf)
   (setq _th_lf __th_lf)
   self)
  (:th_ff
   (&rest __th_ff)
   (if (keywordp (car __th_ff))
       (send* _th_ff __th_ff)
     (progn
       (if __th_ff (setq _th_ff (car __th_ff)))
       _th_ff)))
  (:th_mf
   (&rest __th_mf)
   (if (keywordp (car __th_mf))
       (send* _th_mf __th_mf)
     (progn
       (if __th_mf (setq _th_mf (car __th_mf)))
       _th_mf)))
  (:th_rf
   (&rest __th_rf)
   (if (keywordp (car __th_rf))
       (send* _th_rf __th_rf)
     (progn
       (if __th_rf (setq _th_rf (car __th_rf)))
       _th_rf)))
  (:th_lf
   (&rest __th_lf)
   (if (keywordp (car __th_lf))
       (send* _th_lf __th_lf)
     (progn
       (if __th_lf (setq _th_lf (car __th_lf)))
       _th_lf)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Float64 _th_ff
    (send _th_ff :serialization-length)
    ;; std_msgs/Float64 _th_mf
    (send _th_mf :serialization-length)
    ;; std_msgs/Float64 _th_rf
    (send _th_rf :serialization-length)
    ;; std_msgs/Float64 _th_lf
    (send _th_lf :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Float64 _th_ff
       (send _th_ff :serialize s)
     ;; std_msgs/Float64 _th_mf
       (send _th_mf :serialize s)
     ;; std_msgs/Float64 _th_rf
       (send _th_rf :serialize s)
     ;; std_msgs/Float64 _th_lf
       (send _th_lf :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Float64 _th_ff
     (send _th_ff :deserialize buf ptr-) (incf ptr- (send _th_ff :serialization-length))
   ;; std_msgs/Float64 _th_mf
     (send _th_mf :deserialize buf ptr-) (incf ptr- (send _th_mf :serialization-length))
   ;; std_msgs/Float64 _th_rf
     (send _th_rf :deserialize buf ptr-) (incf ptr- (send _th_rf :serialization-length))
   ;; std_msgs/Float64 _th_lf
     (send _th_lf :deserialize buf ptr-) (incf ptr- (send _th_lf :serialization-length))
   ;;
   self)
  )

(setf (get senseglove_shared_resources::FingerDistanceFloats :md5sum-) "645d53f7de8b68c040fc08d5668ceb96")
(setf (get senseglove_shared_resources::FingerDistanceFloats :datatype-) "senseglove_shared_resources/FingerDistanceFloats")
(setf (get senseglove_shared_resources::FingerDistanceFloats :definition-)
      "std_msgs/Float64 th_ff  # thumb to index finger
std_msgs/Float64 th_mf  # thumb to middle finger
std_msgs/Float64 th_rf  # thumb to ring finger
std_msgs/Float64 th_lf  # future when pink is on shadow hand

================================================================================
MSG: std_msgs/Float64
float64 data
")



(provide :senseglove_shared_resources/FingerDistanceFloats "645d53f7de8b68c040fc08d5668ceb96")


