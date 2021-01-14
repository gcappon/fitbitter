import 'fitbitAPIURL.dart';
import '../utils/formats.dart';

class FitbitActivityAPIURL extends FitbitAPIURL {

  /// Default constructor
  FitbitActivityAPIURL({String url, String userID}){
    this.url = url;
    this.userID = userID;
  }// FitbitActivityAPIURL

  /// Generates a [FitbitActivityAPIURL] to get [FitbitActivityData] of a
  /// specific day [date] and user [userID].
  factory FitbitActivityAPIURL.day({String userID, DateTime date}){
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitActivityAPIURL(
      url: '${_getBaseURL(userID)}/date/$dateStr.json',
      userID: userID,
    );
  }// FitbitActivityAPIURL.dayWithUserID

  static String _getBaseURL(String userID){
    return 'https://api.fitbit.com/1/user/$userID/activities';
  }// _getBaseURL

}// FitbitActivityTimeseriesAPIURL