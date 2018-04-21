// Auto-generated. Do not edit!

// (in-package ros_myo.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MyoPose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pose = null;
    }
    else {
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MyoPose
    // Serialize message field [pose]
    bufferOffset = _serializer.uint8(obj.pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MyoPose
    let len;
    let data = new MyoPose(null);
    // Deserialize message field [pose]
    data.pose = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ros_myo/MyoPose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '056fd823a1b40e3fef451ecc8dcf5690';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Pose message
    uint8 REST = 1
    uint8 FIST = 2
    uint8 WAVE_IN = 3
    uint8 WAVE_OUT = 4
    uint8 FINGERS_SPREAD = 5
    uint8 THUMB_TO_PINKY = 6
    uint8 UNKNOWN = 0
    uint8 pose
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MyoPose(null);
    if (msg.pose !== undefined) {
      resolved.pose = msg.pose;
    }
    else {
      resolved.pose = 0
    }

    return resolved;
    }
};

// Constants for message
MyoPose.Constants = {
  REST: 1,
  FIST: 2,
  WAVE_IN: 3,
  WAVE_OUT: 4,
  FINGERS_SPREAD: 5,
  THUMB_TO_PINKY: 6,
  UNKNOWN: 0,
}

module.exports = MyoPose;
