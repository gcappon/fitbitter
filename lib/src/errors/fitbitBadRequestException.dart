import 'fitbitException.dart';

class FitbitBadRequestException extends FitbitException {
  FitbitBadRequestException({
    FitbitExceptionType type,
    String message,
  }) : super(type: FitbitExceptionType.BAD_REQUEST, message: message);

  @override
  String toString() {
    return 'FitbitBadRequestException [$type]: $message';
  }// toString
}// FitbitBadRequestException