import '../utils/formats.dart';

import 'fitbitData.dart';

class FitbitHeartData implements FitbitData {

  String encodedId;
  DateTime dateOfMonitoring;

  double caloriesOutOfRange;
  int minimumOutOfRange;
  int minutesOutOfRange;

  double caloriesFatBurn;
  int minimumFatBurn;
  int minutesFatBurn;

  double caloriesCardio;
  int minimumCardio;
  int minutesCardio;

  double caloriesPeak;
  int minimumPeak;
  int minutesPeak;

  int restingHeartRate;

  FitbitHeartData(
      {this.encodedId,
      this.dateOfMonitoring,
      this.caloriesOutOfRange,
      this.minimumOutOfRange,
      this.minutesOutOfRange,
      this.caloriesFatBurn,
      this.minimumFatBurn,
      this.minutesFatBurn,
      this.caloriesCardio,
      this.minimumCardio,
      this.minutesCardio,
      this.caloriesPeak,
      this.minimumPeak,
      this.minutesPeak,
      this.restingHeartRate,
      });

  /// Generates a [FitbitHeartData] obtained from a json.
  factory FitbitHeartData.fromJson({Map<String, dynamic> json}){
    return FitbitHeartData(
      encodedId: json['encodedId'],
      dateOfMonitoring: Formats.onlyDayDateFormatTicks.parse(json['dateOfMonitoring']),
      caloriesOutOfRange: json['caloriesOutOfRange'],
      minimumOutOfRange: json['minimumOutOfRange'],
      minutesOutOfRange: json['minutesOutOfRange'],
      caloriesFatBurn: json['caloriesFatBurn'],
      minimumFatBurn: json['minimumFatBurn'],
      minutesFatBurn: json['minutesFatBurn'],
      caloriesCardio: json['caloriesCardio'],
      minimumCardio: json['minimumCardio'],
      minutesCardio: json['minutesCardio'],
      caloriesPeak: json['caloriesPeak'],
      minimumPeak: json['minimumPeak'],
      minutesPeak: json['minutesPeak'],
      restingHeartRate: json['restingHeartRate'],
    );
  }// fromJson

  @override
  String toString() {
    return (StringBuffer('FitbitHeartData(')
          ..write('encodedId: $encodedId, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('caloriesOutOfRange: $caloriesOutOfRange, ')
          ..write('minimumOutOfRange: $minimumOutOfRange, ')
          ..write('minutesOutOfRange: $minutesOutOfRange, ')
          ..write('caloriesFatBurn: $caloriesFatBurn, ')
          ..write('minimumFatBurn: $minimumFatBurn, ')
          ..write('minutesFatBurn: $minutesFatBurn, ')
          ..write('caloriesCardio: $caloriesCardio, ')
          ..write('minimumCardio: $minimumCardio, ')
          ..write('minutesCardio: $minutesCardio, ')
          ..write('caloriesPeak: $caloriesPeak, ')
          ..write('minimumPeak: $minimumPeak, ')
          ..write('minutesPeak: $minutesPeak, ')
          ..write('restingHeartRate: $restingHeartRate, ')
          ..write(')'))
        .toString();
  }// toString
  
  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'encodedId': encodedId,
      'dateOfMonitoring': dateOfMonitoring,
      'caloriesOutOfRange': caloriesOutOfRange,
      'minimumOutOfRange': minimumOutOfRange,
      'minutesOutOfRange': minutesOutOfRange,
      'caloriesFatBurn': caloriesFatBurn,
      'minimumFatBurn': minimumFatBurn,
      'minutesFatBurn': minutesFatBurn,
      'caloriesCardio': caloriesCardio,
      'minimumCardio': minimumCardio,
      'minutesCardio': minutesCardio,
      'caloriesPeak': caloriesPeak,
      'minimumPeak': minimumPeak,
      'minutesPeak': minutesPeak,
      'restingHeartRate': restingHeartRate,
    };
  }// toJson


}// FitbitHeartData