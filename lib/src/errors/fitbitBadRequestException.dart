import 'package:fitbitter/src/errors/fitbitException.dart';

/// [FitbitBadRequestException] is a class that implements the
/// [FitbitExceptionType.BAD_REQUEST] exception.
class FitbitBadRequestException extends FitbitException {
  /// Default [FitbitBadRequestException] constructor.
  FitbitBadRequestException({
    FitbitExceptionType? type,
    String? message,
  }) : super(type: FitbitExceptionType.BAD_REQUEST, message: message);

  @override
  String toString() {
    return 'FitbitBadRequestException [$type]: $message';
  } // toString
} // FitbitBadRequestException
