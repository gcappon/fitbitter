import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

/// [FitbitActivityTimeseriesAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitActivityTimeseriesData].
class FitbitActivityTimeseriesAPIURL extends FitbitAPIURL {
  /// The type of the activity timeseries.
  String resource;

  /// Default [FitbitActivityTimeseriesAPIURL] constructor.
  FitbitActivityTimeseriesAPIURL({String url, String userID, String resource}) {
    this.url = url;
    this.userID = userID;
    this.resource = resource;
  } // FitbitActivityTimeseriesAPIURL

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a given [resource] of a
  /// specific day [date] and user [userID].
  factory FitbitActivityTimeseriesAPIURL.dayWithResource(
      {String userID, DateTime date, String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitActivityTimeseriesAPIURL(
      url: '${_getBaseURL(userID)}/$resource/date/$dateStr/1d.json',
      resource: resource,
      userID: userID,
    );
  } // FitbitActivityTimeseriesAPIURL.dayWithUserID

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific date range
  /// between [startDate] and [endDate] of a given user [userID].
  factory FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
      {String userID, DateTime startDate, DateTime endDate, String resource}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(userID)}/$resource/date/$startDateStr/$endDateStr.json',
      resource: resource,
      userID: userID,
    );
  } // FitbitActivityTimeseriesAPIURL.dateRangeWithUserID

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific week
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.weekWithResource(
      {String userID, DateTime baseDate, String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url: '${_getBaseURL(userID)}/$resource/date/$dateStr/1w.json',
      resource: resource,
      userID: userID,
    );
  } // FitbitActivityTimeseriesAPIURL.weekWithUserID

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific month
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.monthWithResource(
      {String userID, DateTime baseDate, String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url: '${_getBaseURL(userID)}/$resource/date/$dateStr/1m.json',
      resource: resource,
      userID: userID,
    );
  } // FitbitActivityTimeseriesAPIURL.monthWithUserID

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific 3 months range
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.threeMonthsWithResource(
      {String userID, DateTime baseDate, String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url: '${_getBaseURL(userID)}/$resource/date/$dateStr/3m.json',
      resource: resource,
      userID: userID,
    );
  } // FitbitActivityTimeseriesAPIURL.threeMonthsWithUserID

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific 6 months range
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.sixMonthsWithResource(
      {String userID, DateTime baseDate, String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url: '${_getBaseURL(userID)}/$resource/date/$dateStr/6m.json',
      resource: resource,
      userID: userID,
    );
  } // FitbitActivityTimeseriesAPIURL.sixMonthsWithUserID

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific year
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.yearWithResource(
      {String userID, DateTime baseDate, String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url: '${_getBaseURL(userID)}/$resource/date/$dateStr/1y.json',
      resource: resource,
      userID: userID,
    );
  } // FitbitActivityTimeseriesAPIURL.yearMonthsWithUserID

  /// A private method that generates the base url of a [FitbitActivityTimeseriesAPIURL].
  static String _getBaseURL(String userID) {
    return 'https://api.fitbit.com/1/user/$userID/activities';
  } // _getBaseURL

} // FitbitActivityTimeseriesAPIURL
