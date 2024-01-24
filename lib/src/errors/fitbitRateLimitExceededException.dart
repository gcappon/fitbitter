import 'package:fitbitter/src/errors/fitbitException.dart';

/// [FitbitRateLimitExceededException] is a class that implements the
/// [FitbitExceptionType.RATE_LIMIT_EXCEEDED] exception.
class FitbitRateLimitExceededException extends FitbitException {
  /// Default [FitbitRateLimitExceededException] constructor.
  FitbitRateLimitExceededException({
    FitbitExceptionType? type,
    String? message,
  }) : super(type: FitbitExceptionType.RATE_LIMIT_EXCEEDED, message: message);

  @override
  String toString() {
    return 'FitbitRateLimitExceededException [$type]: $message';
  } // toString
} // FitbitRateLimitExceededException
