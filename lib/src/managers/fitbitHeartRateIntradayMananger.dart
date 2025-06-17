import 'dart:convert';

import 'package:fitbitter/fitbitter.dart';
import 'package:logger/logger.dart';

class FitbitIntradayHeartRateManager extends FitbitDataManager {
  FitbitIntradayHeartRateManager({
    required super.clientID,
    required super.clientSecret,
  });

  Future<FitbitData> fetchData(
    FitbitAPIURL fitbitUrl, {
    required Future<void> Function(FitbitCredentials) onRefresh,
  }) async {
    // Get the response
    final response = await getResponse(fitbitUrl: fitbitUrl, onRefresh: onRefresh);

    // Debugging
    final logger = Logger();
    logger.i('$response');

    final data = response.data is String ? jsonDecode(response.data) : response.data;
    return FitbitIntradayHeartRate.fromJson(data['activities-heart-intraday'] ?? {});
  }

  @override
  Future<List<FitbitData>> fetch(
    FitbitAPIURL url, {
    required Future<void> Function(FitbitCredentials) onRefresh,
  }) {
    throw UnimplementedError();
  }
}
