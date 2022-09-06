import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitBreathingRateData.dart';

/// [FitbitBreathingRateAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitBreathingRateData].
class FitbitBreathingRateAPIURL extends FitbitAPIURL {
  /// Default [FitbitBreathingRateAPIURL] constructor.
  FitbitBreathingRateAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(
          url: url,
          fitbitCredentials: fitbitCredentials,
        );

  /// Generates a [FitbitBreathingRateAPIURL] to get [FitbitBreathingRateData] of a specific day [date].
  factory FitbitBreathingRateAPIURL.day(
      {required FitbitCredentials fitbitCredentials, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitBreathingRateAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitBreathingRateAPIURL.day

  /// Generates a [FitbitBreathingRateAPIURL] to get [FitbitBreathingRateData] of a specific date range
  /// between [startDate] and [endDate].
  factory FitbitBreathingRateAPIURL.dateRange(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitBreathingRateAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$startDateStr/$endDateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitBreathingRateAPIURL.dateRange

  /// A private method that generates the base url of a [FitbitBreathingRateAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/br';
  } // _getBaseURL

} // FitbitBreathingRateAPIURL
