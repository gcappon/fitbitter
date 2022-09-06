import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitActivityTimeseriesData.dart';

/// [FitbitActivityTimeseriesAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitActivityTimeseriesData].
class FitbitActivityTimeseriesAPIURL extends FitbitAPIURL {
  /// The type of the activity timeseries.
  final String resource;

  /// Default [FitbitActivityTimeseriesAPIURL] constructor.
  FitbitActivityTimeseriesAPIURL(
      {required FitbitCredentials? fitbitCredentials,
      required String url,
      required this.resource})
      : super(fitbitCredentials: fitbitCredentials, url: url);

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a given [resource] of a
  /// specific day [date].
  factory FitbitActivityTimeseriesAPIURL.dayWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime date,
      required String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/$resource/date/$dateStr/1d.json',
      resource: resource,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.day

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific date range
  /// between [startDate] and [endDate].
  factory FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate,
      required String resource}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/$resource/date/$startDateStr/$endDateStr.json',
      resource: resource,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.dateRange

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific week
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.weekWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate,
      required String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/$resource/date/$dateStr/1w.json',
      resource: resource,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.week

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific month
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.monthWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate,
      required String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/$resource/date/$dateStr/1m.json',
      resource: resource,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.month

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific 3 months range
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.threeMonthsWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate,
      required String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/$resource/date/$dateStr/3m.json',
      resource: resource,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.threeMonths

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific 6 months range
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.sixMonthsWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate,
      required String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/$resource/date/$dateStr/6m.json',
      resource: resource,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.sixMonths

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific year
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.yearWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate,
      required String resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/$resource/date/$dateStr/1y.json',
      resource: resource,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.yearMonths

  /// A private method that generates the base url of a [FitbitActivityTimeseriesAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/activities';
  } // _getBaseURL

} // FitbitActivityTimeseriesAPIURL
