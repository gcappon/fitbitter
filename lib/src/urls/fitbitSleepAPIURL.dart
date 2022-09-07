import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitSleepData.dart';

/// [FitbitSleepAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitSleepData].
class FitbitSleepAPIURL extends FitbitAPIURL {
  /// Default [FitbitSleepAPIURL] constructor.
  FitbitSleepAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(
          url: url,
          fitbitCredentials: fitbitCredentials,
        );

  /// Generates a [FitbitSleepAPIURL] to get [FitbitSleepData] of a specific day [date].
  factory FitbitSleepAPIURL.day(
      {required FitbitCredentials fitbitCredentials, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitSleepAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitSleepAPIURL.day

  /// Generates a [FitbitSleepAPIURL] to get [FitbitSleepData] of a specific date range
  /// between [startDate] and [endDate].
  factory FitbitSleepAPIURL.dateRange(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitSleepAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$startDateStr/$endDateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitSleepAPIURL.dateRange

  /// Generates a [FitbitSleepAPIURL] to get the [FitbitSleepData] list.
  /// before a given day [beforeDate]. Maximum [limit] sleep logs are returned.
  /// The resulting entries are ordered descending.
  factory FitbitSleepAPIURL.listAndBeforeDate(
      {required FitbitCredentials fitbitCredentials,
      required DateTime beforeDate,
      int? limit}) {
    String beforeDateStr = Formats.onlyDayDateFormatTicks.format(beforeDate);
    return FitbitSleepAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/list.json?beforeDate=$beforeDateStr&sort=desc&offset=0&limit=$limit',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitSleepAPIURL.listAndBeforeDate

  /// Generates a [FitbitSleepAPIURL] to get the [FitbitSleepData] list.
  /// after a given day [afterDate]. Maximum [limit] sleep logs are returned.
  /// The resulting entries are ordered ascending.
  factory FitbitSleepAPIURL.listAndAfterDate(
      {required FitbitCredentials fitbitCredentials,
      required DateTime afterDate,
      int? limit}) {
    String afterDateStr = Formats.onlyDayDateFormatTicks.format(afterDate);
    return FitbitSleepAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/list.json?beforeDate=$afterDateStr&sort=asc&offset=0&limit=$limit',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitSleepAPIURL.listAndAfterDate

  /// A private method that generates the base url of a [FitbitSleepAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1.2/user/$userID/sleep';
  } // _getBaseURL
} // FitbitSleepAPIURL
