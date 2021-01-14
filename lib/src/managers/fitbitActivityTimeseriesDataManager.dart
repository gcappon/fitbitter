import 'package:logger/logger.dart';

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
      {String clientID, String clientSecret, String type}) {
    this.clientID = clientID;
    this.clientSecret = clientSecret;
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
    final logger = Logger();
    logger.i('$response');

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

    final validTypes = ['activityCalories','calories','caloriesBMR','distance','floors','elevation','minutesSedentary','minutesLightlyActive','minutesFairlyActive','minutesVeryActive','steps'];

    if(validTypes.contains(type))
      return 'activities-' + type;
    else {
      throw FitbitUnaexistentFitbitResourceException(message: 'The specified resource is not existent.');
    } // else
        
  } // _getDataField

} // FitbitActivityTimeseriesDataManager
