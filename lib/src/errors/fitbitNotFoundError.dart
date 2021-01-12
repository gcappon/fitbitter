import 'fitbitError.dart';

class FitbitNotFoundError extends FitbitError {
  FitbitNotFoundError({
    FitbitErrorType type,
    String message,
  }) : super(type: FitbitErrorType.NOT_FOUND, message: message);

  @override
  String toString() {
    return 'FitbitNotFoundError [$type]: $message';
  }// toString
}// FitbitAPINotFoundError
