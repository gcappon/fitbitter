import 'fitbitData.dart';

class FitbitActivityLogData implements FitbitData {
  final int? logId;
  final String? activityName;
  final int? activityId;
  final DateTime? startTime;
  final int? duration;
  final double? calories;
  final double? distance;

  FitbitActivityLogData({
    this.logId,
    this.activityName,
    this.activityId,
    this.startTime,
    this.duration,
    this.calories,
    this.distance,
  });

  factory FitbitActivityLogData.fromJson(Map<String, dynamic> json) {
    return FitbitActivityLogData(
      logId: json['logId'],
      activityName: json['activityName'],
      activityId: json['activityId'],
      startTime: DateTime.tryParse(json['startTime'] ?? ''),
      duration: json['duration'],
      calories: (json['calories'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() => {
    'logId': logId,
    'activityName': activityName,
    'activityId': activityId,
    'startTime': startTime?.toIso8601String(),
    'duration': duration,
    'calories': calories,
    'distance': distance,
  };

  @override
  String toString() => toJson().toString();
}