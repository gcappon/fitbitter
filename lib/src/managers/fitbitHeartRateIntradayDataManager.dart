import 'package:logger/logger.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/data/fitbitHeartRateIntradayData.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitHeartRateIntradayDataManager] is a class the manages the requests related to
/// [FitbitHeartRateIntradayData].
class FitbitHeartRateIntradayDataManager extends FitbitDataManager {
  FitbitHeartRateIntradayDataManager(
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
    List<FitbitData> ret = _extractFitbitHeartRateIntradayData(
        response, fitbitUrl.fitbitCredentials!.userID);
    return ret;
  } // fetch

  /// A private method that extracts [FitbitHeartData] from the given response.
  List<FitbitHeartRateIntradayData> _extractFitbitHeartRateIntradayData(
      dynamic response, String? userId) {
    final dateOfMonitoring = Formats.onlyDayDateFormatTicks
        .parse(response['activities-heart'][0]['dateTime']);
    final data = response['activities-heart-intraday']['dataset'];
    List<FitbitHeartRateIntradayData> heartDataPoints =
        List<FitbitHeartRateIntradayData>.empty(growable: true);

    for (var record in data) {
      final time = Formats.onlyTimeNoSecondsAMPM.parse(record['time']);
      heartDataPoints.add(FitbitHeartRateIntradayData(
        userID: userId,
        dateOfMonitoring: dateOfMonitoring
            .add(Duration(hours: time.hour, minutes: time.minute)),
        value: record['value'].toDouble(),
      ));
    } // for entry

    return heartDataPoints;
  } // _extractFitbitHeartRateIntradayData

} // FitbitHeartRateIntradayDataManager
