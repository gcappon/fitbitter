import 'fitbitError.dart';

class FitbitBadRequestError extends FitbitError {
  FitbitBadRequestError({
    FitbitErrorType type,
    String message,
  }) : super(type: FitbitErrorType.BAD_REQUEST, message: message);

  @override
  String toString() {
    return 'FitbitBadRequestError [$type]: $message';
  }// toString
}// FitbitBadRequestError