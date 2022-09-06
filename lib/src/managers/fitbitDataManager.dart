import 'dart:convert';
import 'dart:async';

import 'package:dio/dio.dart';

import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/errors/fitbitRateLimitExceededException.dart';
import 'package:fitbitter/src/errors/fitbitUnauthorizedException.dart';
import 'package:fitbitter/src/errors/fitbitNotFoundException.dart';
import 'package:fitbitter/src/errors/fitbitBadRequestException.dart';
import 'package:fitbitter/src/errors/fitbitForbiddenException.dart';

import 'package:fitbitter/src/data/fitbitData.dart';

import 'package:fitbitter/src/fitbitConnector.dart';

/// [FitbitDataManager] is an abstract class the manages the requests related to
/// [FitbitData].
abstract class FitbitDataManager {
  /// The client id.
  String clientID;

  /// The client secret id.
  String clientSecret;

  /// Default constructor
  FitbitDataManager({required this.clientID, required this.clientSecret});

  /// Method that fetches data from the Fitbit API.
  Future<List<FitbitData>> fetch(FitbitAPIURL url);

  /// Method the obtains the response from the given [FitbitAPIURL].
  Future<dynamic> getResponse(FitbitAPIURL fitbitUrl) async {
    //Check access token
    await _checkAccessToken(fitbitUrl);

    // Instantiate Dio and its Response
    Dio dio = Dio();
    late Response response;

    try {
      // get the fitbit profile data
      response = await dio.get(
        fitbitUrl.url,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            'Authorization':
                'Bearer ${fitbitUrl.fitbitCredentials!.fitbitAccessToken}',
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
  } //getResponse

  /// Method that check the validity of the current access token.
  Future<void> _checkAccessToken(FitbitAPIURL fitbitUrl) async {
    //check if the access token is stil valid, if not refresh it
    if (!await (FitbitConnector.isTokenValid(
        fitbitCredentials: fitbitUrl.fitbitCredentials!))) {
      await FitbitConnector.refreshToken(
          fitbitCredentials: fitbitUrl.fitbitCredentials!,
          clientID: clientID,
          clientSecret: clientSecret);
    } // if
  } //_checkAccessToken

  /// Method that manages errors that could return from the Fitbit API.
  static void manageError(DioError e) {
    switch (e.response!.statusCode) {
      case 200:
        break;
      case 400:
        throw FitbitBadRequestException(
            message: e.response!.data['errors'][0]['message']);
      case 401:
        throw FitbitUnauthorizedException(
            message: e.response!.data['errors'][0]['message']);
      case 403:
        throw FitbitForbiddenException(
            message: e.response!.data['errors'][0]['message']);
      case 404:
        throw FitbitNotFoundException(
            message: e.response!.data['errors'][0]['message']);
      case 429:
        throw FitbitRateLimitExceededException(
            message: e.response!.data['errors'][0]['message']);
    } // switch
  } // manageError

} // FitbitDataManager
