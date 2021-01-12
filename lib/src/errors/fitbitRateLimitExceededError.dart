import 'fitbitError.dart';

class FitbitRateLimitExceededError extends FitbitError {
  FitbitRateLimitExceededError({
    FitbitErrorType type,
    String message,
  }) : super(type: FitbitErrorType.RATE_LIMIT_EXCEEDED, message: message);

  @override
  String toString() {
    return 'FitbitRateLimitExceededError [$type]: $message';
  }// toString
}// FitbitRateLimitExceededError
