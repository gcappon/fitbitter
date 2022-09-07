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
      : super(url: url, fitbitCredentials: fitbitCredentials);

  /// Return a [FitbitAccountAPIURL] from the given [fitbitCredentials].
  factory FitbitAccountAPIURL.withCredentials(
      {required FitbitCredentials fitbitCredentials}) {
    final url = '${_getBaseURL()}.json';
    return FitbitAccountAPIURL(fitbitCredentials: fitbitCredentials, url: url);
  } // FitbitAccountAPIURL.withCredentials

  /// A private method that generates the base url of a [FitbitAccountAPIURL].
  static String _getBaseURL() {
    return 'https://api.fitbit.com/1/user';
  } // _getBaseURL

} // FitbitAccountAPIURL
