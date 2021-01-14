import '../utils/formats.dart';

import 'fitbitData.dart';

class FitbitActivityData implements FitbitData {
  String encodedId;

  String activityId;
  String activityParentId;
  double calories;
  String description;
  double distance;
  double duration; 
  bool isFavorite;
  String logId;
  String name;

  DateTime dateOfMonitoring;
  DateTime startTime;
  
  FitbitActivityData(
      {this.encodedId,
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
  factory FitbitActivityData.fromJson({Map<String, dynamic> json}){
    return FitbitActivityData(
      encodedId: json['encodedId'],
      activityId: json['activityId'],
      activityParentId: json['activityParentId'],
      calories: json['calories'],
      dateOfMonitoring: Formats.onlyDayDateFormatTicks.parse(json['dateOfMonitoring']),
      description: json['description'],
      distance: json['distance'],
      duration: json['duration'],
      isFavorite: json['isFavorite'],
      logId: json['logId'],
      name: json['name'],
      startTime: Formats.onlyTimeNoSeconds.parse(json['startTime']),
    );
  }// fromJson

  @override
  String toString() {
    return (StringBuffer('FitbitActivityData(')
          ..write('encodedId: $encodedId, ')
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
  }// toString
  
  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'encodedId': encodedId,
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
  }// toJson

}// FitbitActivityData