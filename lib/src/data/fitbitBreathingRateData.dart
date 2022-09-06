import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitBreathingRateData] is a class implementing the data model of the
/// breathing rate data.
class FitbitBreathingRateData implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The date of monitoring of the data.
  DateTime? dateOfMonitoring;

  /// The value of the data.
  double? value;

  /// Default [FitbitBreathingRateData] constructor.
  FitbitBreathingRateData({
    this.userID,
    this.dateOfMonitoring,
    this.value,
  });

  /// Generates a [FitbitBreathingRateData] obtained from a json.
  factory FitbitBreathingRateData.fromJson(
      {required Map<String, dynamic> json}) {
    return FitbitBreathingRateData(
      userID: json['userID'],
      dateOfMonitoring: Formats.onlyDayDateFormatTicks.parse(json['dateTime']),
      value: json['value'],
    );
  } // fromJson

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'userID': userID,
      'dateTime': dateOfMonitoring,
      'value': value,
    };
  } // toJson

  @override
  String toString() {
    return (StringBuffer('FitbitBreathingRateData(')
          ..write('userID: $userID, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  } // toString

} // FitbitSpO2Data
