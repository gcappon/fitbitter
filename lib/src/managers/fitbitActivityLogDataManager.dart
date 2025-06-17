import 'package:fitbitter/fitbitter.dart';
import 'package:logger/logger.dart';

/// [FitbitActivityLogDataManager] manages requests for [FitbitActivityLogData].
class FitbitActivityLogDataManager extends FitbitDataManager {
  /// Default constructor.
  FitbitActivityLogDataManager({
    required super.clientID,
    required super.clientSecret,
    required super.onRefreshCredentials,
    required super.onResetCredentials,
  });

  @override
  Future<List<FitbitData>> fetch(FitbitAPIURL fitbitUrl) async {
    // Fetch API response
    final response = await getResponse(fitbitUrl: fitbitUrl);

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
