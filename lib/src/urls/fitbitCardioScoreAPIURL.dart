import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitCardioScoreData.dart';

/// [FitbitCardioScoreAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitCardioScoreData].
class FitbitCardioScoreAPIURL extends FitbitAPIURL {
  /// Default [FitbitCardioScoreAPIURL] constructor.
  FitbitCardioScoreAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(
          url: url,
          fitbitCredentials: fitbitCredentials,
        );

  /// Generates a [FitbitCardioScoreAPIURL] to get [FitbitCardioScoreAPIURL] of a specific day [date].
  factory FitbitCardioScoreAPIURL.day(
      {required FitbitCredentials fitbitCredentials, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitCardioScoreAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitCardioScoreAPIURL.day

  /// Generates a [FitbitCardioScoreAPIURL] to get [FitbitCardioScoreData] of a specific date range
  /// between [startDate] and [endDate].
  factory FitbitCardioScoreAPIURL.dateRange(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitCardioScoreAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$startDateStr/$endDateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitCardioScoreAPIURL.dateRange

  /// A private method that generates the base url of a [FitbitCardioScoreAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/cardioscore';
  } // _getBaseURL

} // FitbitCardioScoreAPIURL
