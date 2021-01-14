import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleep_monitor/fitbitter/src/data/fitbitActivityData.dart';
import 'package:sleep_monitor/fitbitter/src/data/fitbitDeviceData.dart';
import 'package:sleep_monitor/fitbitter/src/urls/fitbitActivityAPIURL.dart';
import 'package:sleep_monitor/fitbitter/src/urls/fitbitActivityTimeseriesAPIURL.dart';

import '../utils/formats.dart';

import '../urls/fitbitAPIURL.dart';

import '../data/fitbitData.dart';

import '../managers/fitbitDataManager.dart';

class FitbitDeviceDataManager extends FitbitDataManager {

  /// Default constructor
  FitbitDeviceDataManager({String clientID, String clientSecret, bool printLogs = false}){
    this.printLogs = printLogs;
    this.clientID = clientID;
    this.clientSecret = clientSecret;
  }// FitbitDeviceDataManager

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL fitbitUrl) async {

    // Get the response
    final response = await getResponse(fitbitUrl);

    // Debugging
    if(printLogs){
    print(
        "Fitbitter.FitbitDeviceDataManager.fetch: $response");
    } // if

    //Extract data and return them
    List<FitbitData> ret =
        _extractFitbitDeviceData(response, fitbitUrl.userID);
    return ret;
  } // fetch

  List<FitbitDeviceData> _extractFitbitDeviceData(
      dynamic response, String userID) {

    final data = response;
    List<FitbitDeviceData> deviceDatapoints = List<FitbitDeviceData>();

    for (var record = 0; record < data.length; record++) {
      deviceDatapoints.add(FitbitDeviceData(
        encodedId: userID,
        batteryLevel: data[record]['battery'],
        deviceId: data[record]['id'],
        deviceVersion: data[record]['deviceVersion'],
        type: data[record]['type'],
        lastSyncTime: DateTime.parse(data[record]['lastSyncTime']),
      ));
    } // for entry
    return deviceDatapoints;
  } // _extractFitbitDeviceData


} // FitbitDeviceDataManager