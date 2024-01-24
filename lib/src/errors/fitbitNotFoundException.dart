import 'package:fitbitter/src/errors/fitbitException.dart';

/// [FitbitNotFoundException] is a class that implements the
/// [FitbitExceptionType.NOT_FOUND] exception.
class FitbitNotFoundException extends FitbitException {
  /// Default [FitbitNotFoundException] constructor.
  FitbitNotFoundException({
    FitbitExceptionType? type,
    String? message,
  }) : super(type: FitbitExceptionType.NOT_FOUND, message: message);

  @override
  String toString() {
    return 'FitbitNotFoundException [$type]: $message';
  } // toString
} // FitbitAPINotFoundException
