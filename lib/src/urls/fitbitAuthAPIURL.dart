import 'dart:convert';

import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

/// [FitbitAuthAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to
/// be used by [FitbitConnector].
class FitbitAuthAPIURL extends FitbitAPIURL {
  /// The data to be attached to the url.
  late String? data;

  /// The authorization header of the url.
  late String? authorizationHeader;

  /// Default [FitbitAuthAPIURL] constructor.
  FitbitAuthAPIURL(
      {required String url,
      required FitbitCredentials? fitbitCredentials,
      required String? data,
      required String? authorizationHeader})
      : super(fitbitCredentials: fitbitCredentials, url: url) {
    this.data = data;
    this.authorizationHeader = authorizationHeader;
  }

  /// Factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to refresh the access token.
  factory FitbitAuthAPIURL.refreshToken({
    required FitbitCredentials fitbitCredentials,
    required String clientID,
    required String clientSecret,
  }) {
    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader =
        stringToBase64.encode("$clientID:$clientSecret");

    return FitbitAuthAPIURL(
      url: '${_getBaseURL()}/token',
      fitbitCredentials: fitbitCredentials,
      data:
          'client_id=$clientID&grant_type=refresh_token&refresh_token=${fitbitCredentials.fitbitRefreshToken}',
      authorizationHeader: 'Basic $authorizationHeader',
    );
  } // FitbitAuthAPIURL.refreshToken

  /// Factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to get to the fitbit authorization form.
  factory FitbitAuthAPIURL.authorizeForm(
      {required String redirectUri, String? clientID}) {
    // Encode the redirectUri
    final String encodedRedirectUri = Uri.encodeFull(redirectUri);

    return FitbitAuthAPIURL(
      url:
          'https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=$clientID&redirect_uri=$encodedRedirectUri&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight%20oxygen_saturation%20respiratory_rate%20temperature&expires_in=604800',
      fitbitCredentials: null,
      data: null,
      authorizationHeader: null,
    );
  } // FitbitAuthAPIURL.authorizeForm

  /// Factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to get the access and refresh tokens.
  factory FitbitAuthAPIURL.authorize(
      {required String redirectUri,
      String? code,
      String? clientID,
      String? clientSecret}) {
    // Encode the redirectUri
    final String encodedRedirectUri = Uri.encodeFull(redirectUri);

    // Generate the authorization header∂
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader =
        stringToBase64.encode("$clientID:$clientSecret");

    return FitbitAuthAPIURL(
      fitbitCredentials: null,
      url: '${_getBaseURL()}/token',
      data:
          'client_id=$clientID&grant_type=authorization_code&code=$code&redirect_uri=$encodedRedirectUri',
      authorizationHeader: 'Basic $authorizationHeader',
    );
  } // FitbitAuthAPIURL.authorize

  /// Factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to revoke the access and refresh tokens.
  factory FitbitAuthAPIURL.unauthorize(
      {String? clientID,
      String? clientSecret,
      required String fitbitAccessToken}) {
    // Generate the authorization header
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String authorizationHeader =
        stringToBase64.encode("$clientID:$clientSecret");

    return FitbitAuthAPIURL(
      fitbitCredentials: null,
      url: '${_getBaseURL()}/revoke',
      data: 'token=$fitbitAccessToken',
      authorizationHeader: 'Basic $authorizationHeader',
    );
  } // FitbitAuthAPIURL.unauthorize

  /// Factory constructor that generates a [FitbitAuthAPIURL] to be used
  /// to get the validity of the access and refresh tokens.
  factory FitbitAuthAPIURL.isTokenValid({required String fitbitAccessToken}) {
    return FitbitAuthAPIURL(
      fitbitCredentials: null,
      url: 'https://api.fitbit.com/1.1/oauth2/introspect',
      data: 'token=$fitbitAccessToken',
      authorizationHeader: 'Bearer $fitbitAccessToken',
    );
  } // FitbitAuthAPIURL.isTokenValid

  /// A private method that generates the base url of a [FitbitAuthAPIURL].
  static String _getBaseURL() {
    return 'https://api.fitbit.com/oauth2';
  } // _getBaseURL

} // FitbitAuthAPIURL
