import 'package:fitbitter/src/errors/fitbitException.dart';

/// [FitbitUnaexistentFitbitResourceException] is a class that implements the
/// [FitbitExceptionType.UNEXISTENT_FITBIT_REQUEST] exception.
class FitbitUnaexistentFitbitResourceException extends FitbitException {
  /// Default [FitbitUnaexistentFitbitResourceException] constructor.
  FitbitUnaexistentFitbitResourceException({
    FitbitExceptionType? type,
    String? message,
  }) : super(
            type: FitbitExceptionType.UNEXISTENT_FITBIT_REQUEST,
            message: message);

  @override
  String toString() {
    return 'FitbitUnaexistentFitbitResourceException [$type]: $message';
  } // toString
} // FitbitUnaexistentFitbitResourceException
