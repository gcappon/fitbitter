import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/errors/fitbitBadRequestException.dart';
import 'package:fitbitter/src/errors/fitbitForbiddenException.dart';
import 'package:fitbitter/src/errors/fitbitNotFoundException.dart';
import 'package:fitbitter/src/errors/fitbitRateLimitExceededException.dart';
import 'package:fitbitter/src/errors/fitbitUnauthorizedException.dart';
import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

typedef RefreshCallback = Future<void> Function(FitbitCredentials);
typedef ResetCredentialsCallback = Future<void> Function();

/// [FitbitDataManager] is an abstract class the manages the requests related to
/// [FitbitData].
abstract class FitbitDataManager {
  const FitbitDataManager({
    required this.clientID,
    required this.clientSecret,
    required this.onRefreshCredentials,
    required this.onResetCredentials,
  });

  /// The client id.
  final String clientID;

  /// The client secret id.
  final String clientSecret;

  final RefreshCallback onRefreshCredentials;
  final ResetCredentialsCallback onResetCredentials;

  /// Method that fetches data from the Fitbit API.
  Future<List<FitbitData>> fetch(FitbitAPIURL url);

  /// Method the obtains the response from the given [FitbitAPIURL].
  Future<dynamic> getResponse({required FitbitAPIURL fitbitUrl}) async {
    // Check access token
    await _checkAccessToken(fitbitUrl: fitbitUrl);

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
            'Authorization': 'Bearer ${fitbitUrl.fitbitCredentials!.fitbitAccessToken}',
          },
        ),
      );
    } on DioException catch (e) {
      FitbitDataManager.manageError(e);
    } // try - catch

    final decodedResponse = response.data is String ? jsonDecode(response.data) : response.data;

    Future<dynamic> ret = Future.value(decodedResponse);
    return ret;
  } //getResponse

  /// Method that check the validity of the current access token.
  Future<void> _checkAccessToken({required FitbitAPIURL fitbitUrl}) async {
    //check if the access token is stil valid, if not refresh it
    if (!await (FitbitConnector.isTokenValid(fitbitCredentials: fitbitUrl.fitbitCredentials!))) {
      final refreshedCreds = await FitbitConnector.refreshToken(
        fitbitCredentials: fitbitUrl.fitbitCredentials!,
        clientID: clientID,
        clientSecret: clientSecret,
      );

      await onRefreshCredentials(refreshedCreds);
    }
  } //_checkAccessToken

  /// Method that manages errors that could return from the Fitbit API.
  static void manageError(DioException e) {
    final data = e.response?.data;
    final message = _extractMessage(data);

    switch (e.response!.statusCode) {
      case 400:
        throw FitbitBadRequestException(message: message);
      case 401:
        throw FitbitUnauthorizedException(message: message);
      case 403:
        throw FitbitForbiddenException(message: message);
      case 404:
        throw FitbitNotFoundException(message: message);
      case 429:
        throw FitbitRateLimitExceededException(message: message);
      default:
        throw Exception('[Fitbit] Unknown error: $message');
    }
  }

  static String _extractMessage(dynamic data) {
    try {
      if (data is Map && data['errors'] is List && data['errors'].isNotEmpty) {
        return data['errors'][0]['message'] ?? 'Unknown error';
      }
      return data.toString();
    } catch (_) {
      return 'Unknown error';
    }
  }
} // FitbitDataManager
