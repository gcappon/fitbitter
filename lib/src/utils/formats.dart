import 'package:intl/intl.dart';

class Formats {
  static final fullDateFormat = new DateFormat('yyyy-MM-dd HH:mm:ss');
  static final onlyDayDateFormat = new DateFormat('yyyy/MM/dd');
  static final onlyDayDateFormatTicks = new DateFormat('yyyy-MM-dd');
  static final onlyTimeNoSeconds = new DateFormat('KK:mm');
} //Formats