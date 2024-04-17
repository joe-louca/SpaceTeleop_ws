;; Auto-generated. Do not edit!


(when (boundp 'senseglove_shared_resources::FingerDistances)
  (if (not (find-package "SENSEGLOVE_SHARED_RESOURCES"))
    (make-package "SENSEGLOVE_SHARED_RESOURCES"))
  (shadow 'FingerDistances (find-package "SENSEGLOVE_SHARED_RESOURCES")))
(unless (find-package "SENSEGLOVE_SHARED_RESOURCES::FINGERDISTANCES")
  (make-package "SENSEGLOVE_SHARED_RESOURCES::FINGERDISTANCES"))

(in-package "ROS")
;;//! \htmlinclude FingerDistances.msg.html


(defclass senseglove_shared_resources::FingerDistances
  :super ros::object
  :slots (_thumb_index _thumb_middle _thumb_ring _thumb_pinky ))

(defmethod senseglove_shared_resources::FingerDistances
  (:init
   (&key
    ((:thumb_index __thumb_index) 0.0)
    ((:thumb_middle __thumb_middle) 0.0)
    ((:thumb_ring __thumb_ring) 0.0)
    ((:thumb_pinky __thumb_pinky) 0.0)
    )
   (send-super :init)
   (setq _thumb_index (float __thumb_index))
   (setq _thumb_middle (float __thumb_middle))
   (setq _thumb_ring (float __thumb_ring))
   (setq _thumb_pinky (float __thumb_pinky))
   self)
  (:thumb_index
   (&optional __thumb_index)
   (if __thumb_index (setq _thumb_index __thumb_index)) _thumb_index)
  (:thumb_middle
   (&optional __thumb_middle)
   (if __thumb_middle (setq _thumb_middle __thumb_middle)) _thumb_middle)
  (:thumb_ring
   (&optional __thumb_ring)
   (if __thumb_ring (setq _thumb_ring __thumb_ring)) _thumb_ring)
  (:thumb_pinky
   (&optional __thumb_pinky)
   (if __thumb_pinky (setq _thumb_pinky __thumb_pinky)) _thumb_pinky)
  (:serialization-length
   ()
   (+
    ;; float32 _thumb_index
    4
    ;; float32 _thumb_middle
    4
    ;; float32 _thumb_ring
    4
    ;; float32 _thumb_pinky
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _thumb_index
       (sys::poke _thumb_index (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _thumb_middle
       (sys::poke _thumb_middle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _thumb_ring
       (sys::poke _thumb_ring (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _thumb_pinky
       (sys::poke _thumb_pinky (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _thumb_index
     (setq _thumb_index (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _thumb_middle
     (setq _thumb_middle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _thumb_ring
     (setq _thumb_ring (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _thumb_pinky
     (setq _thumb_pinky (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get senseglove_shared_resources::FingerDistances :md5sum-) "7c9951a7d85c69ea7ca7247b7088916a")
(setf (get senseglove_shared_resources::FingerDistances :datatype-) "senseglove_shared_resources/FingerDistances")
(setf (get senseglove_shared_resources::FingerDistances :definition-)
      "float32 thumb_index
float32 thumb_middle
float32 thumb_ring
float32 thumb_pinky
")



(provide :senseglove_shared_resources/FingerDistances "7c9951a7d85c69ea7ca7247b7088916a")


