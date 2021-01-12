
import 'dart:convert';

import '../utils/formats.dart';

import 'fitbitData.dart';

class FitbitAccountData implements FitbitData {
  String encodedId;

  int age;
  bool ambassador;
  bool autoStrideEnabled;
  int averageDailySteps;
  String avatar;
  String avatar150;
  String avatar640;
  bool challegesBeta;
  String clockDisplayFormat;
  bool corporate;
  bool corporateAdmin;
  DateTime dateOfBirth;
  String displayName;
  String displayNameSetting;
  String firstName;
  String foodsLocale;
  String fullName;
  String gender;
  String glucoseUnit;
  double height;
  String heightUnit;
  bool isBugReportEnabled;
  bool isChild;
  bool isCoach;
  String languageLocale;
  String lastName;
  bool legalTermsAcceptRequired;
  String locale;
  DateTime memberSince;
  bool mfaEnabled;
  int offsetFromUTCMillis;
  bool sdkDeveloper;
  String sleepTracking;
  String startDayOfWeek;
  double strideLengthRunning;
  String strideLengthRunningType;
  double strideLengthWalking;
  String strideLengthWalkingType;
  String swimUnit;
  String timezone;
  String waterUnit;
  String waterUnitName;
  double weight;
  String weightUnit;
  //TODO: map 'features' field
  //TODO: map 'topBadges' field
  

  FitbitAccountData(
      {this.encodedId,
      this.age,
      this.ambassador,
      this.autoStrideEnabled,
      this.avatar,
      this.avatar150,
      this.avatar640,
      this.averageDailySteps,
      this.challegesBeta,
      this.clockDisplayFormat,
      this.corporate,
      this.corporateAdmin,
      this.dateOfBirth,
      this.displayName,
      this.displayNameSetting,
      this.firstName,
      this.foodsLocale,
      this.fullName,
      this.gender,
      this.glucoseUnit,
      this.height,
      this.heightUnit,
      this.isBugReportEnabled,
      this.isChild,
      this.isCoach,
      this.languageLocale,
      this.lastName,
      this.legalTermsAcceptRequired,
      this.locale,
      this.memberSince,
      this.mfaEnabled,
      this.offsetFromUTCMillis,
      this.sdkDeveloper,
      this.sleepTracking,
      this.startDayOfWeek,
      this.strideLengthRunning,
      this.strideLengthRunningType,
      this.strideLengthWalking,
      this.strideLengthWalkingType,
      this.swimUnit,
      this.timezone,
      this.waterUnit,
      this.waterUnitName,
      this.weight,
      this.weightUnit,
      });

  /// Generates a [FitbitAccountData] obtained from a json.
  factory FitbitAccountData.fromJson({Map<String, dynamic> json}){
    return FitbitAccountData(
      encodedId: json['encodedId'],
      age: json['age'],
      ambassador: json['ambassador'],
      autoStrideEnabled: json['autoStrideEnabled'],
      averageDailySteps: json['averageDailySteps'],
      avatar: json['avatar'],
      avatar150: json['avatar150'],
      avatar640: json['avatar640'],
      challegesBeta: json['challegesBeta'],
      clockDisplayFormat: json['clockDisplayFormat'],
      corporate: json['corporate'],
      dateOfBirth: Formats.onlyDayDateFormatTicks.parse(json['dateOfBirth']),
      displayName: json['displayName'],
      displayNameSetting: json['displayNameSetting'],
      firstName: json['firstName'],
      foodsLocale: json['foodsLocale'],
      fullName: json['fullName'],
      gender: json['gender'],
      glucoseUnit: json['glucoseUnit'],
      height: json['height'],
      heightUnit: json['heightUnit'],
      isBugReportEnabled: json['isBugReportEnabled'],
      isChild: json['isChild'],
      isCoach: json['isCoach'],
      languageLocale: json['languageLocale'],
      lastName: json['lastName'],
      legalTermsAcceptRequired: json['legalTermsAcceptRequired'],
      locale: json['locale'],
      memberSince: Formats.onlyDayDateFormatTicks.parse(json['memberSince']),
      mfaEnabled: json['mfaEnabled'],
      offsetFromUTCMillis: json['offsetFromUTCMillis'],
      sdkDeveloper: json['sdkDeveloper'],
      sleepTracking: json['sleepTracking'],
      startDayOfWeek: json['startDayOfWeek'],
      strideLengthRunning: json['strideLengthRunning'],
      strideLengthRunningType: json['strideLengthRunningType'],
      strideLengthWalking: json['strideLengthWalking'],
      strideLengthWalkingType: json['strideLengthWalkingType'],
      swimUnit: json['swimUnit'],
      timezone: json['timezone'],
      waterUnit: json['waterUnit'],
      waterUnitName: json['waterUnitName'],
      weight: json['weight'],
      weightUnit: json['weightUnit'],
    );
  }// fromJson

