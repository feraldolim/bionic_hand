# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from bionic_hand/EmgArray.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class EmgArray(genpy.Message):
  _md5sum = "926d498bb3e9f898f2a3ff6ed5aff58c"
  _type = "bionic_hand/EmgArray"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# EmgArray message for the Thalmic Myo, which has 8 EMG sensors 
# arranged around the arm
# There is a moving field that's unclear what it is looks like a bitmask

int16[8] data
int16 moving
"""
  __slots__ = ['data','moving']
  _slot_types = ['int16[8]','int16']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       data,moving

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(EmgArray, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.data is None:
        self.data = [0] * 8
      if self.moving is None:
        self.moving = 0
    else:
      self.data = [0] * 8
      self.moving = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      buff.write(_get_struct_8h().pack(*self.data))
      buff.write(_get_struct_h().pack(self.moving))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      start = end
      end += 16
      self.data = _get_struct_8h().unpack(str[start:end])
      start = end
      end += 2
      (self.moving,) = _get_struct_h().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      buff.write(self.data.tostring())
      buff.write(_get_struct_h().pack(self.moving))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      start = end
      end += 16
      self.data = numpy.frombuffer(str[start:end], dtype=numpy.int16, count=8)
      start = end
      end += 2
      (self.moving,) = _get_struct_h().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_h = None
def _get_struct_h():
    global _struct_h
    if _struct_h is None:
        _struct_h = struct.Struct("<h")
    return _struct_h
_struct_8h = None
def _get_struct_8h():
    global _struct_8h
    if _struct_8h is None:
        _struct_8h = struct.Struct("<8h")
    return _struct_8h
