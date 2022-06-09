class StringUtil {

  static String nullCheck(dynamic aValue, String aDefault) {
    if (aValue == null) {
      return aDefault;
    }
    return aValue;
  }
}