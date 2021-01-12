import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Future<FitbitData> fetch(String userID) async {
    //check if the access token is stil valid, if not refresh it
    if (!await FitbitConnector.isTokenValid()) {
      await FitbitConnector.refreshToken(clientID, clientSecret);
    } // if

    // Instantiate Dio and its Response
    Dio dio = Dio();
    Response response;

    // get the fitbit profile data
    response = await dio.get(
      'https://api.fitbit.com/1/user/$userID/profile.json',
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization':
              'Bearer ${GetIt.instance<SharedPreferences>().getString("fitbitAccessToken")}',
        },
      ),
    );

    // TODO: manage exception
    // TODO: read headers
    response.headers['fitbit-rate-limit-remaining'][0]; // The number of calls remaining before hitting the rate limit.
    response.headers['fitbit-rate-limit-limit'][0]; // The quota number of calls.
    response.headers['fitbit-rate-limit-reset'][0]; // The number of seconds until the rate limit resets.

    print(
        "Fitbitter.FitbitAccountDataManager.fetch: ${response.data}"); // for debugging


    return FitbitAccountData.fromJson(json: response.data['user']);
  } // fetch

} // FitbitAccountDataManager
