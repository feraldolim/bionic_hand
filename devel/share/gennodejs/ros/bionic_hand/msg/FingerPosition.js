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

class FingerPosition {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.position = null;
      this.finger1 = null;
      this.finger2 = null;
      this.finger3 = null;
      this.finger4 = null;
      this.finger5 = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = [];
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = [];
      }
      if (initObj.hasOwnProperty('finger1')) {
        this.finger1 = initObj.finger1
      }
      else {
        this.finger1 = 0;
      }
      if (initObj.hasOwnProperty('finger2')) {
        this.finger2 = initObj.finger2
      }
      else {
        this.finger2 = 0;
      }
      if (initObj.hasOwnProperty('finger3')) {
        this.finger3 = initObj.finger3
      }
      else {
        this.finger3 = 0;
      }
      if (initObj.hasOwnProperty('finger4')) {
        this.finger4 = initObj.finger4
      }
      else {
        this.finger4 = 0;
      }
      if (initObj.hasOwnProperty('finger5')) {
        this.finger5 = initObj.finger5
      }
      else {
        this.finger5 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FingerPosition
    // Serialize message field [name]
    bufferOffset = _arraySerializer.string(obj.name, buffer, bufferOffset, null);
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float64(obj.position, buffer, bufferOffset, null);
    // Serialize message field [finger1]
    bufferOffset = _serializer.int32(obj.finger1, buffer, bufferOffset);
    // Serialize message field [finger2]
    bufferOffset = _serializer.int32(obj.finger2, buffer, bufferOffset);
    // Serialize message field [finger3]
    bufferOffset = _serializer.int32(obj.finger3, buffer, bufferOffset);
    // Serialize message field [finger4]
    bufferOffset = _serializer.int32(obj.finger4, buffer, bufferOffset);
    // Serialize message field [finger5]
    bufferOffset = _serializer.int32(obj.finger5, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FingerPosition
    let len;
    let data = new FingerPosition(null);
    // Deserialize message field [name]
    data.name = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [finger1]
    data.finger1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [finger2]
    data.finger2 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [finger3]
    data.finger3 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [finger4]
    data.finger4 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [finger5]
    data.finger5 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.name.forEach((val) => {
      length += 4 + val.length;
    });
    length += 8 * object.position.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'bionic_hand/FingerPosition';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ff4dd92cbc5633d3b65693952f22ad1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] name
    float64[] position
    int32 finger1
    int32 finger2
    int32 finger3
    int32 finger4
    int32 finger5
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FingerPosition(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = []
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = []
    }

    if (msg.finger1 !== undefined) {
      resolved.finger1 = msg.finger1;
    }
    else {
      resolved.finger1 = 0
    }

    if (msg.finger2 !== undefined) {
      resolved.finger2 = msg.finger2;
    }
    else {
      resolved.finger2 = 0
    }

    if (msg.finger3 !== undefined) {
      resolved.finger3 = msg.finger3;
    }
    else {
      resolved.finger3 = 0
    }

    if (msg.finger4 !== undefined) {
      resolved.finger4 = msg.finger4;
    }
    else {
      resolved.finger4 = 0
    }

    if (msg.finger5 !== undefined) {
      resolved.finger5 = msg.finger5;
    }
    else {
      resolved.finger5 = 0
    }

    return resolved;
    }
};

module.exports = FingerPosition;
