import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitTemperatureSkinData.dart';

/// [FitbitTemperatureSkinAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitTemperatureSkinData].
class FitbitTemperatureSkinAPIURL extends FitbitAPIURL {
  /// Default [FitbitTemperatureSkinAPIURL] constructor.
  FitbitTemperatureSkinAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(
          url: url,
          fitbitCredentials: fitbitCredentials,
        );

  /// Generates a [FitbitTemperatureSkinAPIURL] to get [FitbitTemperatureSkinData] of a specific day [date].
  factory FitbitTemperatureSkinAPIURL.day(
      {required FitbitCredentials fitbitCredentials, required DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitTemperatureSkinAPIURL(
      url: '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitTemperatureSkinAPIURL.day

  /// Generates a [FitbitTemperatureSkinAPIURL] to get [FitbitTemperatureSkinData] of a specific date range
  /// between [startDate] and [endDate].
  factory FitbitTemperatureSkinAPIURL.dateRange(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitTemperatureSkinAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$startDateStr/$endDateStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitTemperatureSkinAPIURL.dateRange

  /// A private method that generates the base url of a [FitbitTemperatureSkinAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/temp/skin';
  } // _getBaseURL

} // FitbitTemperatureSkinAPIURL
