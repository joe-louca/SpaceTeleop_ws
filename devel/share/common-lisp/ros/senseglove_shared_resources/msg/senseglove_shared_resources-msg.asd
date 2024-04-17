
(cl:in-package :asdf)

(defsystem "senseglove_shared_resources-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "FingerDistanceFloats" :depends-on ("_package_FingerDistanceFloats"))
    (:file "_package_FingerDistanceFloats" :depends-on ("_package"))
    (:file "FingerDistances" :depends-on ("_package_FingerDistances"))
    (:file "_package_FingerDistances" :depends-on ("_package"))
    (:file "KinematicsVect3D" :depends-on ("_package_KinematicsVect3D"))
    (:file "_package_KinematicsVect3D" :depends-on ("_package"))
    (:file "SenseGloveState" :depends-on ("_package_SenseGloveState"))
    (:file "_package_SenseGloveState" :depends-on ("_package"))
  ))