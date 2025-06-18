import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

class FitbitIntradayHeartRateAPIURL extends FitbitAPIURL {
  FitbitIntradayHeartRateAPIURL({
    required FitbitCredentials? fitbitCredentials,
    required String url,
  }) : super(url: url, fitbitCredentials: fitbitCredentials);
}
