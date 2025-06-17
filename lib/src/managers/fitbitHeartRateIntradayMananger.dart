import 'dart:convert';

import 'package:fitbitter/fitbitter.dart';
import 'package:logger/logger.dart';

class FitbitIntradayHeartRateManager extends FitbitDataManager {
  FitbitIntradayHeartRateManager({
    required super.clientID,
    required super.clientSecret,
    required super.onRefreshCredentials,
    required super.onResetCredentials,
  });

  Future<FitbitData> fetchData(FitbitAPIURL fitbitUrl) async {
    // Get the response
    final response = await getResponse(fitbitUrl: fitbitUrl);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    final data = response.data is String ? jsonDecode(response.data) : response.data;
    return FitbitIntradayHeartRate.fromJson(data['activities-heart-intraday'] ?? {});
  }

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL url) => throw UnimplementedError();
}
