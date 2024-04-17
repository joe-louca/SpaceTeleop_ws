// Auto-generated. Do not edit!

// (in-package senseglove_shared_resources.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let KinematicsVect3D = require('./KinematicsVect3D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SenseGloveState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.joint_names = null;
      this.position = null;
      this.absolute_velocity = null;
      this.hand_position = null;
      this.finger_tip_positions = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('joint_names')) {
        this.joint_names = initObj.joint_names
      }
      else {
        this.joint_names = [];
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = [];
      }
      if (initObj.hasOwnProperty('absolute_velocity')) {
        this.absolute_velocity = initObj.absolute_velocity
      }
      else {
        this.absolute_velocity = [];
      }
      if (initObj.hasOwnProperty('hand_position')) {
        this.hand_position = initObj.hand_position
      }
      else {
        this.hand_position = [];
      }
      if (initObj.hasOwnProperty('finger_tip_positions')) {
        this.finger_tip_positions = initObj.finger_tip_positions
      }
      else {
        this.finger_tip_positions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SenseGloveState
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [joint_names]
    bufferOffset = _arraySerializer.string(obj.joint_names, buffer, bufferOffset, null);
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float32(obj.position, buffer, bufferOffset, null);
    // Serialize message field [absolute_velocity]
    bufferOffset = _arraySerializer.float32(obj.absolute_velocity, buffer, bufferOffset, null);
    // Serialize message field [hand_position]
    // Serialize the length for message field [hand_position]
    bufferOffset = _serializer.uint32(obj.hand_position.length, buffer, bufferOffset);
    obj.hand_position.forEach((val) => {
      bufferOffset = KinematicsVect3D.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [finger_tip_positions]
    // Serialize the length for message field [finger_tip_positions]
    bufferOffset = _serializer.uint32(obj.finger_tip_positions.length, buffer, bufferOffset);
    obj.finger_tip_positions.forEach((val) => {
      bufferOffset = KinematicsVect3D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SenseGloveState
    let len;
    let data = new SenseGloveState(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [joint_names]
    data.joint_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [absolute_velocity]
    data.absolute_velocity = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [hand_position]
    // Deserialize array length for message field [hand_position]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.hand_position = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.hand_position[i] = KinematicsVect3D.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [finger_tip_positions]
    // Deserialize array length for message field [finger_tip_positions]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.finger_tip_positions = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.finger_tip_positions[i] = KinematicsVect3D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.joint_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 4 * object.position.length;
    length += 4 * object.absolute_velocity.length;
    length += 12 * object.hand_position.length;
    length += 12 * object.finger_tip_positions.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'senseglove_shared_resources/SenseGloveState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ca87b488181e10549b08892cbeda5ca5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # A message for senseglove data
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SenseGloveState(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.joint_names !== undefined) {
      resolved.joint_names = msg.joint_names;
    }
    else {
      resolved.joint_names = []
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = []
    }

    if (msg.absolute_velocity !== undefined) {
      resolved.absolute_velocity = msg.absolute_velocity;
    }
    else {
      resolved.absolute_velocity = []
    }

    if (msg.hand_position !== undefined) {
      resolved.hand_position = new Array(msg.hand_position.length);
      for (let i = 0; i < resolved.hand_position.length; ++i) {
        resolved.hand_position[i] = KinematicsVect3D.Resolve(msg.hand_position[i]);
      }
    }
    else {
      resolved.hand_position = []
    }

    if (msg.finger_tip_positions !== undefined) {
      resolved.finger_tip_positions = new Array(msg.finger_tip_positions.length);
      for (let i = 0; i < resolved.finger_tip_positions.length; ++i) {
        resolved.finger_tip_positions[i] = KinematicsVect3D.Resolve(msg.finger_tip_positions[i]);
      }
    }
    else {
      resolved.finger_tip_positions = []
    }

    return resolved;
    }
};

module.exports = SenseGloveState;
