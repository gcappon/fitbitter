class IntUtil {

  static _isDouble(dynamic aValue)  {
    return aValue is double;
  }

  static int nullCheck(dynamic aValue, int aDefault) {
    if (aValue == null) {
      return aDefault;
    }
    if (_isDouble(aValue)) {
      return (aValue as double).toInt();
    }
    return aValue;
  }
}