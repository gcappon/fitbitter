
import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitHeartRateData] is a class implementing the data model of the
/// user heart activity data.
class FitbitHeartRateData implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The date of monitoring of the data.
  DateTime? dateOfMonitoring;

  /// The calories spent out of active range during the [dateOfMonitoring].
  double? caloriesOutOfRange;

  /// The minimum value of the out of active range.
  int? minimumOutOfRange;

  /// The minutes spent out of active range during the [dateOfMonitoring].
  int? minutesOutOfRange;

  /// The calories spent in the fat burn range during the [dateOfMonitoring].
  double? caloriesFatBurn;

  /// The minimum value of the fat burn range.
  int? minimumFatBurn;

  /// The minutes spent in the fat burn range during the [dateOfMonitoring].
  int? minutesFatBurn;

  /// The calories spent in the cardio range during the [dateOfMonitoring].
  double? caloriesCardio;

  /// The minimum value of the cardio range.
  int? minimumCardio;

  /// The minutes spent in the cardio range during the [dateOfMonitoring].
  int? minutesCardio;

  /// The calories spent in the peak range during the [dateOfMonitoring].
  double? caloriesPeak;

  /// The minimum value of the peak range.
  int? minimumPeak;

  /// The minutes spent in the peak range during the [dateOfMonitoring].
  int? minutesPeak;

  /// The resting heart rate during the [dateOfMonitoring].
  int? restingHeartRate;

  /// Default [FitbitHeartRateData] constructor.
  FitbitHeartRateData({
    this.userID,
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

  /// Generates a [FitbitHeartRateData] obtained from a json.
  factory FitbitHeartRateData.fromJson({required Map<String, dynamic> json}) {
    return FitbitHeartRateData(
      userID: json['userID'],
      dateOfMonitoring:
          DateTime.parse(json['dateOfMonitoring']),
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
  } // fromJson

  @override
  String toString() {
    return (StringBuffer('FitbitHeartRateData(')
          ..write('userID: $userID, ')
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
  } // toString

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'userID': userID,
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
  } // toJson

} // FitbitHeartRateData
