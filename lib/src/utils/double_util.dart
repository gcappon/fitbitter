class DoubleUtil {

  static bool _isInt(dynamic aValue) {
    return aValue is int;
  }
  
  static double nullCheck(dynamic aValue, double aDefault) {
    if (aValue == null) {
      return aDefault;
    }
    if (_isInt(aValue)) {
      return (aValue as int).toDouble();
    } else {
      return aValue;
    }
  }
}