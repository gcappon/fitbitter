import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitActivityData.dart';

/// [FitbitActivityAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitActivityData].
class FitbitActivityAPIURL extends FitbitAPIURL {
  /// Default [FitbitActivityAPIURL] constructor.
  FitbitActivityAPIURL(
      {required String url, required FitbitCredentials? fitbitCredentials})
      : super(fitbitCredentials: fitbitCredentials, url: url);

  /// Generates a [FitbitActivityAPIURL] to get [FitbitActivityData] of a
  /// specific day [date] and credentials [fitbitCredentials].
  factory FitbitActivityAPIURL.day(
      {required FitbitCredentials fitbitCredentials, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitActivityAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityAPIURL.day

  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/activities';
  } // _getBaseURL

} // FitbitActivityTimeseriesAPIURL
