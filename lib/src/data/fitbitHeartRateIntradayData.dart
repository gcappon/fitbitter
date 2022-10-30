import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitHeartRateIntradayData] is a class implementing the data model of the
/// heart rate intraday data.
class FitbitHeartRateIntradayData implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The date of monitoring of the data.
  DateTime? dateOfMonitoring;

  /// The value of the data.
  double? value;

  /// Default [FitbitHeartRateIntradayData] constructor.
  FitbitHeartRateIntradayData({
    this.userID,
    this.dateOfMonitoring,
    this.value,
  });

  /// Generates a [FitbitHeartRateIntradayData] obtained from a json.
  factory FitbitHeartRateIntradayData.fromJson(
      {required Map<String, dynamic> json}) {
    return FitbitHeartRateIntradayData(
      userID: json['userID'],
      dateOfMonitoring: DateTime.parse(json['dateTime']),
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
    return (StringBuffer('FitbitHeartRateIntradayData(')
          ..write('userID: $userID, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('value: $value, ')
          ..write(')'))
        .toString();
  } // toString

} // FitbitHeartRateIntradayData
