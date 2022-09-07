import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitCardioScoreData] is a class implementing the data model of the
/// cardio score data.
class FitbitCardioScoreData implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The date of monitoring of the data.
  DateTime? dateOfMonitoring;

  /// The value of the data.
  double? value;

  /// Default [FitbitCardioScoreData] constructor.
  FitbitCardioScoreData({
    this.userID,
    this.dateOfMonitoring,
    this.value,
  });

  /// Generates a [FitbitCardioScoreData] obtained from a json.
  factory FitbitCardioScoreData.fromJson({required Map<String, dynamic> json}) {
    return FitbitCardioScoreData(
      userID: json['userID'],
      dateOfMonitoring: Formats.onlyDayDateFormatTicks.parse(json['dateTime']),
      value: json['value']['vo2Max'],
    );
  } // fromJson

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'userID': userID,
      'dateTime': dateOfMonitoring,
      'value': <String, dynamic>{
        'vo2Max': value,
      },
    };
  } // toJson

  @override
  String toString() {
    return (StringBuffer('FitbitCardioScoreData(')
          ..write('userID: $userID, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('value: $value, ')
          ..write(')'))
        .toString();
  } // toString

} // FitbitCardioScoreData
