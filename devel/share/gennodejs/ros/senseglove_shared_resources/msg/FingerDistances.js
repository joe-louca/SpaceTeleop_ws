// Auto-generated. Do not edit!

// (in-package senseglove_shared_resources.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class FingerDistances {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.thumb_index = null;
      this.thumb_middle = null;
      this.thumb_ring = null;
      this.thumb_pinky = null;
    }
    else {
      if (initObj.hasOwnProperty('thumb_index')) {
        this.thumb_index = initObj.thumb_index
      }
      else {
        this.thumb_index = 0.0;
      }
      if (initObj.hasOwnProperty('thumb_middle')) {
        this.thumb_middle = initObj.thumb_middle
      }
      else {
        this.thumb_middle = 0.0;
      }
      if (initObj.hasOwnProperty('thumb_ring')) {
        this.thumb_ring = initObj.thumb_ring
      }
      else {
        this.thumb_ring = 0.0;
      }
      if (initObj.hasOwnProperty('thumb_pinky')) {
        this.thumb_pinky = initObj.thumb_pinky
      }
      else {
        this.thumb_pinky = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FingerDistances
    // Serialize message field [thumb_index]
    bufferOffset = _serializer.float32(obj.thumb_index, buffer, bufferOffset);
    // Serialize message field [thumb_middle]
    bufferOffset = _serializer.float32(obj.thumb_middle, buffer, bufferOffset);
    // Serialize message field [thumb_ring]
    bufferOffset = _serializer.float32(obj.thumb_ring, buffer, bufferOffset);
    // Serialize message field [thumb_pinky]
    bufferOffset = _serializer.float32(obj.thumb_pinky, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FingerDistances
    let len;
    let data = new FingerDistances(null);
    // Deserialize message field [thumb_index]
    data.thumb_index = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [thumb_middle]
    data.thumb_middle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [thumb_ring]
    data.thumb_ring = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [thumb_pinky]
    data.thumb_pinky = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'senseglove_shared_resources/FingerDistances';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7c9951a7d85c69ea7ca7247b7088916a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 thumb_index
    float32 thumb_middle
    float32 thumb_ring
    float32 thumb_pinky
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FingerDistances(null);
    if (msg.thumb_index !== undefined) {
      resolved.thumb_index = msg.thumb_index;
    }
    else {
      resolved.thumb_index = 0.0
    }

    if (msg.thumb_middle !== undefined) {
      resolved.thumb_middle = msg.thumb_middle;
    }
    else {
      resolved.thumb_middle = 0.0
    }

    if (msg.thumb_ring !== undefined) {
      resolved.thumb_ring = msg.thumb_ring;
    }
    else {
      resolved.thumb_ring = 0.0
    }

    if (msg.thumb_pinky !== undefined) {
      resolved.thumb_pinky = msg.thumb_pinky;
    }
    else {
      resolved.thumb_pinky = 0.0
    }

    return resolved;
    }
};

module.exports = FingerDistances;
