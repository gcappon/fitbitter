import 'package:logger/logger.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/data/fitbitHeartRateVariabilityData.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitHeartRateVariabilityDataManager] is a class the manages the requests related to
/// [FitbitHeartRateVariabilityData].
class FitbitHeartRateVariabilityDataManager extends FitbitDataManager {
  FitbitHeartRateVariabilityDataManager(
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
    List<FitbitData> ret = _extractFitbitHeartRateVariabilityData(
        response, fitbitUrl.fitbitCredentials!.userID);
    return ret;
  } // fetch

  /// A private method that extracts [FitbitHeartRateVariabilityData] from the given response.
  List<FitbitHeartRateVariabilityData> _extractFitbitHeartRateVariabilityData(
      dynamic response, String? userId) {
    final data = response['hrv'];
    List<FitbitHeartRateVariabilityData> hrvDataPoints =
        List<FitbitHeartRateVariabilityData>.empty(growable: true);

    for (var record in data) {
      hrvDataPoints.add(FitbitHeartRateVariabilityData(
        userID: userId,
        dateOfMonitoring:
            Formats.onlyDayDateFormatTicks.parse(record['dateTime']),
        dailyRmssd: record['value']['dailyRmssd'].toDouble(),
        deepRmssd: record['value']['deepRmssd'].toDouble(),
      ));
    } // for entry

    return hrvDataPoints;
  } // _extractFitbitHeartRateVariabilityData

} // FitbitHeartRateVariabilityDataManager
