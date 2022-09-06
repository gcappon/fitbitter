import 'package:fitbitter/src/fitbitConnector.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitHeartRateIntradayData.dart';

/// [FitbitHeartRateIntradayAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitHeartRateIntradayData].
class FitbitHeartRateIntradayAPIURL extends FitbitAPIURL {
  /// Default [FitbitHeartRateIntradayAPIURL] constructor.
  FitbitHeartRateIntradayAPIURL(
      {required FitbitCredentials? fitbitCredentials, required String url})
      : super(
          url: url,
          fitbitCredentials: fitbitCredentials,
        );

  /// Generates a [FitbitHeartRateIntradayAPIURL] to get [FitbitHeartRateIntradayData] of a specific day [date].
  factory FitbitHeartRateIntradayAPIURL.dayAndDetailLevel(
      {required FitbitCredentials fitbitCredentials,
      required DateTime date,
      required IntradayDetailLevel intradayDetailLevel}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);

    String? idl;
    switch (intradayDetailLevel) {
      case IntradayDetailLevel.ONE_SECOND:
        idl = '1sec';
        break;
      case IntradayDetailLevel.ONE_MINUTE:
        idl = '1min';
        break;
      case IntradayDetailLevel.FIVE_MINUTES:
        idl = '5min';
        break;
      case IntradayDetailLevel.FIFTEEN_MINUTES:
        idl = '15min';
        break;
    } //switch

    return FitbitHeartRateIntradayAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$dateStr/1d/$idl.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartRateIntradayAPIURL.day

  /// Generates a [FitbitHeartRateIntradayAPIURL] to get [FitbitHeartRateIntradayData] of a specific date range
  /// between [startDate] and [endDate], and [intradayDetailLevel].
  factory FitbitHeartRateIntradayAPIURL.dateRangeAndDetailLevel(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate,
      required IntradayDetailLevel intradayDetailLevel}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    String startTimeStr = Formats.onlyTimeNoSecondsAMPM.format(startDate);
    String endTimeStr = Formats.onlyTimeNoSecondsAMPM.format(endDate);

    String? idl;
    switch (intradayDetailLevel) {
      case IntradayDetailLevel.ONE_SECOND:
        idl = '1sec';
        break;
      case IntradayDetailLevel.ONE_MINUTE:
        idl = '1min';
        break;
      case IntradayDetailLevel.FIVE_MINUTES:
        idl = '5min';
        break;
      case IntradayDetailLevel.FIFTEEN_MINUTES:
        idl = '15min';
        break;
    } //switch

    return FitbitHeartRateIntradayAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/date/$startDateStr/$endDateStr/$idl/time/$startTimeStr/$endTimeStr.json',
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitHeartRateIntradayAPIURL.dateRange

  /// A private method that generates the base url of a [FitbitHeartRateIntradayAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/activities/heart';
  } // _getBaseURL

} // FitbitHeartRateIntradayAPIURL
