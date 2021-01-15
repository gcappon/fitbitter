import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

/// [FitbitUserAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitUserData].
class FitbitUserAPIURL extends FitbitAPIURL {
  /// Default [FitbitUserAPIURL] constructor.
  FitbitUserAPIURL({String url, String userID})
      : super(
          url: url,
          userID: userID,
        );

  /// Generates a [FitbitUserAPIURL] given the [userID].
  factory FitbitUserAPIURL.withUserID({String userID}) => FitbitUserAPIURL(
        url: '${_getBaseURL()}/$userID/profile.json',
        userID: userID,
      );

  /// A private method that generates the base url of a [FitbitUserAPIURL].
  static String _getBaseURL() {
    return 'https://api.fitbit.com/1/user';
  } // _getBaseURL

} // FitbitUserAPIURL
