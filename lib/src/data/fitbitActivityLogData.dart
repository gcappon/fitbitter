import 'fitbitData.dart';

class FitbitActivityLogData implements FitbitData {
  FitbitActivityLogData({
    required this.userId,
    required this.logId,
    required this.activityName,
    required this.activityTypeId,
    required this.duration,
    required this.originalDuration,
    required this.startTime,
    required this.originalStartTime,
    required this.steps,
    required this.calories,
    required this.activeDuration,
    required this.elevationGain,
    required this.logType,
    required this.tcxLink,
    required this.caloriesLink,
    required this.lastModified,
  });

  final String userId;
  final int? logId;
  final String? activityName;
  final int? activityTypeId;
  final int? duration;
  final int? originalDuration;
  final DateTime? startTime;
  final DateTime? originalStartTime;
  final int? steps;
  final double? calories;
  final int? activeDuration;
  final int? elevationGain;
  final String? logType;
  final String? tcxLink;
  final String? caloriesLink;
  final DateTime? lastModified;

  factory FitbitActivityLogData.fromJson(Map<String, dynamic> json, {required String? userId}) =>
      FitbitActivityLogData(
        userId: userId ?? '',
        logId: json['logId'],
        activityName: json['activityName'],
        activityTypeId: json['activityTypeId'],
        duration: json['duration'],
        originalDuration: json['originalDuration'],
        startTime: DateTime.tryParse(json['startTime'] ?? ''),
        originalStartTime: DateTime.tryParse(json['originalStartTime'] ?? ''),
        steps: json['steps'],
        calories: (json['calories'] as num?)?.toDouble(),
        activeDuration: json['activeDuration'],
        elevationGain: (json['elevationGain'] as num?)?.toInt(),
        logType: json['logType'],
        tcxLink: json['tcxLink'],
        caloriesLink: json['caloriesLink'],
        lastModified: DateTime.tryParse(json['lastModified'] ?? ''),
      );

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() => {
        'logId': logId,
        'activityName': activityName,
        'activityTypeId': activityTypeId,
        'duration': duration,
        'originalDuration': originalDuration,
        'startTime': startTime?.toIso8601String(),
        'originalStartTime': originalStartTime?.toIso8601String(),
        'steps': steps,
        'calories': calories,
        'activeDuration': activeDuration,
        'elevationGain': elevationGain,
        'logType': logType,
        'tcxLink': tcxLink,
        'caloriesLink': caloriesLink,
        'lastModified': lastModified?.toIso8601String(),
      };

  @override
  String toString() => toJson().toString();
}
