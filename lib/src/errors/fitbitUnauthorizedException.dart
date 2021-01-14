import 'fitbitException.dart';

class FitbitUnauthorizedException extends FitbitException {
  FitbitUnauthorizedException({
    FitbitExceptionType type,
    String message,
  }) : super(type: FitbitExceptionType.UNAUTHORIZED, message: message);

  @override
  String toString() {
    return 'FitbitUnauthorizedException [$type]: $message';
  }// toString
}// FitbitUnauthorizedException