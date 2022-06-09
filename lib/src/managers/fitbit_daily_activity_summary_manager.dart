import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';
import 'package:fitbitter/src/urls/fitbitActivityAPIURL.dart';
import 'package:logger/logger.dart';
import '../../fitbitter.dart';
import '../data/fitbit_daily_activity_summary.dart';
import 'fitbitDataManager.dart';

class FitbitDailyActvitySummaryManager extends FitbitDataManager {

  FitbitDailyActivitySummary _extractFromJson(dynamic response, String? userID) {
    final aSummary = FitbitDailyActivitySummary.fromJson(aJson: response);
    return aSummary;
  }

  FitbitDailyActvitySummaryManager({clientID, clientSecret}) : super(clientID: clientID, clientSecret: clientSecret) {

  }

  Future<FitbitDailyActivitySummary> _doFetch(FitbitActivityAPIURL aUrl) async {
    // Get the response
    final response = await getResponse(aUrl);
    // Debugging
    final logger = Logger();
    logger.i('$response');
    //Extract data and return them
    return _extractFromJson(response, aUrl.userID);
  }

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL aUrl) async {
    List<FitbitData> aList = [];
    aList.add(await _doFetch(aUrl as FitbitActivityAPIURL));
    return aList;
  }

  Future<FitbitDailyActivitySummary> fetchDailySummary(FitbitActivityAPIURL aUrl) async {
    return await _doFetch(aUrl);
  }
}