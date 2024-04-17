; Auto-generated. Do not edit!


(cl:in-package senseglove_shared_resources-msg)


;//! \htmlinclude FingerDistances.msg.html

(cl:defclass <FingerDistances> (roslisp-msg-protocol:ros-message)
  ((thumb_index
    :reader thumb_index
    :initarg :thumb_index
    :type cl:float
    :initform 0.0)
   (thumb_middle
    :reader thumb_middle
    :initarg :thumb_middle
    :type cl:float
    :initform 0.0)
   (thumb_ring
    :reader thumb_ring
    :initarg :thumb_ring
    :type cl:float
    :initform 0.0)
   (thumb_pinky
    :reader thumb_pinky
    :initarg :thumb_pinky
    :type cl:float
    :initform 0.0))
)

(cl:defclass FingerDistances (<FingerDistances>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FingerDistances>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FingerDistances)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name senseglove_shared_resources-msg:<FingerDistances> is deprecated: use senseglove_shared_resources-msg:FingerDistances instead.")))

(cl:ensure-generic-function 'thumb_index-val :lambda-list '(m))
(cl:defmethod thumb_index-val ((m <FingerDistances>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:thumb_index-val is deprecated.  Use senseglove_shared_resources-msg:thumb_index instead.")
  (thumb_index m))

(cl:ensure-generic-function 'thumb_middle-val :lambda-list '(m))
(cl:defmethod thumb_middle-val ((m <FingerDistances>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:thumb_middle-val is deprecated.  Use senseglove_shared_resources-msg:thumb_middle instead.")
  (thumb_middle m))

(cl:ensure-generic-function 'thumb_ring-val :lambda-list '(m))
(cl:defmethod thumb_ring-val ((m <FingerDistances>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:thumb_ring-val is deprecated.  Use senseglove_shared_resources-msg:thumb_ring instead.")
  (thumb_ring m))

(cl:ensure-generic-function 'thumb_pinky-val :lambda-list '(m))
(cl:defmethod thumb_pinky-val ((m <FingerDistances>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:thumb_pinky-val is deprecated.  Use senseglove_shared_resources-msg:thumb_pinky instead.")
  (thumb_pinky m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FingerDistances>) ostream)
  "Serializes a message object of type '<FingerDistances>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'thumb_index))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'thumb_middle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'thumb_ring))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'thumb_pinky))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FingerDistances>) istream)
  "Deserializes a message object of type '<FingerDistances>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'thumb_index) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'thumb_middle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'thumb_ring) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'thumb_pinky) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FingerDistances>)))
  "Returns string type for a message object of type '<FingerDistances>"
  "senseglove_shared_resources/FingerDistances")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FingerDistances)))
  "Returns string type for a message object of type 'FingerDistances"
  "senseglove_shared_resources/FingerDistances")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FingerDistances>)))
  "Returns md5sum for a message object of type '<FingerDistances>"
  "7c9951a7d85c69ea7ca7247b7088916a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FingerDistances)))
  "Returns md5sum for a message object of type 'FingerDistances"
  "7c9951a7d85c69ea7ca7247b7088916a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FingerDistances>)))
  "Returns full string definition for message of type '<FingerDistances>"
  (cl:format cl:nil "float32 thumb_index~%float32 thumb_middle~%float32 thumb_ring~%float32 thumb_pinky~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FingerDistances)))
  "Returns full string definition for message of type 'FingerDistances"
  (cl:format cl:nil "float32 thumb_index~%float32 thumb_middle~%float32 thumb_ring~%float32 thumb_pinky~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FingerDistances>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FingerDistances>))
  "Converts a ROS message object to a list"
  (cl:list 'FingerDistances
    (cl:cons ':thumb_index (thumb_index msg))
    (cl:cons ':thumb_middle (thumb_middle msg))
    (cl:cons ':thumb_ring (thumb_ring msg))
    (cl:cons ':thumb_pinky (thumb_pinky msg))
))
