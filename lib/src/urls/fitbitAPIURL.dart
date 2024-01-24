import 'package:fitbitter/src/fitbitConnector.dart';

enum IntradayDetailLevel {
  ONE_SECOND,
  ONE_MINUTE,
  FIVE_MINUTES,
  FIFTEEN_MINUTES,
}

/// [FitbitAPIURL] is the abstract class implementing the data model
/// of a url of Fitbit APIs.
abstract class FitbitAPIURL {
  /// The string representation of the url.
  String url;

  /// The [FitbitCredentials] of the user requesting for the data.
  FitbitCredentials? fitbitCredentials;

  /// Default [FitbitAPIURL] constructor.
  FitbitAPIURL({required this.url, required this.fitbitCredentials});
} // FitbitAPIURL
