import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleep_monitor/fitbitter/src/urls/fitbitAPIURL.dart';

import '../errors/fitbitRateLimitExceededException.dart';
import '../errors/fitbitUnauthorizedException.dart';
import '../errors/fitbitNotFoundException.dart';
import '../errors/fitbitBadRequestException.dart';
import '../errors/fitbitForbiddenException.dart';

import '../data/fitbitData.dart';

import '../fitbitConnector.dart';
import '../urls/fitbitAPIURL.dart';

abstract class FitbitDataManager {
  
  String clientID;
  String clientSecret;
  bool printLogs;

  /// Default constructor
  FitbitDataManager({this.clientID, this.clientSecret, this.printLogs = false});

  /// Method that fetches data from the Fitbit API.
  Future<List<FitbitData>> fetch(FitbitAPIURL url);

  Future<dynamic> getResponse(FitbitAPIURL fitbitUrl) async{

    //Check access token
    await _checkAccessToken(fitbitUrl);
    
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
        
    Future<dynamic> ret = Future.value(decodedResponse);
    return ret;
  }//getResponse

  Future<void> _checkAccessToken(FitbitAPIURL fitbitUrl) async{
    //check if the access token is stil valid, if not refresh it
    if (!await FitbitConnector.isTokenValid(printLogs: printLogs)) {
      await FitbitConnector.refreshToken(
          userID: fitbitUrl.userID,
          clientID: clientID,
          clientSecret: clientSecret,
          printLogs: printLogs);
    } // if
  }//_checkAccessToken

  /// Static method that manages errors that could return from the Fitbit API.
  static void manageError(DioError e) {
    switch (e.response.statusCode) {
      case 200:
        break;
      case 400:
        throw FitbitBadRequestException(
            message: e.response.data['errors'][0]['message']);
        break;
      case 401:
        throw FitbitUnauthorizedException(
            message: e.response.data['errors'][0]['message']);
        break;
      case 403:
        throw FitbitForbiddenException(
            message: e.response.data['errors'][0]['message']);
        break;
      case 404:
        throw FitbitNotFoundException(
            message: e.response.data['errors'][0]['message']);
        break;
      case 429:
        throw FitbitRateLimitExceededException(
            message: e.response.data['errors'][0]['message']);
        break;
    } // switch
  } // manageError

} // FitbitDataManager