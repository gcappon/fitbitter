import 'package:logger/logger.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/data/fitbitTemperatureSkinData.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitTemperatureSkinDataManager] is a class the manages the requests related to
/// [FitbitTemperatureSkinData].
class FitbitTemperatureSkinDataManager extends FitbitDataManager {
  FitbitTemperatureSkinDataManager(
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
    List<FitbitData> ret = _extractFitbitTemperatureSkinData(
        response, fitbitUrl.fitbitCredentials!.userID);
    return ret;
  } // fetch

  /// A private method that extracts [FitbitTemperatureSkinData] from the given response.
  List<FitbitTemperatureSkinData> _extractFitbitTemperatureSkinData(
      dynamic response, String? userId) {
    final data = response['tempSkin'];
    List<FitbitTemperatureSkinData> tempSkinDataPoints =
        List<FitbitTemperatureSkinData>.empty(growable: true);

    for (var record in data) {
      tempSkinDataPoints.add(FitbitTemperatureSkinData(
        userID: userId,
        dateOfMonitoring:
            Formats.onlyDayDateFormatTicks.parse(record['dateTime']),
        value: record['value']['nightlyRelative'].toDouble(),
        logType: record['logType'],
      ));
    } // for entry

    return tempSkinDataPoints;
  } // _extractFitbitTemperatureSkinData

} // FitbitTemperatureSkinDataManager
