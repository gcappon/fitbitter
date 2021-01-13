import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../urls/fitbitAPIURL.dart';
import '../urls/fitbitAuthAPIURL.dart';

import '../fitbitConnector.dart';

import '../data/fitbitData.dart';
import '../data/fitbitAccountData.dart';

import '../managers/fitbitDataManager.dart';

class FitbitAccountDataManager extends FitbitDataManager {
  FitbitAccountDataManager({String clientID, String clientSecret})
      : super(
          clientID: clientID,
          clientSecret: clientSecret,
        );

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL fitbitUrl) async {
    //check if the access token is stil valid, if not refresh it
    if (!await FitbitConnector.isTokenValid()) {
      await FitbitConnector.refreshToken(
          userID: fitbitUrl.userID,
          clientID: clientID,
          clientSecret: clientSecret);
    } // if

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
    }// try - catch

    final decodedResponse =
        response.data is String ? jsonDecode(response.data) : response.data;
    print(
        "Fitbitter.FitbitAccountDataManager.fetch: $decodedResponse"); // for debugging

    List<FitbitData> ret = List<FitbitData>();
    ret.add(FitbitAccountData.fromJson(json: decodedResponse['user']));
    return ret;

  } // fetch

} // FitbitAccountDataManager
