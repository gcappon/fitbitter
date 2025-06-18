import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';
import 'package:fitbitter/src/utils/formats.dart';

class FitbitIntradayHeartRateAPIURL extends FitbitAPIURL {
  FitbitIntradayHeartRateAPIURL({
    required FitbitCredentials? fitbitCredentials,
    required String url,
  }) : super(url: url, fitbitCredentials: fitbitCredentials);
}
