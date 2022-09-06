import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitSpO2Data.dart';

/// [FitbitSpO2APIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitSpO2Data].
class FitbitSpO2APIURL extends FitbitAPIURL {
  /// Default [FitbitSpO2APIURL] constructor.
  FitbitSpO2APIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(
          url: url,
          fitbitCredentials: fitbitCredentials,
        );

  /// Generates a [FitbitSpO2APIURL] to get [FitbitSpO2Data] of a specific day [date].
  factory FitbitSpO2APIURL.day(
      {required FitbitCredentials fitbitCredentials, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitSpO2APIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitSpO2APIURL.day

  /// Generates a [FitbitSpO2APIURL] to get [FitbitSpO2Data] of a specific date range
  /// between [startDate] and [endDate].
  factory FitbitSpO2APIURL.dateRange(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitSpO2APIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$startDateStr/$endDateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitSpO2APIURL.dateRange

  /// A private method that generates the base url of a [FitbitSpO2APIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/spo2';
  } // _getBaseURL

} // FitbitSpO2APIURL
