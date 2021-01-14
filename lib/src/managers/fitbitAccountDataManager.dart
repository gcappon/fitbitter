import 'package:logger/logger.dart';

import '../urls/fitbitAPIURL.dart';

import '../data/fitbitData.dart';
import '../data/fitbitAccountData.dart';

import '../managers/fitbitDataManager.dart';

class FitbitAccountDataManager extends FitbitDataManager {
  FitbitAccountDataManager(
      {String clientID, String clientSecret})
      : super(
          clientID: clientID,
          clientSecret: clientSecret,
        );

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL fitbitUrl) async {

    // Get the response
    final response = await getResponse(fitbitUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    List<FitbitData> ret = List<FitbitData>();
    ret.add(FitbitAccountData.fromJson(json: response['user']));
    return ret;
  } // fetch

} // FitbitAccountDataManager
