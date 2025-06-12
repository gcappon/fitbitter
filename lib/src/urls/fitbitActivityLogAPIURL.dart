import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';
import 'package:fitbitter/src/utils/formats.dart';
import 'package:fitbitter/src/data/fitbitActivityLogData.dart';

/// [FitbitActivityLogAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitActivityLogData].
class FitbitActivityLogAPIURL extends FitbitAPIURL {
  /// Default [FitbitActivityLogAPIURL] constructor.
  FitbitActivityLogAPIURL({
    required String url,
    required FitbitCredentials? fitbitCredentials,
  }) : super(fitbitCredentials: fitbitCredentials, url: url);

  /// Generates a [FitbitActivityLogAPIURL] to get [FitbitActivityLogData] of a
  /// specific date range using [startDate], [endDate], and [fitbitCredentials].
  factory FitbitActivityLogAPIURL.dateRange({
    required FitbitCredentials fitbitCredentials,
    required DateTime startDate,
    required DateTime endDate,
    int limit = 20,
    int offset = 0,
    String sort = 'desc',
  }) {
    final beforeDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    final url = '${_getBaseURL(fitbitCredentials.userID)}'
        '/list.json?beforeDate=$beforeDateStr&sort=$sort&offset=$offset&limit=$limit';
    return FitbitActivityLogAPIURL(
      url: url,
      fitbitCredentials: fitbitCredentials,
    );
  }

  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/activities';
  }
} // FitbitActivityLogAPIURL
