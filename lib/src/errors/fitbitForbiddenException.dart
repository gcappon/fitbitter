import 'package:fitbitter/src/errors/fitbitException.dart';

/// [FitbitForbiddenException] is a class that implements the
/// [FitbitExceptionType.FORBIDDEN] exception.
class FitbitForbiddenException extends FitbitException {
  /// Default [FitbitForbiddenException] constructor.
  FitbitForbiddenException({
    FitbitExceptionType? type,
    String? message,
  }) : super(type: FitbitExceptionType.FORBIDDEN, message: message);

  @override
  String toString() {
    return 'FitbitForbiddenException [$type]: $message';
  } // toString
} // FitbitForbiddenException
