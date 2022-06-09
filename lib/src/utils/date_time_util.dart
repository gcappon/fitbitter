class DateTimeUtil {

  static DateTime nullCheck(dynamic aValue, DateTime aDefault) {
    if (aValue == null) {
      return aDefault;
    }
    return aValue;
  }

  static DateTime join(DateTime aDate, DateTime aTime)  {
    return DateTime(aDate.year, aDate.month, aDate.day, aTime.hour, aTime.minute);
  }
}