import '../utils/formats.dart';

import 'fitbitData.dart';

class FitbitDeviceData implements FitbitData {
  String encodedId;

  String deviceId;
  String batteryLevel;
  String deviceVersion;
  String type;

  DateTime lastSyncTime;
  
  FitbitDeviceData(
      {this.encodedId,
      this.batteryLevel,
      this.deviceId,
      this.deviceVersion,
      this.lastSyncTime,
      this.type,
      });

  /// Generates a [FitbitDeviceData] obtained from a json.
  factory FitbitDeviceData.fromJson({Map<String, dynamic> json}){
    return FitbitDeviceData(
      encodedId: json['encodedId'],
      batteryLevel: json['batteryLevel'],
      deviceId: json['deviceId'],
      deviceVersion: json['deviceVersion'],
      lastSyncTime: Formats.onlyDayDateFormatTicks.parse(json['lastSyncTime']),
      type: json['type'],
    );
  }// fromJson

  @override
  String toString() {
    return (StringBuffer('FitbitDeviceData(')
          ..write('encodedId: $encodedId, ')
          ..write('deviceId: $deviceId, ')
          ..write('deviceVersion: $deviceVersion, ')
          ..write('batteryLevel: $batteryLevel, ')
          ..write('lastSyncTime: $lastSyncTime, ')
          ..write('type: $type, ')
          ..write(')'))
        .toString();
  }// toString
  
  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'encodedId': encodedId,
      'deviceId': deviceId,
      'deviceVersion': deviceVersion,
      'batteryLevel': batteryLevel,
      'lastSyncTime': lastSyncTime,
      'type': type,
    };
  }// toJson

}// FitbitDeviceData