import 'package:fitbitter/src/fitbitConnector.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitDeviceData.dart';

/// [FitbitDeviceAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitDeviceData].
class FitbitDeviceAPIURL extends FitbitAPIURL {
  /// Default [FitbitDeviceAPIURL] constructor.
  FitbitDeviceAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(url: url, fitbitCredentials: fitbitCredentials);

  /// Return a [FitbitDeviceAPIURL] from the given [fitbitCredentials].
  factory FitbitDeviceAPIURL.withCredentials(
      {required FitbitCredentials fitbitCredentials}) {
    final url = '${_getBaseURL(fitbitCredentials.userID)}.json';
    return FitbitDeviceAPIURL(fitbitCredentials: fitbitCredentials, url: url);
  } // FitbitDeviceAPIURL.withCredentials

  /// A private method that generates the base url of a [FitbitDeviceAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/devices';
  } // _getBaseURL

} // FitbitDeviceAPIURL
