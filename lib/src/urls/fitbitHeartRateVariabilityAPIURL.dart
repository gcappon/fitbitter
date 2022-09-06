import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitHeartRateVariabilityData.dart';

/// [FitbitHeartRateVariabilityAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitHeartRateVariabilityData].
class FitbitHeartRateVariabilityAPIURL extends FitbitAPIURL {
  /// Default [FitbitHeartRateVariabilityAPIURL] constructor.
  FitbitHeartRateVariabilityAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(
          url: url,
          fitbitCredentials: fitbitCredentials,
        );

  /// Generates a [FitbitHeartRateVariabilityAPIURL] to get [FitbitHeartRateVariabilityData] of a specific day [date].
  factory FitbitHeartRateVariabilityAPIURL.day(
      {required FitbitCredentials fitbitCredentials, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitHeartRateVariabilityAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartRateVariabilityAPIURL.day

  /// Generates a [FitbitHeartRateVariabilityAPIURL] to get [FitbitHeartRateVariabilityData] of a specific date range
  /// between [startDate] and [endDate].
  factory FitbitHeartRateVariabilityAPIURL.dateRange(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitHeartRateVariabilityAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$startDateStr/$endDateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartRateVariabilityAPIURL.dateRange

  /// A private method that generates the base url of a [FitbitHeartRateVariabilityAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/hrv';
  } // _getBaseURL

} // FitbitHeartRateVariabilityAPIURL
