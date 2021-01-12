import 'fitbitError.dart';

class FitbitForbiddenError extends FitbitError {
  FitbitForbiddenError({
    FitbitErrorType type,
    String message,
  }) : super(type: FitbitErrorType.FORBIDDEN, message: message);

  @override
  String toString() {
    return 'FitbitForbiddenError [$type]: $message';
  }// toString
}// FitbitForbiddenError
