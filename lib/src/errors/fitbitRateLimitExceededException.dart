import 'fitbitException.dart';

class FitbitRateLimitExceededException extends FitbitException {
  FitbitRateLimitExceededException({
    FitbitExceptionType type,
    String message,
  }) : super(type: FitbitExceptionType.RATE_LIMIT_EXCEEDED, message: message);

  @override
  String toString() {
    return 'FitbitRateLimitExceededException [$type]: $message';
  }// toString
}// FitbitRateLimitExceededException
