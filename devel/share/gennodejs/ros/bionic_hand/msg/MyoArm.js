// Auto-generated. Do not edit!

// (in-package bionic_hand.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MyoArm {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.arm = null;
      this.xdir = null;
    }
    else {
      if (initObj.hasOwnProperty('arm')) {
        this.arm = initObj.arm
      }
      else {
        this.arm = 0;
      }
      if (initObj.hasOwnProperty('xdir')) {
        this.xdir = initObj.xdir
      }
      else {
        this.xdir = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MyoArm
    // Serialize message field [arm]
    bufferOffset = _serializer.uint8(obj.arm, buffer, bufferOffset);
    // Serialize message field [xdir]
    bufferOffset = _serializer.uint8(obj.xdir, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MyoArm
    let len;
    let data = new MyoArm(null);
    // Deserialize message field [arm]
    data.arm = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [xdir]
    data.xdir = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'bionic_hand/MyoArm';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '18b76488390e8ae3f8451095f1b48ad8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Arm message for the Thalmic Myo. Using firmware > 1.0, 
    # Thalmic Gesture Recognition is possible after sync gesture is performed.
    
    # arm represents which arm the device is on
    uint8 UNKNOWN=0
    uint8 RIGHT=1
    uint8 LEFT=2
    uint8 arm
    
    # xdir represents the direction of the x-axis
    # Sharing UNKNOWN=0
    uint8 X_TOWARD_WRIST=11
    uint8 X_TOWARD_ELBOW=12
    uint8 xdir
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MyoArm(null);
    if (msg.arm !== undefined) {
      resolved.arm = msg.arm;
    }
    else {
      resolved.arm = 0
    }

    if (msg.xdir !== undefined) {
      resolved.xdir = msg.xdir;
    }
    else {
      resolved.xdir = 0
    }

    return resolved;
    }
};

// Constants for message
MyoArm.Constants = {
  UNKNOWN: 0,
  RIGHT: 1,
  LEFT: 2,
  X_TOWARD_WRIST: 11,
  X_TOWARD_ELBOW: 12,
}

module.exports = MyoArm;
