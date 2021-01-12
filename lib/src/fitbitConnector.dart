import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

/// [FitbitConnector] is a class that is in charge of managing the connection authorization
///  between the app and Fitbit APIs.
/// In details, it can authorize the app thus retaining the access and refresh tokens (see 
/// [FitbitConnector.authorize] for more details), refresh the access token if needed (see
/// [FitbitConnector.refreshToken] for more details), unauthorize the app (see 
/// [FitbitConnector.unauthorize] for more details), and check for the access token status
/// (see [FitbitConnector.isTokenValid] for more details). 

class FitbitConnector {

  // FitbitConnector is a Singleton
  static final FitbitConnector _instance = FitbitConnector._internal();
  factory FitbitConnector() => _instance;
  FitbitConnector._internal();

  /// Method that refresh the Fitbit access token
  static Future<void> refreshToken(
    String clientID, String clientSecret) async {

    // Instantiate Dio and its Response 
    Dio dio = Dio();
    Response response;

    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader = stringToBase64.encode("$clientID:$clientSecret");  

    // Post refresh query to Fitbit API
    try {
      response = await dio.post(
        'https://api.fitbit.com/oauth2/token',
        data:
            'client_id=$clientID&grant_type=refresh_token&refresh_token=${GetIt.instance<SharedPreferences>().getString('fitbitRefreshToken')}',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization':
                'Basic $authorizationHeader',
          },
        ),
      );
      print("Fitbitter.FitbitConnector.refreshFitbitToken: ${response.data}"); // for debugging

      // Overwrite the tokens into the shared preferences
      final accessToken = response.data['access_token'] as String;
      final refreshToken = response.data['refresh_token'] as String;
      GetIt.instance<SharedPreferences>()
          .setString('fitbitAccessToken', accessToken);
      GetIt.instance<SharedPreferences>()
          .setString('fitbitRefreshToken', refreshToken);
    } catch (e) {
      print(e);
    } // catch
  }

  /// Method that check if the current token is still valid to be used 
  /// by the Fitbit APIs OAuth or it is expired.
  static Future<bool> isTokenValid() async{

    // Instantiate Dio and its Response 
    Dio dio = Dio();
    Response response;

    // Encode the accessToken
    final String encodedRedirectUri = Uri.encodeFull(GetIt.instance<SharedPreferences>().getString("fitbitAccessToken"));

    //Get the response
    response = await dio.post(
        'https://api.fitbit.com/1.1/oauth2/introspect',

        data:
            'token=${GetIt.instance<SharedPreferences>().getString("fitbitAccessToken")}',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer ${GetIt.instance<SharedPreferences>().getString("fitbitAccessToken")}',
          },
        ),
      );
    
    print("Fitbitter.FitbitConnector.isTokenValid: ${response.data}"); // for debugging

    // get token status and return it
    return response.data['active'] as bool;

  }// isTokenValid

  /// Method that implements the OAuth 2.0 and gets (and retain) the 
  /// access and refresh tokens from Fitbit APIs.
  static Future<String> authorize(
    BuildContext context, String clientID, String clientSecret, String redirectUri, String callbackUrlScheme) async {
    
    // Instantiate Dio and its Response 
    Dio dio = Dio();
    Response response;

    String userID;

    // Encode the redirectUri
    final String encodedRedirectUri = Uri.encodeFull(redirectUri);

    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader = stringToBase64.encode("$clientID:$clientSecret");  

    // Generate the authentication URL
    final String url =
        'https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=$clientID&redirect_uri=$encodedRedirectUri&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800'; // TODO: define a precise scope
    
    // Perform authentication
    try {
      final result = await FlutterWebAuth.authenticate(
          url: url, callbackUrlScheme: callbackUrlScheme);
      final code = Uri.parse(result).queryParameters['code'];      
      response = await dio.post(
        'https://api.fitbit.com/oauth2/token',
        data:
            'client_id=$clientID&grant_type=authorization_code&code=$code&redirect_uri=$encodedRedirectUri',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization':
                'Basic $authorizationHeader',
          },
        ),
      );
      print("Fitbitter.FitbitConnector.authorize: ${response.data}"); // for debugging

      // Save authorization tokens
      final accessToken = response.data['access_token'] as String;
      final refreshToken = response.data['refresh_token'] as String;
      userID = response.data['user_id'] as String;

      GetIt.instance<SharedPreferences>()
          .setString('fitbitAccessToken', accessToken);
      GetIt.instance<SharedPreferences>()
          .setString('fitbitRefreshToken', refreshToken);

    } catch (e) {
      print(e);
    }// catch

    return userID;

  } // authorize

  /// Method that revoke the current access and refresh tokens and 
  /// deletes them from the SharedPrefrences.
  static Future<void> unauthorize(
      String clientID, String clientSecret) async {

    // Instantiate Dio and its Response 
    Dio dio = Dio();
    Response response;

    //String userID;

    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader = stringToBase64.encode("$clientID:$clientSecret");  

    // Post revoke query to Fitbit API
    try {
      response = await dio.post(
        'https://api.fitbit.com/oauth2/revoke',
        data:
            'token=${GetIt.instance<SharedPreferences>().getString('fitbitRefreshToken')}',
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization':
                'Basic $authorizationHeader',
          },
        ),
      );
      print("Fitbitter.FitbitConnector.unauthorize: ${response.data}"); // for debugging

      // Remove the tokens from shared preferences
      GetIt.instance<SharedPreferences>().remove('fitbitAccessToken');
      GetIt.instance<SharedPreferences>().remove('fitbitRefreshToken');

    } catch (e) {
      print(e);
    }// catch

    
  } //unauthorize

}// FitbitConnector