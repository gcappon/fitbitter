import 'package:intl/intl.dart';

/// An utility calss that manages specific formats.
class Formats {
  /// The [DateFormat] 'yyyy-MM-dd'.
  static final onlyDayDateFormatTicks = new DateFormat('yyyy-MM-dd');

  /// The [DateFormat] 'HH:mm'.
  static final onlyTimeNoSecondsAMPM = new DateFormat('HH:mm');

  /// The [DateFormat] 'HH:mm:ss'.
  static final onlyTimeWithSeconds = new DateFormat(
      'HH:mm:ss'); //HH:range (0 to 23) - hours in 24 hours format
} //Formats
