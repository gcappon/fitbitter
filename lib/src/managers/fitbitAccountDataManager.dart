import 'package:logger/logger.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/data/fitbitAccountData.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitAccountDataManager] is a class the manages the requests related to
/// [FitbitAccountData].
class FitbitAccountDataManager extends FitbitDataManager {
  /// Default [FitbitAccountDataManager] constructor.
  FitbitAccountDataManager(
      {required String clientID, required String clientSecret})
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
    List<FitbitData> ret = List<FitbitData>.empty(growable: true);
    ret.add(FitbitAccountData.fromJson(json: response['user']));
    return ret;
  } // fetch

} // FitbitAccountDataManager
