import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitAccountData.dart';

/// [FitbitAccountAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitAccountData].
class FitbitAccountAPIURL extends FitbitAPIURL {
  /// Default [FitbitAccountAPIURL] constructor.
  FitbitAccountAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(url: url, fitbitCredentials: fitbitCredentials) {
    this.url = '${_getBaseURL()}.json';
    this.fitbitCredentials = fitbitCredentials;
  }

  /// A private method that generates the base url of a [FitbitAccountAPIURL].
  static String _getBaseURL() {
    return 'https://api.fitbit.com/1/user';
  } // _getBaseURL

} // FitbitAccountAPIURL
