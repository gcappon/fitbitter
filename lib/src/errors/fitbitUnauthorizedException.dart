import 'package:fitbitter/src/errors/fitbitException.dart';

/// [FitbitUnauthorizedException] is a class that implements the
/// [FitbitExceptionType.UNAUTHORIZED] exception.
class FitbitUnauthorizedException extends FitbitException {
  /// Default [FitbitUnauthorizedException] constructor.
  FitbitUnauthorizedException({
    FitbitExceptionType? type,
    String? message,
  }) : super(type: FitbitExceptionType.UNAUTHORIZED, message: message);

  @override
  String toString() {
    return 'FitbitUnauthorizedException [$type]: $message';
  } // toString
} // FitbitUnauthorizedException
