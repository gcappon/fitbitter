import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'fitbitAPIURL.dart';

class FitbitAuthAPIURL extends FitbitAPIURL {

  String data;
  String authorizationHeader;

  /// Default constructor
  FitbitAuthAPIURL({String url, String userID, String data, String authorizationHeader}){
    // super fields
    this.url = url;
    this.userID = userID;

    // FitbitAuthAPIURL fields
    this.data = data;
    this.authorizationHeader = authorizationHeader;
    
  }// FitbitAuthAPIURL

  /// factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to refresh the access token.
  factory FitbitAuthAPIURL.refreshToken({String userID, String clientID, String clientSecret}){
    
    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader = stringToBase64.encode("$clientID:$clientSecret"); 

    return FitbitAuthAPIURL(
      url: 'https://api.fitbit.com/oauth2/token',
      userID: userID,
      data: 'client_id=$clientID&grant_type=refresh_token&refresh_token=${GetIt.instance<SharedPreferences>().getString('fitbitRefreshToken')}',
      authorizationHeader: 'Basic $authorizationHeader',
    );

  }// FitbitAuthAPIURL.refreshToken

  /// factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to get to the fitbit authorization form.
  factory FitbitAuthAPIURL.authorizeForm({String userID, String redirectUri, String clientID}){

    // Encode the redirectUri
    final String encodedRedirectUri = Uri.encodeFull(redirectUri);

    return FitbitAuthAPIURL(
      url: 'https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=$clientID&redirect_uri=$encodedRedirectUri&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800',
      userID: userID,
      data: null,
      authorizationHeader: null,
    );

  }// FitbitAuthAPIURL.authorizeForm

  /// factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to get the access and refresh tokens.
  factory FitbitAuthAPIURL.authorize({String userID, String redirectUri, String code, String clientID, String clientSecret}){

    // Encode the redirectUri
    final String encodedRedirectUri = Uri.encodeFull(redirectUri);

    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader = stringToBase64.encode("$clientID:$clientSecret"); 

    return FitbitAuthAPIURL(
      userID: userID,
      url: 'https://api.fitbit.com/oauth2/token',
      data: 'client_id=$clientID&grant_type=authorization_code&code=$code&redirect_uri=$encodedRedirectUri',
      authorizationHeader: 'Basic $authorizationHeader',
    );

  }// FitbitAuthAPIURL.authorize

  /// factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to revoke the access and refresh tokens.
  factory FitbitAuthAPIURL.unauthorize({String clientID, String clientSecret}){

    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader = stringToBase64.encode("$clientID:$clientSecret"); 

    return FitbitAuthAPIURL(
      userID: null,
      url: 'https://api.fitbit.com/oauth2/revoke',
      data: 'token=${GetIt.instance<SharedPreferences>().getString('fitbitRefreshToken')}',
      authorizationHeader: 'Basic $authorizationHeader',
    );

  }// FitbitAuthAPIURL.unauthorize

  /// factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to get the validity of the access and refresh tokens.
  factory FitbitAuthAPIURL.isTokenValid(){

    return FitbitAuthAPIURL(
      userID: null,
      url: 'https://api.fitbit.com/1.1/oauth2/introspect',
      data: 'token=${GetIt.instance<SharedPreferences>().getString("fitbitAccessToken")}',
      authorizationHeader: 'Bearer ${GetIt.instance<SharedPreferences>().getString("fitbitAccessToken")}',
    );

  }// FitbitAuthAPIURL.isTokenValid

} // FitbitAuthAPIURL
