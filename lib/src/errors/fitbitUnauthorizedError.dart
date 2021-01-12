import 'fitbitError.dart';

class FitbitUnauthorizedError extends FitbitError {
  FitbitUnauthorizedError({
    FitbitErrorType type,
    String message,
  }) : super(type: FitbitErrorType.UNAUTHORIZED, message: message);

  @override
  String toString() {
    return 'FitbitUnauthorizedError [$type]: $message';
  }// toString
}// FitbitUnauthorizedError