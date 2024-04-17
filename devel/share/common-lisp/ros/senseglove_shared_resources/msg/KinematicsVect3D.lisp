; Auto-generated. Do not edit!


(cl:in-package senseglove_shared_resources-msg)


;//! \htmlinclude KinematicsVect3D.msg.html

(cl:defclass <KinematicsVect3D> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0))
)

(cl:defclass KinematicsVect3D (<KinematicsVect3D>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <KinematicsVect3D>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'KinematicsVect3D)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name senseglove_shared_resources-msg:<KinematicsVect3D> is deprecated: use senseglove_shared_resources-msg:KinematicsVect3D instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <KinematicsVect3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:x-val is deprecated.  Use senseglove_shared_resources-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <KinematicsVect3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:y-val is deprecated.  Use senseglove_shared_resources-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <KinematicsVect3D>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader senseglove_shared_resources-msg:z-val is deprecated.  Use senseglove_shared_resources-msg:z instead.")
  (z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <KinematicsVect3D>) ostream)
  "Serializes a message object of type '<KinematicsVect3D>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <KinematicsVect3D>) istream)
  "Deserializes a message object of type '<KinematicsVect3D>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<KinematicsVect3D>)))
  "Returns string type for a message object of type '<KinematicsVect3D>"
  "senseglove_shared_resources/KinematicsVect3D")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'KinematicsVect3D)))
  "Returns string type for a message object of type 'KinematicsVect3D"
  "senseglove_shared_resources/KinematicsVect3D")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<KinematicsVect3D>)))
  "Returns md5sum for a message object of type '<KinematicsVect3D>"
  "cc153912f1453b708d221682bc23d9ac")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'KinematicsVect3D)))
  "Returns md5sum for a message object of type 'KinematicsVect3D"
  "cc153912f1453b708d221682bc23d9ac")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<KinematicsVect3D>)))
  "Returns full string definition for message of type '<KinematicsVect3D>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'KinematicsVect3D)))
  "Returns full string definition for message of type 'KinematicsVect3D"
  (cl:format cl:nil "float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <KinematicsVect3D>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <KinematicsVect3D>))
  "Converts a ROS message object to a list"
  (cl:list 'KinematicsVect3D
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
))
