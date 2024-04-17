;; Auto-generated. Do not edit!


(when (boundp 'senseglove_shared_resources::Calibrate)
  (if (not (find-package "SENSEGLOVE_SHARED_RESOURCES"))
    (make-package "SENSEGLOVE_SHARED_RESOURCES"))
  (shadow 'Calibrate (find-package "SENSEGLOVE_SHARED_RESOURCES")))
(unless (find-package "SENSEGLOVE_SHARED_RESOURCES::CALIBRATE")
  (make-package "SENSEGLOVE_SHARED_RESOURCES::CALIBRATE"))
(unless (find-package "SENSEGLOVE_SHARED_RESOURCES::CALIBRATEREQUEST")
  (make-package "SENSEGLOVE_SHARED_RESOURCES::CALIBRATEREQUEST"))
(unless (find-package "SENSEGLOVE_SHARED_RESOURCES::CALIBRATERESPONSE")
  (make-package "SENSEGLOVE_SHARED_RESOURCES::CALIBRATERESPONSE"))

(in-package "ROS")





(defclass senseglove_shared_resources::CalibrateRequest
  :super ros::object
  :slots (_name ))

(defmethod senseglove_shared_resources::CalibrateRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass senseglove_shared_resources::CalibrateResponse
  :super ros::object
  :slots (_success ))

(defmethod senseglove_shared_resources::CalibrateResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass senseglove_shared_resources::Calibrate
  :super ros::object
  :slots ())

(setf (get senseglove_shared_resources::Calibrate :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get senseglove_shared_resources::Calibrate :datatype-) "senseglove_shared_resources/Calibrate")
(setf (get senseglove_shared_resources::Calibrate :request) senseglove_shared_resources::CalibrateRequest)
(setf (get senseglove_shared_resources::Calibrate :response) senseglove_shared_resources::CalibrateResponse)

(defmethod senseglove_shared_resources::CalibrateRequest
  (:response () (instance senseglove_shared_resources::CalibrateResponse :init)))

(setf (get senseglove_shared_resources::CalibrateRequest :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get senseglove_shared_resources::CalibrateRequest :datatype-) "senseglove_shared_resources/CalibrateRequest")
(setf (get senseglove_shared_resources::CalibrateRequest :definition-)
      "# A service to request calibration

string name  # Optional: name for this calibration profile
---
bool success

")

(setf (get senseglove_shared_resources::CalibrateResponse :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get senseglove_shared_resources::CalibrateResponse :datatype-) "senseglove_shared_resources/CalibrateResponse")
(setf (get senseglove_shared_resources::CalibrateResponse :definition-)
      "# A service to request calibration

string name  # Optional: name for this calibration profile
---
bool success

")



(provide :senseglove_shared_resources/Calibrate "d08a3b641c2f8680fbdfb1ea2e17a3e1")


