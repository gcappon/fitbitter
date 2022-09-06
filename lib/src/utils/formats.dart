import 'package:intl/intl.dart';

/// An utility calss that manages specific formats.
class Formats {
  /// The [DateFormat] 'yyyy-MM-dd HH:mm:ss'.
  static final fullDateFormat = new DateFormat('yyyy-MM-dd HH:mm:ss');

  /// The [DateFormat] 'yyyy/MM/dd'.
  static final onlyDayDateFormat = new DateFormat('yyyy/MM/dd');

  /// The [DateFormat] 'yyyy-MM-dd'.
  static final onlyDayDateFormatTicks = new DateFormat('yyyy-MM-dd');

  /// The [DateFormat] 'KK:mm'.
  static final onlyTimeNoSeconds = new DateFormat('KK:mm');

  /// The [DateFormat] 'HH:mm'.
  static final onlyTimeNoSecondsAMPM = new DateFormat('HH:mm');
} //Formats
