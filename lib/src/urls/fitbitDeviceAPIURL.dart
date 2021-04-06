import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

/// [FitbitDeviceAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitDeviceData].
class FitbitDeviceAPIURL extends FitbitAPIURL {
  /// Default [FitbitDeviceAPIURL] constructor.
  FitbitDeviceAPIURL({String? url, String? userID})
      : super(
          url: url,
          userID: userID,
        );

  /// factory constructor
  factory FitbitDeviceAPIURL.withUserID({String? userID}) => FitbitDeviceAPIURL(
        url: '${_getBaseURL(userID)}.json',
        userID: userID,
      );

  /// A private method that generates the base url of a [FitbitDeviceAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/devices';
  } // _getBaseURL

} // FitbitDeviceAPIURL