  @override
  String toString() {
    return (StringBuffer('FitbitAccountData(')
          ..write('encodedId: $encodedId, ')
          ..write('age: $age, ')
          ..write('ambassador: $ambassador, ')
          ..write('autoStrideEnabled: $autoStrideEnabled, ')
          ..write('avatar: $avatar, ')
          ..write('avatar150: $avatar150, ')
          ..write('avatar640: $avatar640, ')
          ..write('averageDailySteps: $averageDailySteps, ')
          ..write('challegesBeta: $challegesBeta, ')
          ..write('clockDisplayFormat: $clockDisplayFormat, ')
          ..write('corporate: $corporate, ')
          ..write('corporateAdmin: $corporateAdmin, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('displayName: $displayName, ')
          ..write('displayNameSetting: $displayNameSetting, ')
          ..write('firstName: $firstName, ')
          ..write('foodsLocale: $foodsLocale, ')
          ..write('fullName: $fullName, ')
          ..write('gender: $gender, ')
          ..write('glucoseUnit: $glucoseUnit, ')
          ..write('height: $height, ')
          ..write('heightUnit: $heightUnit, ')
          ..write('isBugReportEnabled: $isBugReportEnabled, ')
          ..write('isChild: $isChild, ')
          ..write('isCoach: $isCoach, ')
          ..write('languageLocale: $languageLocale, ')
          ..write('lastName: $lastName, ')
          ..write('legalTermsAcceptRequired: $legalTermsAcceptRequired, ')
          ..write('locale: $locale, ')

          ..write('memberSince: $memberSince, ')
          ..write('mfaEnabled: $mfaEnabled, ')
          ..write('offsetFromUTCMillis: $offsetFromUTCMillis, ')
          ..write('sdkDeveloper: $sdkDeveloper, ')
          ..write('sleepTracking: $sleepTracking, ')
          ..write('startDayOfWeek: $startDayOfWeek, ')
          ..write('strideLengthRunning: $strideLengthRunning, ')
          ..write('strideLengthRunningType: $strideLengthRunningType, ')
          ..write('strideLengthWalking: $strideLengthWalking, ')
          ..write('strideLengthWalkingType: $strideLengthWalkingType, ')
          ..write('swimUnit: $swimUnit, ')
          ..write('timezone: $timezone, ')
          ..write('waterUnit: $waterUnit, ')
          ..write('waterUnitName: $waterUnitName, ')
          ..write('weight: $weight, ')
          ..write('weightUnit: $weightUnit, ')
          ..write(')'))
        .toString();
  }// toString
  
  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'encodedId': encodedId,
      'age': age,
      'ambassador': ambassador,
      'autoStrideEnabled': autoStrideEnabled,
      'averageDailySteps': averageDailySteps,
      'avatar': avatar,
      'avatar150': avatar150,
      'avatar640': avatar640,
      'challegesBeta': challegesBeta,
      'dateOfBirth': Formats.onlyDayDateFormatTicks.format(dateOfBirth),
      'displayName': displayName,
      'displayNameSetting': displayNameSetting,
      'firstName': firstName,
      'foodsLocale': foodsLocale,
      'fullName': fullName,
      'gender': gender,
      'glucoseUnit': glucoseUnit,
      'height': height,
      'heightUnit': heightUnit,
      'isBugReportEnabled': isBugReportEnabled,
      'isChild': isChild,
      'isCoach': isCoach,
      'languageLocale': languageLocale,
      'lastName': lastName,
      'legalTermsAcceptRequired': legalTermsAcceptRequired,
      'locale': locale,
      'memberSince': Formats.onlyDayDateFormatTicks.format(memberSince),
      'mfaEnabled': mfaEnabled,
      'offsetFromUTCMillis': offsetFromUTCMillis,
      'sdkDeveloper': sdkDeveloper,
      'sleepTracking': sleepTracking,
      'startDayOfWeek': startDayOfWeek,
      'strideLengthRunning': strideLengthRunning,
      'strideLengthRunningType': strideLengthRunningType,
      'strideLengthWalking': strideLengthWalking,
      'strideLengthWalkingType': strideLengthWalkingType,
      'swimUnit': swimUnit,
      'waterUnit': waterUnit,
      'waterUnitName': waterUnitName,
      'weight': weight,
      'weightUnit': weightUnit,
    };
  }// toJson


}// FitbitAccountData
