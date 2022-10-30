import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitData.dart';

/// [FitbitAccountData] is a class implementing the data model of the
/// user account data.
class FitbitAccountData implements FitbitData {
  /// The Fitbit user id.
  String? userID;

  /// The user's age.
  int? age;

  /// A flag the tells if the user is an ambassador.
  bool? ambassador;

  /// A flag the tells if the stride is automatically computed.
  bool? autoStrideEnabled;

  /// The user's average daily steps.
  int? averageDailySteps;

  /// An url pointing to the user avatar image.
  String? avatar;

  /// An url pointing to the user avatar image (150px).
  String? avatar150;

  /// An url pointing to the user avatar image (640px).
  String? avatar640;

  /// A flag the tells if the user is using the challeges (beta) feature.
  bool? challegesBeta;

  /// The clock display format used by the user.
  String? clockDisplayFormat;

  /// A flag the tells if the user is a corporate user.
  bool? corporate;

  /// A flag the tells if the user is a corporate user admin.
  bool? corporateAdmin;

  /// The user birth date.
  DateTime? dateOfBirth;

  /// The user's name.
  String? displayName;

  /// The user's name settings.
  String? displayNameSetting;

  /// The user's feature exercise goal.
  bool? features;

  /// The user's first name.
  String? firstName;

  /// The user's food locale.
  String? foodsLocale;

  /// The user's full name.
  String? fullName;

  /// The user's gender.
  String? gender;

  /// The glucose unit used by the user.
  String? glucoseUnit;

  /// The user's height.
  double? height;

  /// The unit used by the user for the height.
  String? heightUnit;

  /// A flag the tells if the bug report is enabled.
  bool? isBugReportEnabled;

  /// A flag the tells if the user is a child.
  bool? isChild;

  /// A flag the tells if the stride is a coach.
  bool? isCoach;

  /// The user's language locale.
  String? languageLocale;

  /// The user's last name.
  String? lastName;

  /// A flag the tells if the legal terms acceptance is required.
  bool? legalTermsAcceptRequired;

  /// The user's locale.
  String? locale;

  /// The date when the user subscribed to Fitbit.
  DateTime? memberSince;

  /// A flag the tells if the mfa is enabled.
  bool? mfaEnabled;

  /// The user's offset from UTC.
  int? offsetFromUTCMillis;

  /// A flag the tells if the user is an sdk developer.
  bool? sdkDeveloper;

  /// The user's sleep tracking.
  String? sleepTracking;

  /// The user's start day of week.
  String? startDayOfWeek;

  /// The user's stride length while running.
  double? strideLengthRunning;

  /// The user's stride length while running type.
  String? strideLengthRunningType;

  /// The user's stride length while walking.
  double? strideLengthWalking;

  /// The user's stride length while walking type.
  String? strideLengthWalkingType;

  /// The unit used by the user while swimming.
  String? swimUnit;

  /// The user's timezone.
  String? timezone;

  /// The unit used by the user while swimming.
  String? waterUnit;

  /// The unit used by the user to log water.
  String? waterUnitName;

  /// The user's weight.
  double? weight;

  /// The unit used by the user for the weight.
  String? weightUnit;

  //TODO: map 'topBadges' field

  /// Default [FitbitAccountData] constructor.
  FitbitAccountData({
    this.userID,
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
    this.features,
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
  factory FitbitAccountData.fromJson({required Map<String, dynamic> json}) {
    return FitbitAccountData(
      userID: json['encodedId'],
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
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      displayName: json['displayName'],
      displayNameSetting: json['displayNameSetting'],
      features: json['features']['exerciseGoal'],
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
      memberSince: DateTime.parse(json['memberSince']),
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
  } // fromJson

  @override
  String toString() {
    return (StringBuffer('FitbitAccountData(')
          ..write('userID: $userID, ')
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
          ..write('features: $features, ')
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
  } // toString

  @override
  Map<String, dynamic> toJson<T extends FitbitData>() {
    return <String, dynamic>{
      'encodedId': userID,
      'age': age,
      'ambassador': ambassador,
      'autoStrideEnabled': autoStrideEnabled,
      'averageDailySteps': averageDailySteps,
      'avatar': avatar,
      'avatar150': avatar150,
      'avatar640': avatar640,
      'challegesBeta': challegesBeta,
      'dateOfBirth': dateOfBirth,
      'displayName': displayName,
      'displayNameSetting': displayNameSetting,
      'features': {'exerciseGoal': features},
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
      'memberSince': Formats.onlyDayDateFormatTicks.format(memberSince!),
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
  } // toJson

} // FitbitAccountData
