import 'fitbitAPIURL.dart';

class FitbitUserAPIURL extends FitbitAPIURL {
  /// Default constructor
  FitbitUserAPIURL({String url, String userID})
      : super(
          url: url,
          userID: userID,
        );

  /// factory constructor
  factory FitbitUserAPIURL.withUserID({String userID}) => FitbitUserAPIURL(
      url: 'https://api.fitbit.com/1/user/$userID/profile.json',
      userID: userID,
    );
} // FitbitUserAPIURL
