import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitSleepData] is a class implementing the data model of the
/// user sleep data.
class FitbitSleepData implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The date of when the sleep session begun.
  DateTime? dateOfSleep;

  /// The date of the data entry.
  DateTime? entryDateTime;

  /// The level of the sleep data.
  String? level;

  /// Default [FitbitSleepData] constructor.
  FitbitSleepData({
    this.userID,
    this.dateOfSleep,
    this.entryDateTime,
    this.level,
  });

  /// Generates a [FitbitSleepData] obtained from a json.
  factory FitbitSleepData.fromJson({required Map<String, dynamic> json}) {
    return FitbitSleepData(
      userID: json['userID'],
      dateOfSleep: DateTime.parse(json['dateOfSleep']),
      entryDateTime: DateTime.parse(json['entryDateTime']),
      level: json['level'],
    );
  } // fromJson

  @override
  String toString() {
    return (StringBuffer('FitbitSleepData(')
          ..write('userID: $userID, ')
          ..write('dateOfSleep: $dateOfSleep, ')
          ..write('entryDateTime: $entryDateTime, ')
          ..write('level: $level, ')
          ..write(')'))
        .toString();
  } // toString

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'userID': userID,
      'dateOfSleep': dateOfSleep,
      'entryDateTime': entryDateTime,
      'level': level,
    };
  } // toJson

} // FitbitSleepData
