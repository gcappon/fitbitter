import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitbitter/src/data/fitbitData.dart';
import 'package:fitbitter/src/errors/fitbitException.dart';
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

    try {
      // get the fitbit profile data
      final response = await dio.get(
        fitbitUrl.url,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: {
            'Authorization': 'Bearer ${fitbitUrl.fitbitCredentials!.fitbitAccessToken}',
          },
        ),
      );

      return response.data is String ? jsonDecode(response.data) : response.data;
    } on DioException catch (e) {
      throw manageError(e);
    }
  }

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
  Future<void> manageError(DioException e) async {
    final response = e.response;
    final message = _extractMessage(response?.data);

    if (response?.statusCode != 429) {
      onResetCredentials();
    }

    throw FitbitException(
      statusCode: response?.statusCode,
      message: message,
      type: FitbitExceptionType.fromCode(response?.statusCode),
    );
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
