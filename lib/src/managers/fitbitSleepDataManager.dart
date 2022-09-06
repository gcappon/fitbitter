import 'package:logger/logger.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/data/fitbitSleepData.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitSleepDataManager] is a class the manages the requests related to
/// [FitbitSleepData].
class FitbitSleepDataManager extends FitbitDataManager {
  FitbitSleepDataManager(
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
    List<FitbitSleepData> sleepDataPoints =
        _extractFitbitSleepData(response, fitbitUrl.fitbitCredentials!.userID);
    return sleepDataPoints;
  } // fetch

  /// A private method that extracts [FitbitSleepData] from the given response.
  List<FitbitSleepData> _extractFitbitSleepData(
      dynamic response, String? userId) {
    final nRecords = response["sleep"].length;
    List<FitbitSleepData> sleepDataPoints =
        List<FitbitSleepData>.empty(growable: true);
    for (var record = 0; record < nRecords; record++) {
      List<FitbitSleepData> daySleepDataPoints =
          List<FitbitSleepData>.empty(growable: true);

      final data = response["sleep"][record]["levels"]["data"];
      final shortData = response["sleep"][record]["levels"]["shortData"];
      final nData = data.length;
      final recordType = response["sleep"][record]["type"];
      final nShortData = recordType == "classic" ? 0 : shortData.length;

      final DateTime dateOfSleep =
          DateTime.parse(response["sleep"][record]["dateOfSleep"]);

      for (var d = 0; d < nData; d++) {
        final DateTime entryDateTime = DateTime.parse(data[d]["dateTime"]);
        final String? level = data[d]["level"];
        final int seconds = data[d]["seconds"];
        for (var e = 0; e < (seconds ~/ 30); e++) {
          daySleepDataPoints.add(FitbitSleepData(
            userID: userId,
            entryDateTime: entryDateTime.add(
              Duration(seconds: 30 * e),
            ),
            level: level,
            dateOfSleep: dateOfSleep,
          ));
        } // for entry
      } // for data
      for (var sd = 0; sd < nShortData; sd++) {
        final DateTime entryDateTime =
            DateTime.parse(shortData[sd]["dateTime"]);
        final String? level = shortData[sd]["level"];
        final int seconds = shortData[sd]["seconds"];
        for (var e = 0; e < (seconds ~/ 30); e++) {
          FitbitSleepData newSDP = FitbitSleepData(
            userID: userId,
            entryDateTime: entryDateTime.add(
              Duration(seconds: 30 * e),
            ),
            level: level,
            dateOfSleep: dateOfSleep,
          );
          final idx = newSDP.entryDateTime!
                  .difference(daySleepDataPoints[0].entryDateTime!)
                  .inSeconds ~/
              30;

          daySleepDataPoints[idx] = FitbitSleepData(
            userID: userId,
            entryDateTime: entryDateTime.add(
              Duration(seconds: 30 * e),
            ),
            level: level,
            dateOfSleep: dateOfSleep,
          );
        } // for entry
      } // for short data

      for (var e = 0; e < daySleepDataPoints.length; e++) {
        sleepDataPoints.add(daySleepDataPoints[e]);
      } // for accumulator
    } // for nRecords
    return sleepDataPoints;
  } // _extractFitbitSleepData

} // FitbitSleepDataManager
