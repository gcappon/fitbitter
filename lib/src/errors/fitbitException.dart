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
}

abstract class FitbitException implements Exception{

  String message;
  FitbitExceptionType type; 
  
  FitbitException({this.message = '', this.type = FitbitExceptionType.DEFAULT});

  String toString();

}