import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fitbitter/src/urls/fitbitAuthAPIURL.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:logger/logger.dart';

/// [FitbitCredentials] is a class that is in charge of managing the credentials to be used
/// to make requests to the Fitbit Web APIs: [userID], [fitbitAccessToken], and [fitbitRefreshToken].
class FitbitCredentials {
  /// The user id associated to the credentials.
  String userID;

  /// The Fitbit access token associated to the credentials.
  String fitbitAccessToken;

  /// The Fitbit refresh token associated to the credentials.
  String fitbitRefreshToken;

  /// Default constructor of [FitbitCredentials].
  FitbitCredentials({
    required this.userID,
    required this.fitbitAccessToken,
    required this.fitbitRefreshToken,
  });

  /// Method to be used to create new [FitbitCredentials] fobjet from the current one
  /// as its copy with (possibly) new [userID], [fitbitAccessToken], and/or [fitbitRefreshToken].
  FitbitCredentials copyWith(
      {String? userID, String? fitbitAccessToken, String? fitbitRefreshToken}) {
    String u = userID == null ? this.userID : userID;
    String fa = fitbitAccessToken == null ? this.fitbitAccessToken : fitbitAccessToken;
    String fr = fitbitRefreshToken == null ? this.fitbitRefreshToken : fitbitRefreshToken;
    return FitbitCredentials(userID: u, fitbitAccessToken: fa, fitbitRefreshToken: fr);
  } //copyWith

  @override
  String toString() {
    return (StringBuffer('FitbitCredentials(')
          ..write('userID: $userID, ')
          ..write('fitbitAccessToken: $fitbitAccessToken, ')
          ..write('fitbitRefreshToken: $fitbitRefreshToken')
          ..write(')'))
        .toString();
  } // toString
} // FitbitCredentials

class FitbitConnector {
  static final FitbitConnector _instance = FitbitConnector._internal();

  factory FitbitConnector() => _instance;

  FitbitConnector._internal();

  static final _dio = Dio();
  static final _logger = Logger();

  static Future<FitbitCredentials> refreshToken({
    required String clientID,
    required String clientSecret,
    required FitbitCredentials fitbitCredentials,
  }) async {
    final url = FitbitAuthAPIURL.refreshToken(
      clientID: clientID,
      clientSecret: clientSecret,
      fitbitCredentials: fitbitCredentials,
    );

    try {
      final response = await _dio.post(
        url.url,
        data: url.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': url.authorizationHeader},
        ),
      );

      _logger.i('[Fitbit] Token Refreshed: ${response.data}');

      return fitbitCredentials.copyWith(
        fitbitAccessToken: response.data['access_token'],
        fitbitRefreshToken: response.data['refresh_token'],
      );
    } catch (e) {
      _logger.e('[Fitbit] Token Refresh Error: $e');
      rethrow;
    }
  }

  static Future<bool> isTokenValid({
    required FitbitCredentials fitbitCredentials,
  }) async {
    final url = FitbitAuthAPIURL.isTokenValid(
      fitbitAccessToken: fitbitCredentials.fitbitAccessToken,
    );

    try {
      final response = await _dio.post(
        url.url,
        data: url.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': url.authorizationHeader},
        ),
      );

      _logger.i('[Fitbit] Token Valid Check: ${response.data}');
      return (response.data['active'] as bool?) ?? false;
    } on DioException catch (e) {
      return ![400, 401].contains(e.response?.statusCode);
    }
  }

  static Future<FitbitCredentials?> authorize({
    required String clientID,
    required String clientSecret,
    required String redirectUri,
    required String callbackUrlScheme,
    List<FitbitAuthScope> scopeList = const [
      FitbitAuthScope.ACTIVITY,
      FitbitAuthScope.HEART_RATE,
    ],
    int expiresIn = 28800,
  }) async {
    final authFormUrl = FitbitAuthAPIURL.authorizeForm(
      redirectUri: redirectUri,
      clientID: clientID,
      scopeList: scopeList,
      expiresIn: expiresIn,
    );

    try {
      final result = await FlutterWebAuth2.authenticate(
        url: authFormUrl.url,
        callbackUrlScheme: callbackUrlScheme,
      );

      final code = Uri.parse(result).queryParameters['code'];
      if (code == null) throw Exception('Missing code in redirect URL');

      final tokenUrl = FitbitAuthAPIURL.authorize(
        redirectUri: redirectUri,
        code: code,
        clientID: clientID,
        clientSecret: clientSecret,
      );

      final response = await _dio.post(
        tokenUrl.url,
        data: tokenUrl.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': tokenUrl.authorizationHeader},
        ),
      );

      _logger.i('[Fitbit] Authorization Success: ${response.data}');

      return FitbitCredentials(
        userID: response.data['user_id'],
        fitbitAccessToken: response.data['access_token'],
        fitbitRefreshToken: response.data['refresh_token'],
      );
    } catch (e) {
      _logger.e('[Fitbit] Authorization Error: $e');
      return null;
    }
  }

  static Future<void> unauthorize({
    required String clientID,
    required String clientSecret,
    required FitbitCredentials fitbitCredentials,
  }) async {
    final url = FitbitAuthAPIURL.unauthorize(
      clientID: clientID,
      clientSecret: clientSecret,
      fitbitAccessToken: fitbitCredentials.fitbitAccessToken,
    );

    try {
      final response = await _dio.post(
        url.url,
        data: url.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Authorization': url.authorizationHeader},
        ),
      );

      _logger.i('[Fitbit] Unauthorization Success: ${response.data}');
    } catch (e) {
      _logger.e('[Fitbit] Unauthorization Error: $e');
    }
  }
} // FitbitConnector
