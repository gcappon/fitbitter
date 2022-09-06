import 'package:logger/logger.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/data/fitbitSpO2Data.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitSpO2DataManager] is a class the manages the requests related to
/// [FitbitSpO2Data].
class FitbitSpO2DataManager extends FitbitDataManager {
  FitbitSpO2DataManager(
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
    List<FitbitData> ret =
        _extractFitbitSpO2Data(response, fitbitUrl.fitbitCredentials!.userID);
    return ret;
  } // fetch

  /// A private method that extracts [FitbitSpO2Data] from the given response.
  List<FitbitSpO2Data> _extractFitbitSpO2Data(
      dynamic response, String? userId) {
    final data = response;
    List<FitbitSpO2Data> spO2DataPoints =
        List<FitbitSpO2Data>.empty(growable: true);

    if (data is Iterable<dynamic>) {
      for (var record in data) {
        spO2DataPoints.add(FitbitSpO2Data(
          userID: userId,
          dateOfMonitoring:
              Formats.onlyDayDateFormatTicks.parse(record['dateTime']),
          avgValue: record['value']['avg'].toDouble(),
          minValue: record['value']['min'].toDouble(),
          maxValue: record['value']['max'].toDouble(),
        ));
      } // for entry
    } else {
      spO2DataPoints.add(FitbitSpO2Data(
        userID: userId,
        dateOfMonitoring:
            Formats.onlyDayDateFormatTicks.parse(data['dateTime']),
        avgValue: data['value']['avg'].toDouble(),
        minValue: data['value']['min'].toDouble(),
        maxValue: data['value']['max'].toDouble(),
      ));
    }
    return spO2DataPoints;
  } // _extractFitbitSpO2Data

} // FitbitSpO2DataManager
