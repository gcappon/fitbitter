import 'fitbitAPIURL.dart';

class FitbitDeviceAPIURL extends FitbitAPIURL {
  /// Default constructor
  FitbitDeviceAPIURL({String url, String userID})
      : super(
          url: url,
          userID: userID,
        );

  /// factory constructor
  factory FitbitDeviceAPIURL.withUserID({String userID}) => FitbitDeviceAPIURL(
      url: '${_getBaseURL(userID)}.json',
      userID: userID,
    );
  
  static String _getBaseURL(String userID){
    return 'https://api.fitbit.com/1/user/$userID/devices';
  }// _getBaseURL

} // FitbitDeviceAPIURL