import '../urls/fitbitActivityTimeseriesAPIURL.dart';

import '../errors/fitbitUnexistentFitbitResourceException.dart';

import '../utils/formats.dart';

import '../urls/fitbitAPIURL.dart';

import '../data/fitbitData.dart';
import '../data/fitbitActivityTimeseriesData.dart';

import '../managers/fitbitDataManager.dart';

class FitbitActivityTimeseriesDataManager extends FitbitDataManager {
  String type;

  /// Default constructor
  FitbitActivityTimeseriesDataManager(
      {String clientID, String clientSecret, bool printLogs = false, String type}) {
    this.clientID = clientID;
    this.clientSecret = clientSecret;
    this.printLogs = printLogs;
    this.type = type;
  } // FitbitActivityTimeseriesDataManager

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL fitbitUrl) async {
    //Set the resource type
    final fitbitSpecificUrl = fitbitUrl as FitbitActivityTimeseriesAPIURL;
    type = fitbitSpecificUrl.resource;

    // Get the response
    final response = await getResponse(fitbitUrl);

    // Debugging
    if (printLogs) {
      print("Fitbitter.FitbitActivityTimeseriesDataManager.fetch: $response");
    } // if

    //Extract data and return them
    List<FitbitData> ret =
        _extractFitbitActivityTimeseriesData(response, fitbitUrl.userID);
    return ret;
  } // fetch

  List<FitbitActivityTimeseriesData> _extractFitbitActivityTimeseriesData(
      dynamic response, String userId) {
    final data = response[_getDataField()];
    List<FitbitActivityTimeseriesData> atDatapoints =
        List<FitbitActivityTimeseriesData>();

    for (var record = 0; record < data.length; record++) {
      atDatapoints.add(FitbitActivityTimeseriesData(
        encodedId: userId,
        dateOfMonitoring:
            Formats.onlyDayDateFormatTicks.parse(data[record]['dateTime']),
        type: this.type,
        value: double.parse(data[record]['value']),
      ));
    } // for entry
    return atDatapoints;
  } // _extractFitbitActivityTimeseriesData

  String _getDataField() {
    switch (type) {
      case 'activityCalories':
        return 'activities-activityCalories';
        break;
      case 'calories':
        return 'activities-calories';
        break;
      case 'caloriesBMR':
        return 'activities-caloriesBMR';
        break;
      case 'distance':
        return 'activities-distance';
        break;
      case 'floors':
        return 'activities-floors';
        break;
      case 'elevation':
        return 'activities-elevation';
        break;
      case 'minutesSedentary':
        return 'activities-minutesSedentary';
        break;
      case 'minutesLightlyActive':
        return 'activities-minutesLightlyActive';
        break;
      case 'minutesFairlyActive':
        return 'activities-minutesFairlyActive';
        break;
      case 'minutesVeryActive':
        return 'activities-minutesVeryActive';
        break;
      case 'steps':
        return 'activities-steps';
        break;
      default:
        throw FitbitUnaexistentFitbitResourceException(
            message: 'The specified resource is not existent.');
        break;
    }
  } // _getDataField

} // FitbitActivityTimeseriesDataManager
