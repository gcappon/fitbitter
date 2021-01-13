import '../utils/formats.dart';

import 'fitbitData.dart';

class FitbitSleepData implements FitbitData {
  String encodedId;

  DateTime dateOfSleep;
  DateTime entryDateTime;
  String level;
  
  FitbitSleepData(
      {this.encodedId,
      this.dateOfSleep,
      this.entryDateTime,
      this.level,
      });

  /// Generates a [FitbitSleepData] obtained from a json.
  factory FitbitSleepData.fromJson({Map<String, dynamic> json}){
    return FitbitSleepData(
      encodedId: json['encodedId'],
      dateOfSleep: Formats.onlyDayDateFormatTicks.parse(json['dateOfSleep']),
      entryDateTime: DateTime.parse(json['entryDateTime']),
      level: json['level'],
    );
  }// fromJson

  @override
  String toString() {
    return (StringBuffer('FitbitSleepData(')
          ..write('encodedId: $encodedId, ')
          ..write('dateOfSleep: $dateOfSleep, ')
          ..write('entryDateTime: $entryDateTime, ')
          ..write('level: $level, ')
          ..write(')'))
        .toString();
  }// toString
  
  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'encodedId': encodedId,
      'dateOfSleep': dateOfSleep,
      'entryDateTime': entryDateTime,
      'level': level,
    };
  }// toJson


}// FitbitSleepData
