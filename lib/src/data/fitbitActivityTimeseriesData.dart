import '../utils/formats.dart';

import 'fitbitData.dart';

class FitbitActivityTimeseriesData implements FitbitData {
  String encodedId;

  DateTime dateOfMonitoring;
  String type;
  double value;
  
  FitbitActivityTimeseriesData(
      {this.encodedId,
      this.dateOfMonitoring,
      this.type,
      this.value,
      });

  /// Generates a [FitbitActivityTimeseriesData] obtained from a json.
  factory FitbitActivityTimeseriesData.fromJson({Map<String, dynamic> json}){
    return FitbitActivityTimeseriesData(
      encodedId: json['encodedId'],
      dateOfMonitoring: Formats.onlyDayDateFormatTicks.parse(json['dateOfMonitoring']),
      type: json['type'],
      value: json['value'],
    );
  }// fromJson

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'encodedId': encodedId,
      'dateOfMonitoring': dateOfMonitoring,
      'type' : type,
      'value': value,
    };
  }// toJson

  @override
  String toString() {
    return (StringBuffer('FitbitActivityTimeseriesData(')
          ..write('encodedId: $encodedId, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write(')'))
        .toString();
  }// toString
}// FitbitActivityTimeseriesData