
import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitHeartRateVariabilityData] is a class implementing the data model of the
/// HRV data.
class FitbitHeartRateVariabilityData implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The date of monitoring of the data.
  DateTime? dateOfMonitoring;

  /// The Root Mean Square of Successive Differences (RMSSD) between heart beats. It measures short-term variability in the user’s daily heart rate in milliseconds (ms).
  double? dailyRmssd;

  // The Root Mean Square of Successive Differences (RMSSD) between heart beats. It measures short-term variability in the user’s heart rate while in deep sleep, in milliseconds (ms).
  double? deepRmssd;

  /// Default [FitbitHeartRateVariabilityData] constructor.
  FitbitHeartRateVariabilityData({
    this.userID,
    this.dateOfMonitoring,
    this.dailyRmssd,
    this.deepRmssd,
  });

  /// Generates a [FitbitHeartRateVariabilityData] obtained from a json.
  factory FitbitHeartRateVariabilityData.fromJson(
      {required Map<String, dynamic> json}) {
    return FitbitHeartRateVariabilityData(
      userID: json['userID'],
      dateOfMonitoring: DateTime.parse(json['dateTime']),
      dailyRmssd: json['value']['dailyRmssd'],
      deepRmssd: json['value']['deepRmssd'],
    );
  } // fromJson

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'userID': userID,
      'dateTime': dateOfMonitoring,
      'value': <String, dynamic>{
        'dailyRmssd': dailyRmssd,
        'deepRmssd': deepRmssd,
      },
    };
  } // toJson

  @override
  String toString() {
    return (StringBuffer('FitbitHeartRateVariabilityData(')
          ..write('userID: $userID, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('dailyRmssd: $dailyRmssd, ')
          ..write('deepRmssd: $deepRmssd')
          ..write(')'))
        .toString();
  } // toString

} // FitbitHeartRateVariabilityData
