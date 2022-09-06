import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitTemperatureSkinData] is a class implementing the data model of the
/// temperature data.
class FitbitTemperatureSkinData implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The date of monitoring of the data.
  DateTime? dateOfMonitoring;

  /// The value of the data.
  double? value;

  // The type of skin temeperature log created.
  String? logType;

  /// Default [FitbitTemperatureSkinData] constructor.
  FitbitTemperatureSkinData({
    this.userID,
    this.dateOfMonitoring,
    this.value,
    this.logType,
  });

  /// Generates a [FitbitTemperatureSkinData] obtained from a json.
  factory FitbitTemperatureSkinData.fromJson(
      {required Map<String, dynamic> json}) {
    return FitbitTemperatureSkinData(
      userID: json['userID'],
      dateOfMonitoring: Formats.onlyDayDateFormatTicks.parse(json['dateTime']),
      value: json['value']['nightlyRelative'],
      logType: json['logType'],
    );
  } // fromJson

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'userID': userID,
      'dateTime': dateOfMonitoring,
      'value': <String, dynamic>{
        'nightlyRelative': value,
      },
      'logType': logType,
    };
  } // toJson

  @override
  String toString() {
    return (StringBuffer('FitbitTemperatureSkinData(')
          ..write('userID: $userID, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('value: $value, ')
          ..write('logType: $logType')
          ..write(')'))
        .toString();
  } // toString

} // FitbitTemperatureSkinData
