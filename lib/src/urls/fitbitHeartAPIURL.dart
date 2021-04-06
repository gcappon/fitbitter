import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

/// [FitbitHeartAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitHeartData].
class FitbitHeartAPIURL extends FitbitAPIURL {
  /// Default [FitbitHeartAPIURL] constructor.
  FitbitHeartAPIURL({String? url, String? userID})
      : super(
          url: url,
          userID: userID,
        );

  /// Generates a [FitbitHeartAPIURL] to get [FitbitHeartData] of a specific day [date]
  /// and a given user [userID].
  factory FitbitHeartAPIURL.dayWithUserID({String? userID, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitHeartAPIURL(
      url: '${_getBaseURL(userID)}/date/$dateStr/1d.json',
      userID: userID,
    );
  } // FitbitHeartAPIURL.dayWithUserID

  /// Generates a [FitbitHeartAPIURL] to get [FitbitHeartData] of a specific date range
  /// between [startDate] and [endDate] of a given user [userID].
  factory FitbitHeartAPIURL.dateRangeWithUserID(
      {String? userID, required DateTime startDate, required DateTime endDate}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitHeartAPIURL(
      url: '${_getBaseURL(userID)}/date/$startDateStr/$endDateStr.json',
      userID: userID,
    );
  } // FitbitHeartAPIURL.dateRangeWithUserID

  /// Generates a [FitbitHeartAPIURL] to get [FitbitHeartData] of a specific week
  /// ending in [baseDate].
  factory FitbitHeartAPIURL.weekWithUserID({String? userID, required DateTime baseDate}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitHeartAPIURL(
      url: '${_getBaseURL(userID)}/date/$dateStr/1w.json',
      userID: userID,
    );
  } // FitbitHeartAPIURL.weekWithUserID

  /// Generates a [FitbitHeartAPIURL] to get [FitbitHeartData] of a specific month
  /// ending in [baseDate].
  factory FitbitHeartAPIURL.monthWithUserID(
      {String? userID, required DateTime baseDate}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitHeartAPIURL(
      url: '${_getBaseURL(userID)}/date/$dateStr/1m.json',
      userID: userID,
    );
  } // FitbitHeartAPIURL.monthWithUserID

  /// A private method that generates the base url of a [FitbitHeartAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/activities/heart';
  } // _getBaseURL

} // FitbitHeartAPIURL
