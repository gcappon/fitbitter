import 'package:fitbitter/src/fitbitConnector.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitHeartRateData.dart';

/// [FitbitHeartRateData] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitHeartRateData].
class FitbitHeartRateAPIURL extends FitbitAPIURL {
  /// Default [FitbitHeartRateData] constructor.
  FitbitHeartRateAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(
          url: url,
          fitbitCredentials: fitbitCredentials,
        );

  /// Generates a [FitbitHeartRateAPIURL] to get [FitbitHeartRateData] of a specific day [date].
  factory FitbitHeartRateAPIURL.day(
      {required FitbitCredentials fitbitCredentials, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitHeartRateAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr/1d.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartRateAPIURL.day

  /// Generates a [FitbitHeartRateAPIURL] to get [FitbitHeartRateData] of a specific date range
  /// between [startDate] and [endDate].
  factory FitbitHeartRateAPIURL.dateRange(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitHeartRateAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$startDateStr/$endDateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartRateAPIURL.dateRange

  /// Generates a [FitbitHeartRateAPIURL] to get [FitbitHeartRateData] of a specific week
  /// ending in [baseDate].
  factory FitbitHeartRateAPIURL.week(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitHeartRateAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr/1w.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartRateAPIURL.week

  /// Generates a [FitbitHeartRateAPIURL] to get [FitbitHeartRateData] of a specific month
  /// ending in [baseDate].
  factory FitbitHeartRateAPIURL.month(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitHeartRateAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr/1m.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartRateAPIURL.month

  /// A private method that generates the base url of a [FitbitHeartRateAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/activities/heart';
  } // _getBaseURL

} // FitbitHeartRateAPIURL
