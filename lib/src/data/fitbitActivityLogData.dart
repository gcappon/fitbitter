import 'fitbitData.dart';

class FitbitActivityLogData implements FitbitData {
  const FitbitActivityLogData({
    required this.userId,
    required this.logId,
    required this.activityName,
    required this.activityTypeId,
    required this.duration,
    required this.originalDuration,
    required this.startTime,
    required this.originalStartTime,
    required this.logType,
    required this.averageHeartRate,
    required this.heartRateLink,
    required this.heartRateZones,
    required this.source,
  });

  final String? userId;
  final int? logId;
  final String? activityName;
  final int? activityTypeId;
  final int? duration;
  final int? originalDuration;
  final DateTime? startTime;
  final DateTime? originalStartTime;
  final String? logType;
  final int? averageHeartRate;
  final String? heartRateLink;

  final List<HeartRateZone>? heartRateZones;
  final SourceData? source;

  factory FitbitActivityLogData.fromJson(Map<String, dynamic> json, {required String? userId}) =>
      FitbitActivityLogData(
        userId: userId,
        logId: json['logId'],
        activityName: json['activityName'],
        activityTypeId: json['activityTypeId'],
        duration: json['duration'],
        originalDuration: json['originalDuration'],
        startTime: DateTime.tryParse(json['startTime'] ?? ''),
        originalStartTime: DateTime.tryParse(json['originalStartTime'] ?? ''),
        logType: json['logType'],
        averageHeartRate: json['averageHeartRate'],
        heartRateLink: json['heartRateLink'],
        heartRateZones:
            (json['heartRateZones'] as List?)?.map((e) => HeartRateZone.fromJson(e)).toList(),
        source: json['source'] != null ? SourceData.fromJson(json['source']) : null,
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
        'logType': logType,
        'averageHeartRate': averageHeartRate,
        'heartRateLink': heartRateLink,
        'heartRateZones': heartRateZones?.map((e) => e.toJson()).toList(),
        'source': source?.toJson(),
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
