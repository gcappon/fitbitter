import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitActivityTimeseriesData] is a class implementing the data model of the
/// physical activity timeseries data.
class FitbitActivityTimeseriesData implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The date of monitoring of the data.
  DateTime? dateOfMonitoring;

  /// The type of the activity timeseries data.
  String? type;

  /// The value of the data.
  double? value;

  /// Default [FitbitActivityTimeseriesData] constructor.
  FitbitActivityTimeseriesData({
    this.userID,
    this.dateOfMonitoring,
    this.type,
    this.value,
  });

  /// Generates a [FitbitActivityTimeseriesData] obtained from a json.
  factory FitbitActivityTimeseriesData.fromJson(
      {required Map<String, dynamic> json}) {
    return FitbitActivityTimeseriesData(
      userID: json['userID'],
      dateOfMonitoring:
          DateTime.parse(json['dateOfMonitoring']),
      type: json['type'],
      value: json['value'],
    );
  } // fromJson

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'userID': userID,
      'dateOfMonitoring': dateOfMonitoring,
      'type': type,
      'value': value,
    };
  } // toJson

  @override
  String toString() {
    return (StringBuffer('FitbitActivityTimeseriesData(')
          ..write('userID: $userID, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('type: $type, ')
          ..write('value: $value, ')
          ..write(')'))
        .toString();
  } // toString

} // FitbitActivityTimeseriesData
