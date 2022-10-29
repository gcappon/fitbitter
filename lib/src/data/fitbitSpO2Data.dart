import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitSpO2Data] is a class implementing the data model of the
/// SpO2 data.
class FitbitSpO2Data implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The date of monitoring of the data.
  DateTime? dateOfMonitoring;

  /// The average value of the data.
  double? avgValue;

  /// The minimum value of the data.
  double? minValue;

  /// The maximum value of the data.
  double? maxValue;

  /// Default [FitbitSpO2Data] constructor.
  FitbitSpO2Data({
    this.userID,
    this.dateOfMonitoring,
    this.avgValue,
    this.minValue,
    this.maxValue,
  });

  /// Generates a [FitbitSpO2Data] obtained from a json.
  factory FitbitSpO2Data.fromJson({required Map<String, dynamic> json}) {
    return FitbitSpO2Data(
      userID: json['userID'],
      dateOfMonitoring: DateTime.parse(json['dateTime']),
      avgValue: json['value']['avg'],
      minValue: json['value']['min'],
      maxValue: json['value']['max'],
    );
  } // fromJson

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'userID': userID,
      'dateTime': dateOfMonitoring,
      'value': <String, dynamic>{
        'avg': avgValue,
        'min': minValue,
        'max': maxValue,
      },
    };
  } // toJson

  @override
  String toString() {
    return (StringBuffer('FitbitSpO2Data(')
          ..write('userID: $userID, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('avgValue: $avgValue, ')
          ..write('minValue: $minValue, ')
          ..write('maxValue: $maxValue')
          ..write(')'))
        .toString();
  } // toString

} // FitbitSpO2Data
