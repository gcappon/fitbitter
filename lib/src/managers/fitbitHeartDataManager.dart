import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/formats.dart';

import '../urls/fitbitAPIURL.dart';

import '../fitbitConnector.dart';

import '../data/fitbitData.dart';
import '../data/fitbitHeartData.dart';

import '../managers/fitbitDataManager.dart';

class FitbitHeartDataManager extends FitbitDataManager {
  FitbitHeartDataManager({String clientID, String clientSecret})
      : super(
          clientID: clientID,
          clientSecret: clientSecret,
        );

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL fitbitUrl) async {
    //check if the access token is stil valid, if not refresh it
    if (!await FitbitConnector.isTokenValid()) {
      await FitbitConnector.refreshToken(
          userID: fitbitUrl.userID,
          clientID: clientID,
          clientSecret: clientSecret);
    } // if

    // Instantiate Dio and its Response
    Dio dio = Dio();
    Response response;

    try {
      // get the fitbit profile data
      response = await dio.get(
        fitbitUrl.url,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization':
                'Bearer ${GetIt.instance<SharedPreferences>().getString("fitbitAccessToken")}',
          },
        ),
      );
    } on DioError catch (e) {
      FitbitDataManager.manageError(e);
    } // try - catch

    final decodedResponse =
        response.data is String ? jsonDecode(response.data) : response.data;
    print(
        "Fitbitter.FitbitAccountDataManager.fetch: $decodedResponse"); // for debugging

    List<FitbitData> ret =
        _extractFitbitHeartData(decodedResponse, fitbitUrl.userID);
    return ret;
  } // fetch

  List<FitbitHeartData> _extractFitbitHeartData(
      dynamic response, String userId) {
    final data = response['activities-heart'];
    List<FitbitHeartData> heartDataPoints = List<FitbitHeartData>();

    for (var record = 0; record < data.length; record++) {
      heartDataPoints.add(FitbitHeartData(
        encodedId: userId,
        dateOfMonitoring:
            Formats.onlyDayDateFormatTicks.parse(data[record]['dateTime']),
        caloriesOutOfRange: data[record]['value']['heartRateZones'][0]
            ['caloriesOut'].toDouble(),
        minimumOutOfRange: data[record]['value']['heartRateZones'][0]['min'],
        minutesOutOfRange: data[record]['value']['heartRateZones'][0]
            ['minutes'],
        caloriesFatBurn: data[record]['value']['heartRateZones'][1]
            ['caloriesOut'].toDouble(),
        minimumFatBurn: data[record]['value']['heartRateZones'][1]['min'],
        minutesFatBurn: data[record]['value']['heartRateZones'][1]['minutes'],
        caloriesCardio: data[record]['value']['heartRateZones'][2]
            ['caloriesOut'].toDouble(),
        minimumCardio: data[record]['value']['heartRateZones'][2]['min'],
        minutesCardio: data[record]['value']['heartRateZones'][2]['minutes'],
        caloriesPeak: data[record]['value']['heartRateZones'][3]['caloriesOut'].toDouble(),
        minimumPeak: data[record]['value']['heartRateZones'][3]['min'],
        minutesPeak: data[record]['value']['heartRateZones'][3]['minutes'],
        restingHeartRate: data[record]['value']['restingHeartRate'],
      ));
    } // for entry
    return heartDataPoints;
  } // _extractFitbitHeartData

} // FitbitAccountDataManager
