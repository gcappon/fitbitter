import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitSpO2IntradayData] is a class implementing the data model of the
/// SpO2 data.
class FitbitSpO2IntradayData implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The date of monitoring of the data.
  DateTime? dateOfMonitoring;

  /// The average value of the data.
  double? value;

  /// Default [FitbitSpO2IntradayData] constructor.
  FitbitSpO2IntradayData({this.userID, this.dateOfMonitoring, this.value});

  /// Generates a [FitbitSpO2IntradayData] obtained from a json.
  factory FitbitSpO2IntradayData.fromJson(
      {required Map<String, dynamic> json}) {
    return FitbitSpO2IntradayData(
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
    return (StringBuffer('FitbitSpO2IntradayData(')
          ..write('userID: $userID, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  } // toString

} // FitbitSpO2IntradayData
