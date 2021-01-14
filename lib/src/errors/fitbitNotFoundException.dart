import 'fitbitException.dart';

class FitbitNotFoundException extends FitbitException {
  FitbitNotFoundException({
    FitbitExceptionType type,
    String message,
  }) : super(type: FitbitExceptionType.NOT_FOUND, message: message);

  @override
  String toString() {
    return 'FitbitNotFoundException [$type]: $message';
  }// toString
}// FitbitAPINotFoundException
