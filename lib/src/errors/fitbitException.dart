/// An enumerator defining the possible types of [FitbitException].
enum FitbitExceptionType {
  /// It occurs when the Fitbit API resource is not found
  NOT_FOUND,

  /// It occurs when there are no sufficent permissions to resolve the request.
  FORBIDDEN,

  ///It occurs when the request URL is bad formatted (it should never happen).
  BAD_REQUEST,

  /// When the requester has no permissions to resolve the request.
  UNAUTHORIZED,

  /// When the rate limit is exceeded.
  RATE_LIMIT_EXCEEDED,

  /// Default error type.
  DEFAULT,

  /// When the requested resource does not exist
  UNEXISTENT_FITBIT_REQUEST,
} // FitbitExceptionType

/// [FitbitException] is an abstract class defining an [Exception] that
/// can be thrown by fitbitter.
abstract class FitbitException implements Exception {
  /// The [FitbitException] method.
  String? message;

  /// The type of the [FitbitException].
  FitbitExceptionType type;

  /// Default [FitbitException] constructor.
  FitbitException({this.message = '', this.type = FitbitExceptionType.DEFAULT});

  /// Returns the string representation of this object.
  String toString();
} // FitbitException
