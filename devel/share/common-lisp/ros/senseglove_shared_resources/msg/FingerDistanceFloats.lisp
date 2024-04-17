; Auto-generated. Do not edit!


(cl:in-package senseglove_shared_resources-msg)


;//! \htmlinclude FingerDistanceFloats.msg.html

(cl:defclass <FingerDistanceFloats> (roslisp-msg-protocol:ros-message)
  ((th_ff
    :reader th_ff
    :initarg :th_ff
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64))
   (th_mf
    :reader th_mf
    :initarg :th_mf
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64))
   (th_rf
    :reader th_rf
    :initarg :th_rf
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64))
   (th_lf
    :reader th_lf
    :initarg :th_lf
    :type std_msgs-msg:Float64
    :initform (cl:make-instance 'std_msgs-msg:Float64)))
)

(cl:defclass FingerDistanceFloats (<FingerDistanceFloats>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FingerDistanceFloats>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FingerDistanceFloats)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name senseglove_shared_resources-msg:<FingerDistanceFloats> is deprecated: use senseglove_shared_resources-msg:FingerDistanceFloats instead.")))

(cl:ensure-generic-function 'th_ff-val :lambda-list '(m))
(cl:defmethod th_ff-val ((m <FingerDistanceFloats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:th_ff-val is deprecated.  Use senseglove_shared_resources-msg:th_ff instead.")
  (th_ff m))

(cl:ensure-generic-function 'th_mf-val :lambda-list '(m))
(cl:defmethod th_mf-val ((m <FingerDistanceFloats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:th_mf-val is deprecated.  Use senseglove_shared_resources-msg:th_mf instead.")
  (th_mf m))

(cl:ensure-generic-function 'th_rf-val :lambda-list '(m))
(cl:defmethod th_rf-val ((m <FingerDistanceFloats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:th_rf-val is deprecated.  Use senseglove_shared_resources-msg:th_rf instead.")
  (th_rf m))

(cl:ensure-generic-function 'th_lf-val :lambda-list '(m))
(cl:defmethod th_lf-val ((m <FingerDistanceFloats>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:th_lf-val is deprecated.  Use senseglove_shared_resources-msg:th_lf instead.")
  (th_lf m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FingerDistanceFloats>) ostream)
  "Serializes a message object of type '<FingerDistanceFloats>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'th_ff) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'th_mf) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'th_rf) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'th_lf) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FingerDistanceFloats>) istream)
  "Deserializes a message object of type '<FingerDistanceFloats>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'th_ff) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'th_mf) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'th_rf) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'th_lf) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FingerDistanceFloats>)))
  "Returns string type for a message object of type '<FingerDistanceFloats>"
  "senseglove_shared_resources/FingerDistanceFloats")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FingerDistanceFloats)))
  "Returns string type for a message object of type 'FingerDistanceFloats"
  "senseglove_shared_resources/FingerDistanceFloats")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FingerDistanceFloats>)))
  "Returns md5sum for a message object of type '<FingerDistanceFloats>"
  "645d53f7de8b68c040fc08d5668ceb96")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FingerDistanceFloats)))
  "Returns md5sum for a message object of type 'FingerDistanceFloats"
  "645d53f7de8b68c040fc08d5668ceb96")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FingerDistanceFloats>)))
  "Returns full string definition for message of type '<FingerDistanceFloats>"
  (cl:format cl:nil "std_msgs/Float64 th_ff  # thumb to index finger~%std_msgs/Float64 th_mf  # thumb to middle finger~%std_msgs/Float64 th_rf  # thumb to ring finger~%std_msgs/Float64 th_lf  # future when pink is on shadow hand~%~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FingerDistanceFloats)))
  "Returns full string definition for message of type 'FingerDistanceFloats"
  (cl:format cl:nil "std_msgs/Float64 th_ff  # thumb to index finger~%std_msgs/Float64 th_mf  # thumb to middle finger~%std_msgs/Float64 th_rf  # thumb to ring finger~%std_msgs/Float64 th_lf  # future when pink is on shadow hand~%~%================================================================================~%MSG: std_msgs/Float64~%float64 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FingerDistanceFloats>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'th_ff))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'th_mf))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'th_rf))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'th_lf))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FingerDistanceFloats>))
  "Converts a ROS message object to a list"
  (cl:list 'FingerDistanceFloats
    (cl:cons ':th_ff (th_ff msg))
    (cl:cons ':th_mf (th_mf msg))
    (cl:cons ':th_rf (th_rf msg))
    (cl:cons ':th_lf (th_lf msg))
))
