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
  UNEXISTENT_FITBIT_REQUEST;

  factory FitbitExceptionType.fromCode(int? code) {
    switch (code) {
      case 400:
        return FitbitExceptionType.BAD_REQUEST;
      case 401:
        return FitbitExceptionType.UNAUTHORIZED;
      case 403:
        return FitbitExceptionType.FORBIDDEN;
      case 404:
        return FitbitExceptionType.NOT_FOUND;
      case 429:
        return FitbitExceptionType.RATE_LIMIT_EXCEEDED;
      default:
        return FitbitExceptionType.DEFAULT;
    }
  }
}

/// [FitbitException] is an abstract class defining an [Exception] that
/// can be thrown by fitbitter.
class FitbitException implements Exception {
  /// The [FitbitException] method.
  String? message;

  /// The type of the [FitbitException].
  FitbitExceptionType type;

  /// The status code of the [FitbitException].
  int? statusCode;

  /// Default [FitbitException] constructor.
  FitbitException({
    this.statusCode,
    this.message = '',
    this.type = FitbitExceptionType.DEFAULT,
  });

  /// Returns the string representation of this object.
  String toString();
} // FitbitException
