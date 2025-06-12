import 'fitbitData.dart';

class FitbitActivityLogData implements FitbitData {
  FitbitActivityLogData({
    this.logId,
    this.activityTypeId,
    this.activityName,
    this.calories,
    this.steps,
    this.duration,
    this.activeDuration,
    this.activityLevel,
    this.source,
    this.logType,
    this.manualValuesSpecified,
    this.intervalWorkoutData,
    this.heartRateZones,
    this.activeZoneMinutes,
    this.inProgress,
    this.caloriesLink,
    this.lastModified,
    this.startTime,
    this.originalStartTime,
    this.originalDuration,
    this.elevationGain,
    this.hasActiveZoneMinutes,
  });

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

  factory FitbitActivityLogData.fromJson(Map<String, dynamic> json) {
    return FitbitActivityLogData(
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
