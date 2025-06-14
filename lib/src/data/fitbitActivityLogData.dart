import 'fitbitData.dart';

class FitbitActivityLogData implements FitbitData {
  FitbitActivityLogData({
    required this.userId,
    required this.logId,
    required this.activityTypeId,
    required this.activityName,
    required this.calories,
    required this.steps,
    required this.duration,
    required this.activeDuration,
    required this.activityLevel,
    required this.source,
    required this.logType,
    required this.manualValuesSpecified,
    required this.intervalWorkoutData,
    required this.heartRateZones,
    required this.activeZoneMinutes,
    required this.inProgress,
    required this.caloriesLink,
    required this.lastModified,
    required this.startTime,
    required this.originalStartTime,
    required this.originalDuration,
    required this.elevationGain,
    required this.hasActiveZoneMinutes,
  });

  final String userId;
  final String? logId;
  final int? activityTypeId;
  final String? activityName;
  final double? calories;
  final int? steps;
  final int? duration;
  final int? activeDuration;
  final List<Map<String, dynamic>>? activityLevel;
  final Map<String, dynamic>? source;
  final String? logType;
  final Map<String, dynamic>? manualValuesSpecified;
  final Map<String, dynamic>? intervalWorkoutData;
  final List<Map<String, dynamic>>? heartRateZones;
  final Map<String, dynamic>? activeZoneMinutes;
  final bool? inProgress;
  final String? caloriesLink;
  final DateTime? lastModified;
  final DateTime? startTime;
  final DateTime? originalStartTime;
  final int? originalDuration;
  final double? elevationGain;
  final bool? hasActiveZoneMinutes;

  factory FitbitActivityLogData.fromJson(Map<String, dynamic> json, {required String userId}) {
    return FitbitActivityLogData(
      userId: json['userId'] as String,
      logId: json['logId']?.toString(),
      activityTypeId: json['activityTypeId'],
      activityName: json['activityName'],
      calories: (json['calories'] as num?)?.toDouble(),
      steps: json['steps'],
      duration: json['duration'],
      activeDuration: json['activeDuration'],
      activityLevel: (json['activityLevel'] as List?)?.cast<Map<String, dynamic>>(),
      source: json['source'] as Map<String, dynamic>?,
      logType: json['logType'],
      manualValuesSpecified: json['manualValuesSpecified'] as Map<String, dynamic>?,
      intervalWorkoutData: json['intervalWorkoutData'] as Map<String, dynamic>?,
      heartRateZones: (json['heartRateZones'] as List?)?.cast<Map<String, dynamic>>(),
      activeZoneMinutes: json['activeZoneMinutes'] as Map<String, dynamic>?,
      inProgress: json['inProgress'],
      caloriesLink: json['caloriesLink'],
      lastModified: DateTime.tryParse(json['lastModified'] ?? ''),
      startTime: DateTime.tryParse(json['startTime'] ?? ''),
      originalStartTime: DateTime.tryParse(json['originalStartTime'] ?? ''),
      originalDuration: json['originalDuration'],
      elevationGain: (json['elevationGain'] as num?)?.toDouble(),
      hasActiveZoneMinutes: json['hasActiveZoneMinutes'],
    );
  }

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() => {
        'logId': logId,
        'activityTypeId': activityTypeId,
        'activityName': activityName,
        'calories': calories,
        'steps': steps,
        'duration': duration,
        'activeDuration': activeDuration,
        'activityLevel': activityLevel,
        'source': source,
        'logType': logType,
        'manualValuesSpecified': manualValuesSpecified,
        'intervalWorkoutData': intervalWorkoutData,
        'heartRateZones': heartRateZones,
        'activeZoneMinutes': activeZoneMinutes,
        'inProgress': inProgress,
        'caloriesLink': caloriesLink,
        'lastModified': lastModified?.toIso8601String(),
        'startTime': startTime?.toIso8601String(),
        'originalStartTime': originalStartTime?.toIso8601String(),
        'originalDuration': originalDuration,
        'elevationGain': elevationGain,
        'hasActiveZoneMinutes': hasActiveZoneMinutes,
      };

  @override
  String toString() => toJson().toString();
}
