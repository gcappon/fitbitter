class BoolUtil {

  static bool nullCheck(dynamic aValue, bool aDefault) {
    if (aValue == null) {
      return aDefault;
    }
    return aValue;
  }

}