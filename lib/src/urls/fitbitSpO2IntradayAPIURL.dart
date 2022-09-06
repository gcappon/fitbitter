import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitSpO2IntradayData.dart';

/// [FitbitSpO2IntradayAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitSpO2IntradayData].
class FitbitSpO2IntradayAPIURL extends FitbitAPIURL {
  /// Default [FitbitSpO2IntradayAPIURL] constructor.
  FitbitSpO2IntradayAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(
          url: url,
          fitbitCredentials: fitbitCredentials,
        );

  /// Generates a [FitbitSpO2IntradayAPIURL] to get [FitbitSpO2IntradayData] of a specific day [date].
  factory FitbitSpO2IntradayAPIURL.day(
      {required FitbitCredentials fitbitCredentials, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitSpO2IntradayAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr/all.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitSpO2IntradayAPIURL.day

  /// Generates a [FitbitSpO2IntradayAPIURL] to get [FitbitSpO2IntradayData] of a specific date range
  /// between [startDate] and [endDate].
  factory FitbitSpO2IntradayAPIURL.dateRange(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitSpO2IntradayAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$startDateStr/$endDateStr/all.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitSpO2IntradayAPIURL.dateRange

  /// A private method that generates the base url of a [FitbitSpO2IntradayAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/spo2';
  } // _getBaseURL

} // FitbitSpO2IntradayAPIURL
