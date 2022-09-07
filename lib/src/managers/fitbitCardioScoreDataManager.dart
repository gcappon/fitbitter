import 'package:logger/logger.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/data/fitbitCardioScoreData.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitCardioScoreDataManager] is a class the manages the requests related to
/// [FitbitCardioScoreData].
class FitbitCardioScoreDataManager extends FitbitDataManager {
  FitbitCardioScoreDataManager(
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
    List<FitbitData> ret = _extractFitbitCardioScoreData(
        response, fitbitUrl.fitbitCredentials!.userID);
    return ret;
  } // fetch

  /// A private method that extracts [FitbitCardioScoreData] from the given response.
  List<FitbitCardioScoreData> _extractFitbitCardioScoreData(
      dynamic response, String? userId) {
    final data = response['cardioScore'];
    List<FitbitCardioScoreData> cardioScoreDataPoints =
        List<FitbitCardioScoreData>.empty(growable: true);

    for (var record in data) {
      cardioScoreDataPoints.add(FitbitCardioScoreData(
        userID: userId,
        dateOfMonitoring:
            Formats.onlyDayDateFormatTicks.parse(record['dateTime']),
        value: record['value']['vo2Max'].toDouble(),
      ));
    } // for entry

    return cardioScoreDataPoints;
  } // _extractFitbitCardioScoreData

} // FitbitCardioScoreDataManager
