import 'fitbitException.dart';

class FitbitUnaexistentFitbitResourceException extends FitbitException {
  FitbitUnaexistentFitbitResourceException({
    FitbitExceptionType type,
    String message,
  }) : super(type: FitbitExceptionType.UNEXISTENT_FITBIT_REQUEST, message: message);

  @override
  String toString() {
    return 'FitbitUnaexistentFitbitResourceException [$type]: $message';
  }// toString
}// FitbitUnaexistentFitbitResourceException