import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitActivityData] is a class implementing the data model of the
/// user's physical activity data.
class FitbitActivityData implements FitbitData {
  /// The user encoded id.
  String? userID;

  /// The activity type id.
  String? activityId;

  /// The parent activity type id.
  String? activityParentId;

  /// The calories spent during the activity.
  double? calories;

  /// The description of the activity.
  String? description;

  /// The distance spanned during the activity.
  double? distance;

  /// The duration of the activity.
  double? duration;

  /// A flag that tells is the activity is the user's favorite.
  bool? isFavorite;

  /// The univocal activity id.
  String? logId;

  /// The name of the activity.
  String? name;

  /// The start date of the activity.
  DateTime? dateOfMonitoring;

  /// The start time of the activity.
  DateTime? startTime;

  /// Default [FitbitActivityData] constructor.
  FitbitActivityData({
    this.userID,
    this.activityId,
    this.activityParentId,
    this.calories,
    this.description,
    this.distance,
    this.duration,
    this.dateOfMonitoring,
    this.isFavorite,
    this.logId,
    this.name,
    this.startTime,
  });

  /// Generates a [FitbitActivityData] obtained from a json.
  factory FitbitActivityData.fromJson({required Map<String, dynamic> json}) {
    return FitbitActivityData(
      userID: json['userID'],
      activityId: json['activityId'],
      activityParentId: json['activityParentId'],
      calories: json['calories'],
      dateOfMonitoring:
          Formats.onlyDayDateFormatTicks.parse(json['dateOfMonitoring']),
      description: json['description'],
      distance: json['distance'],
      duration: json['duration'],
      isFavorite: json['isFavorite'],
      logId: json['logId'],
      name: json['name'],
      startTime: Formats.onlyTimeNoSeconds.parse(json['startTime']),
    );
  } // fromJson

  @override
  String toString() {
    return (StringBuffer('FitbitActivityData(')
          ..write('userID: $userID, ')
          ..write('activityId: $activityId, ')
          ..write('activityParentId: $activityParentId, ')
          ..write('calories: $calories, ')
          ..write('dateOfMonitoring: $dateOfMonitoring, ')
          ..write('description: $description, ')
          ..write('distance: $distance, ')
          ..write('duration: $duration, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('logId: $logId, ')
          ..write('name: $name, ')
          ..write('startTime: $startTime, ')
          ..write(')'))
        .toString();
  } // toString

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'userID': userID,
      'activityId': activityId,
      'activityParentId': activityParentId,
      'calories': calories,
      'dateOfMonitoring': dateOfMonitoring,
      'description': description,
      'distance': distance,
      'duration': duration,
      'isFavorite': isFavorite,
      'logId': logId,
      'name': name,
      'startTime': startTime,
    };
  } // toJson

} // FitbitActivityData
