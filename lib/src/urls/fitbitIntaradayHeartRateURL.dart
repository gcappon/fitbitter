import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';
import 'package:fitbitter/src/utils/formats.dart';

class FitbitIntradayHeartRateAPIURL extends FitbitAPIURL {
  FitbitIntradayHeartRateAPIURL({
    required FitbitCredentials? fitbitCredentials,
    required String url,
  }) : super(url: url, fitbitCredentials: fitbitCredentials);

  factory FitbitIntradayHeartRateAPIURL.fromUrl({
    required FitbitCredentials fitbitCredentials,
    required String url,
  }) {
    final authedUrl = url.replaceFirst('-', fitbitCredentials.userID);
    return FitbitIntradayHeartRateAPIURL(
      fitbitCredentials: fitbitCredentials,
      url: authedUrl,
    );
  }

  factory FitbitIntradayHeartRateAPIURL.range({
    required FitbitCredentials fitbitCredentials,
    required DateTime startTime,
    required DateTime endTime,
  }) {
    final dateStr = Formats.onlyDayDateFormatTicks.format(startTime);
    final startTimeStr = Formats.onlyTimeWithSeconds.format(startTime);
    final endTimeStr = Formats.onlyTimeWithSeconds.format(endTime);

    final url =
        'https://api.fitbit.com/1/user/${fitbitCredentials.userID}/activities/heart/date/$dateStr/$dateStr/1sec/time/$startTimeStr/$endTimeStr.json';
    return FitbitIntradayHeartRateAPIURL(
      fitbitCredentials: fitbitCredentials,
      url: url,
    );
  }
}
