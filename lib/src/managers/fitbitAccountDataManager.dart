import '../urls/fitbitAPIURL.dart';

import '../data/fitbitData.dart';
import '../data/fitbitAccountData.dart';

import '../managers/fitbitDataManager.dart';

class FitbitAccountDataManager extends FitbitDataManager {
  FitbitAccountDataManager(
      {String clientID, String clientSecret, bool printLogs = false})
      : super(
          clientID: clientID,
          clientSecret: clientSecret,
          printLogs: printLogs,
        );

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL fitbitUrl) async {

    // Get the response
    final response = await getResponse(fitbitUrl);

    // Debugging
    if (printLogs) {
      print(
          "Fitbitter.FitbitAccountDataManager.fetch: $response");
    } // if 

    //Extract data and return them
    List<FitbitData> ret = List<FitbitData>();
    ret.add(FitbitAccountData.fromJson(json: response['user']));
    return ret;
  } // fetch

} // FitbitAccountDataManager
