import 'package:fitbitter/fitbitter.dart';
import 'package:logger/logger.dart';

/// [FitbitActivityLogDataManager] manages requests for [FitbitActivityLogData].
class FitbitActivityLogDataManager extends FitbitDataManager {
  /// Default constructor.
  FitbitActivityLogDataManager({required String clientID, required String clientSecret})
      : super(
          clientID: clientID,
          clientSecret: clientSecret,
        );

  @override
  Future<List<FitbitData>> fetch(
    FitbitAPIURL fitbitUrl, {
    required Future<void> Function(FitbitCredentials) onRefresh,
  }) async {
    // Fetch API response
    final response = await getResponse(fitbitUrl: fitbitUrl, onRefresh: onRefresh);

    // Logging
    final logger = Logger();
    logger.i('[Fitbit] Activity Log Response: $response');

    // Parse and return data
    return _extractFitbitActivityLogData(response, fitbitUrl.fitbitCredentials!.userID);
  }

  List<FitbitActivityLogData> _extractFitbitActivityLogData(dynamic response, String? userID) {
    final data = response['activities'] as List<dynamic>;
    return data.map((record) {
      return FitbitActivityLogData.fromJson(record as Map<String, dynamic>, userId: userID ?? '');
    }).toList();
  }
}
