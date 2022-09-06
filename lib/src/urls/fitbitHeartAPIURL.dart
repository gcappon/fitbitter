import 'package:fitbitter/src/fitbitConnector.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitHeartRateData.dart';

/// [FitbitHeartAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitHeartRateData].
class FitbitHeartAPIURL extends FitbitAPIURL {
  /// Default [FitbitHeartAPIURL] constructor.
  FitbitHeartAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(
          url: url,
          fitbitCredentials: fitbitCredentials,
        );

  /// Generates a [FitbitHeartAPIURL] to get [FitbitHeartData] of a specific day [date].
  factory FitbitHeartAPIURL.day(
      {required FitbitCredentials fitbitCredentials, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitHeartAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr/1d.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartAPIURL.day

  /// Generates a [FitbitHeartAPIURL] to get [FitbitHeartData] of a specific date range
  /// between [startDate] and [endDate] of a given user [userID].
  factory FitbitHeartAPIURL.dateRange(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitHeartAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$startDateStr/$endDateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartAPIURL.dateRange

  /// Generates a [FitbitHeartAPIURL] to get [FitbitHeartData] of a specific week
  /// ending in [baseDate].
  factory FitbitHeartAPIURL.week(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitHeartAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr/1w.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartAPIURL.week

  /// Generates a [FitbitHeartAPIURL] to get [FitbitHeartData] of a specific month
  /// ending in [baseDate].
  factory FitbitHeartAPIURL.month(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitHeartAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr/1m.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartAPIURL.month

  /// A private method that generates the base url of a [FitbitHeartAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/activities/heart';
  } // _getBaseURL

} // FitbitHeartAPIURL
