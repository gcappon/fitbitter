import 'package:logger/logger.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/data/fitbitSpO2IntradayData.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitSpO2IntradayDataManager] is a class the manages the requests related to
/// [FitbitSpO2IntradayData].
class FitbitSpO2IntradayDataManager extends FitbitDataManager {
  FitbitSpO2IntradayDataManager(
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
    List<FitbitData> ret = _extractFitbitSpO2IntradayData(
        response, fitbitUrl.fitbitCredentials!.userID);
    return ret;
  } // fetch

  /// A private method that extracts [FitbitSpO2IntradayData] from the given response.
  List<FitbitSpO2IntradayData> _extractFitbitSpO2IntradayData(
      dynamic response, String? userId) {
    final data = response['minutes'];
    List<FitbitSpO2IntradayData> spO2IntradayDataPoints =
        List<FitbitSpO2IntradayData>.empty(growable: true);

    if (data is Iterable<dynamic>) {
      for (var record in data) {
        spO2IntradayDataPoints.add(FitbitSpO2IntradayData(
          userID: userId,
          dateOfMonitoring:
              Formats.onlyDayDateFormatTicks.parse(record['minute']),
          value: record['value'].toDouble(),
        ));
      } // for entry
    } else {
      spO2IntradayDataPoints.add(FitbitSpO2IntradayData(
        userID: userId,
        dateOfMonitoring: Formats.onlyDayDateFormatTicks.parse(data['minute']),
        value: data['value'].toDouble(),
      ));
    }
    return spO2IntradayDataPoints;
  } // _extractFitbitSpO2IntradayData

} // FitbitSpO2IntradayDataManager
