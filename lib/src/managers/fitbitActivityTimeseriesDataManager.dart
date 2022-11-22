import 'package:logger/logger.dart';

import 'package:fitbitter/src/urls/fitbitActivityTimeseriesAPIURL.dart';


import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/data/fitbitActivityTimeseriesData.dart';

import 'package:fitbitter/src/managers/fitbitDataManager.dart';

/// [FitbitActivityTimeseriesDataManager] is a class the manages the requests related to
/// [FitbitActivityTimeseriesData].
class FitbitActivityTimeseriesDataManager extends FitbitDataManager {
  /// Default [FitbitActivityTimeseriesDataManager] constructor.
  FitbitActivityTimeseriesDataManager(
      {required String clientID, required String clientSecret})
      : super(
          clientID: clientID,
          clientSecret: clientSecret,
        );

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL fitbitUrl) async {
    final fitbitSpecificUrl = fitbitUrl as FitbitActivityTimeseriesAPIURL;
    final String type = fitbitSpecificUrl
        .resourceString; //Getting the resource (as String) type directly from the [FitbitActivityTimeseriesAPIURL]

    // Get the response
    final response = await getResponse(fitbitUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    //Extract data and return them
    List<FitbitData> ret = _extractFitbitActivityTimeseriesData(
        response, fitbitUrl.fitbitCredentials!.userID, type);
    return ret;
  } // fetch

  /// A private method that extracts [FitbitActivityTimeseriesData] from the given response.
  List<FitbitActivityTimeseriesData> _extractFitbitActivityTimeseriesData(
      dynamic response, String? userID, String type) {
    final data = response['activities-$type'];
    List<FitbitActivityTimeseriesData> atDatapoints =
        List<FitbitActivityTimeseriesData>.empty(growable: true);

    for (var record = 0; record < data.length; record++) {
      atDatapoints.add(FitbitActivityTimeseriesData(
        userID: userID,
        dateOfMonitoring: DateTime.parse(data[record]['dateTime']),
        type: type,
        value: double.parse(data[record]['value']),
      ));
    } // for entry
    return atDatapoints;
  } // _extractFitbitActivityTimeseriesData
} // FitbitActivityTimeseriesDataManager
