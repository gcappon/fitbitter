import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

/// [FitbitActivityAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitActivityData].
class FitbitActivityAPIURL extends FitbitAPIURL {
  /// Default [FitbitActivityAPIURL] constructor.
  FitbitActivityAPIURL({String url, String userID}) {
    this.url = url;
    this.userID = userID;
  } // FitbitActivityAPIURL

  /// Generates a [FitbitActivityAPIURL] to get [FitbitActivityData] of a
  /// specific day [date] and user [userID].
  factory FitbitActivityAPIURL.day({String userID, DateTime date}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitActivityAPIURL(
      url: '${_getBaseURL(userID)}/date/$dateStr.json',
      userID: userID,
    );
  } // FitbitActivityAPIURL.dayWithUserID

  static String _getBaseURL(String userID) {
    return 'https://api.fitbit.com/1/user/$userID/activities';
  } // _getBaseURL

} // FitbitActivityTimeseriesAPIURL
