import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:logger/logger.dart';

import 'package:fitbitter/src/urls/fitbitAuthAPIURL.dart';

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
    String fa =
        fitbitAccessToken == null ? this.fitbitAccessToken : fitbitAccessToken;
    String fr = fitbitRefreshToken == null
        ? this.fitbitRefreshToken
        : fitbitRefreshToken;
    return FitbitCredentials(
        userID: u, fitbitAccessToken: fa, fitbitRefreshToken: fr);
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

/// [FitbitConnector] is a class that is in charge of managing the connection authorization
///  between the app and Fitbit APIs.
/// In details, it can authorize the app thus retaining the access and refresh tokens (see
/// [FitbitConnector.authorize] for more details), refresh the access token if needed (see
/// [FitbitConnector.refreshToken] for more details), unauthorize the app (see
/// [FitbitConnector.unauthorize] for more details), and check for the access token status
/// (see [FitbitConnector.isTokenValid] for more details).

class FitbitConnector {
  /// [FitbitConnector] Singleton instance.
  static final FitbitConnector _instance = FitbitConnector._internal();

  /// Public factory constructor of [FitbitConnector].
  factory FitbitConnector() => _instance;

  /// [FitbitConnector] internal constructor used to implement the Singleton pattern.
  FitbitConnector._internal();

  /// Method that refreshes the Fitbit access token and returns the new, refreshed [FitbitCredentials].
  static Future<FitbitCredentials> refreshToken(
      {required String clientID,
      required String clientSecret,
      required FitbitCredentials fitbitCredentials}) async {
    // Instantiate Dio and its Response
    Dio dio = Dio();
    Response response;

    // Generate the fitbit url
    final fitbitUrl = FitbitAuthAPIURL.refreshToken(
        clientID: clientID,
        clientSecret: clientSecret,
        fitbitCredentials: fitbitCredentials);

    // Post refresh query to Fitbit API
    response = await dio.post(
      fitbitUrl.url,
      data: fitbitUrl.data,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': fitbitUrl.authorizationHeader,
        },
      ),
    );

    // Debugging
    final logger = Logger();
    logger.i('$response');

    // Overwrite the fitbit credentials and return them
    final accessToken = response.data['access_token'] as String;
    final refreshToken = response.data['refresh_token'] as String;
    return fitbitCredentials.copyWith(
        fitbitAccessToken: accessToken, fitbitRefreshToken: refreshToken);
  } // refreshToken

  /// Method that checks if the current token is still valid to be used
  /// by the Fitbit APIs OAuth or it is expired.
  static FutureOr<bool> isTokenValid(
      {required FitbitCredentials fitbitCredentials}) async {
    // Instantiate Dio and its Response
    Dio dio = Dio();
    late Response response;

    final fitbitUrl = FitbitAuthAPIURL.isTokenValid(
        fitbitAccessToken: fitbitCredentials.fitbitAccessToken);

    //Get the response
    try {
      response = await dio.post(
        fitbitUrl.url,
        data: fitbitUrl.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': fitbitUrl.authorizationHeader,
          },
        ),
      );
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        return false;
      }
    }

    // Debugging
    final logger = Logger();
    logger.i('$response');

    // get token status and return it
    return response.data['active'] as bool;
  } // isTokenValid

  /// Method that implements the OAuth 2.0 protocol and gets the access and refresh tokens from Fitbit APIs.
  static Future<FitbitCredentials?> authorize(
      {required String clientID,
      required String clientSecret,
      required String redirectUri,
      required String callbackUrlScheme}) async {
    // Instantiate Dio and its Response
    Dio dio = Dio();
    Response response;

    FitbitCredentials? fitbitCredentials;

    // Generate the fitbit url
    final fitbitAuthorizeFormUrl = FitbitAuthAPIURL.authorizeForm(
        redirectUri: redirectUri, clientID: clientID);

    // Perform authentication
    try {
      final result = await FlutterWebAuth.authenticate(
          url: fitbitAuthorizeFormUrl.url,
          callbackUrlScheme: callbackUrlScheme);
      //Get the auth code
      final code = Uri.parse(result).queryParameters['code'];

      // Generate the fitbit url
      final fitbitAuthorizeUrl = FitbitAuthAPIURL.authorize(
          redirectUri: redirectUri,
          code: code,
          clientID: clientID,
          clientSecret: clientSecret);

      response = await dio.post(
        fitbitAuthorizeUrl.url,
        data: fitbitAuthorizeUrl.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': fitbitAuthorizeUrl.authorizationHeader,
          },
        ),
      );

      // Debugging
      final logger = Logger();
      logger.i('$response');

      // Save authorization tokens

      final accessToken = response.data['access_token'] as String;
      final refreshToken = response.data['refresh_token'] as String;
      final userID = response.data['user_id'] as String;

      fitbitCredentials = FitbitCredentials(
          userID: userID,
          fitbitAccessToken: accessToken,
          fitbitRefreshToken: refreshToken);
    } catch (e) {
      print(e);
    } // catch

    return fitbitCredentials;
  } // authorize

  /// Method that revokes the current access tokens.
  static Future<void> unauthorize(
      {required String clientID,
      required String clientSecret,
      required FitbitCredentials fitbitCredentials}) async {
    // Instantiate Dio and its Response
    Dio dio = Dio();
    Response response;

    //String userID;

    // Generate the fitbit url
    final fitbitUrl = FitbitAuthAPIURL.unauthorize(
        clientSecret: clientSecret,
        clientID: clientID,
        fitbitAccessToken: fitbitCredentials.fitbitAccessToken);

    // Post revoke query to Fitbit API
    try {
      response = await dio.post(
        fitbitUrl.url,
        data: fitbitUrl.data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': fitbitUrl.authorizationHeader,
          },
        ),
      );

      // Debugging
      final logger = Logger();
      logger.i('$response');
    } catch (e) {
      print(e);
    } // catch
  } // unauthorize

} // FitbitConnector
