import 'package:logger/logger.dart';

import '../urls/fitbitAPIURL.dart';

import '../data/fitbitData.dart';
import '../data/fitbitSleepData.dart';

import '../managers/fitbitDataManager.dart';

class FitbitSleepDataManager extends FitbitDataManager {
  FitbitSleepDataManager({String clientID, String clientSecret})
      : super(
            clientID: clientID,
            clientSecret: clientSecret);

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL fitbitUrl) async {

    // Get the response
    final response = await getResponse(fitbitUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    List<FitbitSleepData> sleepDataPoints =
        _extractFitbitSleepData(response, fitbitUrl.userID);
    return sleepDataPoints;
  } // fetch

  List<FitbitSleepData> _extractFitbitSleepData(
      dynamic response, String userId) {
    final nRecords = response["sleep"].length;
    List<FitbitSleepData> sleepDataPoints = List<FitbitSleepData>();
    for (var record = 0; record < nRecords; record++) {
      List<FitbitSleepData> daySleepDataPoints = List<FitbitSleepData>();

      final data = response["sleep"][record]["levels"]["data"];
      final shortData = response["sleep"][record]["levels"]["shortData"];
      final nData = data.length;
      final recordType = response["sleep"][record]["type"];
      final nShortData = recordType == "classic" ? 0 : shortData.length;

      final DateTime dateOfSleep =
          DateTime.parse(response["sleep"][record]["dateOfSleep"]);

      for (var d = 0; d < nData; d++) {
        final DateTime entryDateTime = DateTime.parse(data[d]["dateTime"]);
        final String level = data[d]["level"];
        final int seconds = data[d]["seconds"];
        for (var e = 0; e < (seconds ~/ 30); e++) {
          daySleepDataPoints.add(FitbitSleepData(
            encodedId: userId,
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
        final String level = shortData[sd]["level"];
        final int seconds = shortData[sd]["seconds"];
        for (var e = 0; e < (seconds ~/ 30); e++) {
          FitbitSleepData newSDP = FitbitSleepData(
            encodedId: userId,
            entryDateTime: entryDateTime.add(
              Duration(seconds: 30 * e),
            ),
            level: level,
            dateOfSleep: dateOfSleep,
          );
          final idx = newSDP.entryDateTime
                  .difference(daySleepDataPoints[0].entryDateTime)
                  .inSeconds ~/
              30;

          daySleepDataPoints[idx] = FitbitSleepData(
            encodedId: userId,
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
