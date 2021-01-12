enum FitbitErrorType {
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
}

abstract class FitbitError implements Exception{

  String message;
  FitbitErrorType type; 
  
  FitbitError({this.message = '', this.type = FitbitErrorType.DEFAULT});

  String toString();

}