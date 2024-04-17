// Auto-generated. Do not edit!

// (in-package senseglove_shared_resources.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class FingerDistanceFloats {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.th_ff = null;
      this.th_mf = null;
      this.th_rf = null;
      this.th_lf = null;
    }
    else {
      if (initObj.hasOwnProperty('th_ff')) {
        this.th_ff = initObj.th_ff
      }
      else {
        this.th_ff = new std_msgs.msg.Float64();
      }
      if (initObj.hasOwnProperty('th_mf')) {
        this.th_mf = initObj.th_mf
      }
      else {
        this.th_mf = new std_msgs.msg.Float64();
      }
      if (initObj.hasOwnProperty('th_rf')) {
        this.th_rf = initObj.th_rf
      }
      else {
        this.th_rf = new std_msgs.msg.Float64();
      }
      if (initObj.hasOwnProperty('th_lf')) {
        this.th_lf = initObj.th_lf
      }
      else {
        this.th_lf = new std_msgs.msg.Float64();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FingerDistanceFloats
    // Serialize message field [th_ff]
    bufferOffset = std_msgs.msg.Float64.serialize(obj.th_ff, buffer, bufferOffset);
    // Serialize message field [th_mf]
    bufferOffset = std_msgs.msg.Float64.serialize(obj.th_mf, buffer, bufferOffset);
    // Serialize message field [th_rf]
    bufferOffset = std_msgs.msg.Float64.serialize(obj.th_rf, buffer, bufferOffset);
    // Serialize message field [th_lf]
    bufferOffset = std_msgs.msg.Float64.serialize(obj.th_lf, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FingerDistanceFloats
    let len;
    let data = new FingerDistanceFloats(null);
    // Deserialize message field [th_ff]
    data.th_ff = std_msgs.msg.Float64.deserialize(buffer, bufferOffset);
    // Deserialize message field [th_mf]
    data.th_mf = std_msgs.msg.Float64.deserialize(buffer, bufferOffset);
    // Deserialize message field [th_rf]
    data.th_rf = std_msgs.msg.Float64.deserialize(buffer, bufferOffset);
    // Deserialize message field [th_lf]
    data.th_lf = std_msgs.msg.Float64.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'senseglove_shared_resources/FingerDistanceFloats';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '645d53f7de8b68c040fc08d5668ceb96';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Float64 th_ff  # thumb to index finger
    std_msgs/Float64 th_mf  # thumb to middle finger
    std_msgs/Float64 th_rf  # thumb to ring finger
    std_msgs/Float64 th_lf  # future when pink is on shadow hand
    
    ================================================================================
    MSG: std_msgs/Float64
    float64 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FingerDistanceFloats(null);
    if (msg.th_ff !== undefined) {
      resolved.th_ff = std_msgs.msg.Float64.Resolve(msg.th_ff)
    }
    else {
      resolved.th_ff = new std_msgs.msg.Float64()
    }

    if (msg.th_mf !== undefined) {
      resolved.th_mf = std_msgs.msg.Float64.Resolve(msg.th_mf)
    }
    else {
      resolved.th_mf = new std_msgs.msg.Float64()
    }

    if (msg.th_rf !== undefined) {
      resolved.th_rf = std_msgs.msg.Float64.Resolve(msg.th_rf)
    }
    else {
      resolved.th_rf = new std_msgs.msg.Float64()
    }

    if (msg.th_lf !== undefined) {
      resolved.th_lf = std_msgs.msg.Float64.Resolve(msg.th_lf)
    }
    else {
      resolved.th_lf = new std_msgs.msg.Float64()
    }

    return resolved;
    }
};

module.exports = FingerDistanceFloats;
