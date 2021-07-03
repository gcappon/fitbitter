import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitActivityTimeseriesData] is a class implementing the data model of the
/// physical activity timeseries data.
class FitbitActivityTimeseriesData implements FitbitData {
  /// The user encoded id.
  String? encodedId;

  /// The date of monitoring of the data.
  DateTime? dateOfMonitoring;

  /// The type of the activity timeseries data.
  String? type;

  /// The value of the data.
  double? value;

  /// Default [FitbitActivityTimeseriesData] constructor.
  FitbitActivityTimeseriesData({
    this.encodedId,
    this.dateOfMonitoring,
    this.type,
    this.value,
  });

  /// Generates a [FitbitActivityTimeseriesData] obtained from a json.
  factory FitbitActivityTimeseriesData.fromJson(
      {required Map<String, dynamic> json}) {
    return FitbitActivityTimeseriesData(
      encodedId: json['encodedId'],
      dateOfMonitoring:
          Formats.onlyDayDateFormatTicks.parse(json['dateOfMonitoring']),
      type: json['type'],
      value: json['value'],
    );
  } // fromJson

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'encodedId': encodedId,
      'dateOfMonitoring': dateOfMonitoring,
      'type': type,
      'value': value,
    };
  } // toJson

  @override
  String toString() {
    return (StringBuffer('FitbitActivityTimeseriesData(')
          ..write('encodedId: $encodedId, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write(')'))
        .toString();
  } // toString

} // FitbitActivityTimeseriesData
