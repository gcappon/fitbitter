import 'fitbitException.dart';

class FitbitForbiddenException extends FitbitException {
  FitbitForbiddenException({
    FitbitExceptionType type,
    String message,
  }) : super(type: FitbitExceptionType.FORBIDDEN, message: message);

  @override
  String toString() {
    return 'FitbitForbiddenException [$type]: $message';
  }// toString
}// FitbitForbiddenException
