import 'fitbitData.dart';

class FitbitActivityLogData implements FitbitData {
  final String? userId;
  final int? logId;
  final String? activityName;
  final int? activityTypeId;
  final int? duration;
  final int? originalDuration;
  final DateTime? startTime;
  final DateTime? originalStartTime;
  final int? steps;
  final double? distance;
  final String? distanceUnit;
  final double? calories;
  final String? caloriesLink;
  final String? detailsLink;
  final double? elevationGain;
  final String? logType;
  final DateTime? lastModified;
  final int? activeDuration;
  final bool? hasActiveZoneMinutes;
  final int? averageHeartRate;
  final String? heartRateLink;
  final String? pace;
  final String? speed;
  final String? tcxLink;

  final List<ActivityLevel>? activityLevels;
  final ManualValuesSpecified? manualValues;
  final List<HeartRateZone>? heartRateZones;
  final List<MinutesInHeartRateZone>? activeZoneMinutes;
  final SourceData? source;

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
    required this.distance,
    required this.distanceUnit,
    required this.calories,
    required this.caloriesLink,
    required this.detailsLink,
    required this.elevationGain,
    required this.logType,
    required this.lastModified,
    required this.activeDuration,
    required this.hasActiveZoneMinutes,
    required this.averageHeartRate,
    required this.heartRateLink,
    required this.pace,
    required this.speed,
    required this.tcxLink,
    required this.activityLevels,
    required this.manualValues,
    required this.heartRateZones,
    required this.activeZoneMinutes,
    required this.source,
  });

  factory FitbitActivityLogData.fromJson(Map<String, dynamic> json, {String? userId}) {
    return FitbitActivityLogData(
      userId: userId,
      logId: json['logId'],
      activityName: json['activityName'],
      activityTypeId: json['activityTypeId'],
      duration: json['duration'],
      originalDuration: json['originalDuration'],
      startTime: DateTime.tryParse(json['startTime'] ?? ''),
      originalStartTime: DateTime.tryParse(json['originalStartTime'] ?? ''),
      steps: json['steps'],
      distance: (json['distance'] as num?)?.toDouble(),
      distanceUnit: json['distanceUnit'],
      calories: (json['calories'] as num?)?.toDouble(),
      caloriesLink: json['caloriesLink'],
      detailsLink: json['detailsLink'],
      elevationGain: (json['elevationGain'] as num?)?.toDouble(),
      logType: json['logType'],
      lastModified: DateTime.tryParse(json['lastModified'] ?? ''),
      activeDuration: json['activeDuration'],
      hasActiveZoneMinutes: json['hasActiveZoneMinutes'],
      averageHeartRate: json['averageHeartRate'],
      heartRateLink: json['heartRateLink'],
      pace: json['pace'],
      speed: json['speed'],
      tcxLink: json['tcxLink'],
      activityLevels:
          (json['activityLevel'] as List?)?.map((e) => ActivityLevel.fromJson(e)).toList(),
      manualValues: json['manualValuesSpecified'] != null
          ? ManualValuesSpecified.fromJson(json['manualValuesSpecified'])
          : null,
      heartRateZones:
          (json['heartRateZones'] as List?)?.map((e) => HeartRateZone.fromJson(e)).toList(),
      activeZoneMinutes: (json['activeZoneMinutes']?['minutesInHeartRateZones'] as List?)
          ?.map((e) => MinutesInHeartRateZone.fromJson(e))
          .toList(),
      source: json['source'] != null ? SourceData.fromJson(json['source']) : null,
    );
  }

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
        'distance': distance,
        'distanceUnit': distanceUnit,
        'calories': calories,
        'caloriesLink': caloriesLink,
        'detailsLink': detailsLink,
        'elevationGain': elevationGain,
        'logType': logType,
        'lastModified': lastModified?.toIso8601String(),
        'activeDuration': activeDuration,
        'hasActiveZoneMinutes': hasActiveZoneMinutes,
        'averageHeartRate': averageHeartRate,
        'heartRateLink': heartRateLink,
        'pace': pace,
        'speed': speed,
        'tcxLink': tcxLink,
        'activityLevel': activityLevels?.map((e) => e.toJson()).toList(),
        'manualValuesSpecified': manualValues?.toJson(),
        'heartRateZones': heartRateZones?.map((e) => e.toJson()).toList(),
        'activeZoneMinutes': {
          'minutesInHeartRateZones': activeZoneMinutes?.map((e) => e.toJson()).toList(),
        },
        'source': source?.toJson(),
      };
}

class ActivityLevel {
  final int? minutes;
  final String? name;

  ActivityLevel({this.minutes, this.name});

  factory ActivityLevel.fromJson(Map<String, dynamic> json) =>
      ActivityLevel(minutes: json['minutes'], name: json['name']);

  Map<String, dynamic> toJson() => {'minutes': minutes, 'name': name};
}

class ManualValuesSpecified {
  final bool? calories;
  final bool? distance;
  final bool? steps;

  ManualValuesSpecified({this.calories, this.distance, this.steps});

  factory ManualValuesSpecified.fromJson(Map<String, dynamic> json) => ManualValuesSpecified(
        calories: json['calories'],
        distance: json['distance'],
        steps: json['steps'],
      );

  Map<String, dynamic> toJson() => {
        'calories': calories,
        'distance': distance,
        'steps': steps,
      };
}

class HeartRateZone {
  final String? name;
  final int? min;
  final int? max;
  final int? minutes;
  final double? caloriesOut;

  HeartRateZone({this.name, this.min, this.max, this.minutes, this.caloriesOut});

  factory HeartRateZone.fromJson(Map<String, dynamic> json) => HeartRateZone(
        name: json['name'],
        min: json['min'],
        max: json['max'],
        minutes: json['minutes'],
        caloriesOut: (json['caloriesOut'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'min': min,
        'max': max,
        'minutes': minutes,
        'caloriesOut': caloriesOut,
      };
}

class MinutesInHeartRateZone {
  final int? minutes;
  final String? zoneName;
  final int? order;
  final String? type;
  final int? minuteMultiplier;

  MinutesInHeartRateZone({
    this.minutes,
    this.zoneName,
    this.order,
    this.type,
    this.minuteMultiplier,
  });

  factory MinutesInHeartRateZone.fromJson(Map<String, dynamic> json) => MinutesInHeartRateZone(
        minutes: json['minutes'],
        zoneName: json['zoneName'],
        order: json['order'],
        type: json['type'],
        minuteMultiplier: json['minuteMultiplier'],
      );

  Map<String, dynamic> toJson() => {
        'minutes': minutes,
        'zoneName': zoneName,
        'order': order,
        'type': type,
        'minuteMultiplier': minuteMultiplier,
      };
}

class SourceData {
  final String? type;
  final String? name;
  final String? id;
  final String? url;
  final List<String>? trackerFeatures;

  SourceData({this.type, this.name, this.id, this.url, this.trackerFeatures});

  factory SourceData.fromJson(Map<String, dynamic> json) => SourceData(
        type: json['type'],
        name: json['name'],
        id: json['id'],
        url: json['url'],
        trackerFeatures: (json['trackerFeatures'] as List?)?.map((e) => e.toString()).toList(),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'id': id,
        'url': url,
        'trackerFeatures': trackerFeatures,
      };
}
