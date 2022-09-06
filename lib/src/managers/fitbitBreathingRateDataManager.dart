import 'package:logger/logger.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/data/fitbitBreathingRateData.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitBreathingRateDataManager] is a class the manages the requests related to
/// [FitbitBreathingRateData].
class FitbitBreathingRateDataManager extends FitbitDataManager {
  FitbitBreathingRateDataManager(
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
    List<FitbitData> ret = _extractFitbitBreathingRateData(
        response, fitbitUrl.fitbitCredentials!.userID);
    return ret;
  } // fetch

  /// A private method that extracts [FitbitBreathingRateData] from the given response.
  List<FitbitBreathingRateData> _extractFitbitBreathingRateData(
      dynamic response, String? userId) {
    final data = response['br'];
    List<FitbitBreathingRateData> brDataPoints =
        List<FitbitBreathingRateData>.empty(growable: true);

    for (var record in data) {
      brDataPoints.add(FitbitBreathingRateData(
        userID: userId,
        dateOfMonitoring:
            Formats.onlyDayDateFormatTicks.parse(record['dateTime']),
        value: record['value']['breathingRate'].toDouble(),
      ));
    } // for entry

    return brDataPoints;
  } // _extractFitbitBreathingRateData

} // FitbitBreathingRateDataManager
