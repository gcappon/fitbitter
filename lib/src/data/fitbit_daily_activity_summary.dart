import 'dart:convert';
import 'package:fitbitter/fitbitter.dart';
import 'package:fitbitter/src/utils/formats.dart';

import '../utils/bool_util.dart';
import '../utils/date_time_util.dart';
import '../utils/double_util.dart';
import '../utils/int_util.dart';
import '../utils/string_util.dart';

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class FitbitFullActivity {
  static final attributeCalories = 'calories';
  static final attributeDescription = 'description';
  static final attributeDetailsLink = 'detailsLink';
  static final attributeDistance = 'distance';
  static final attributeDuration = 'duration';
  static final attributeHasActiveZoneMinutes = 'hasActiveZoneMinutes';
  static final attributeHasStartTime = 'hasStartTime';
  static final attributeIsFavorite = 'isFavorite';
  static final attributeLastModified = 'lastModified';
  static final attributeLogId = 'logId';
  static final attributeName = 'name';
  static final attributeStartDate = 'startDate';
  static final attributeStartTime = 'startTime';
  static final attributeSteps = 'steps';

  int calories = 0;
  String description = '';
  String detailsLink = '';
  double distance = 0;
  int durationMs = 0;
  bool hasActiveZoneMinutes = false;
  bool hasStartTime = false;
  bool isFavorite = false;
  DateTime lastModified = DateTime.now();
  String logId = '';
  String name = '';
  DateTime start = DateTime.now();
  int steps = 0;

  FitbitFullActivity();

  factory FitbitFullActivity.fromJson({required Map<String, dynamic> aJson}) {
    final anActivity = FitbitFullActivity();
    anActivity
      ..calories = IntUtil.nullCheck(aJson[attributeCalories], 0)
      ..description =
          StringUtil.nullCheck(aJson[attributeDistance].toString(), '')
      ..detailsLink =
          StringUtil.nullCheck(aJson[attributeDetailsLink].toString(), '')
      ..distance = DoubleUtil.nullCheck(aJson[attributeDistance], 0.0)
      ..durationMs = IntUtil.nullCheck(aJson[attributeDuration], 0)
      ..hasActiveZoneMinutes =
          BoolUtil.nullCheck(aJson[attributeHasActiveZoneMinutes], false)
      ..hasStartTime = BoolUtil.nullCheck(aJson[attributeHasStartTime], false)
      ..isFavorite = BoolUtil.nullCheck(aJson[attributeIsFavorite], false)
      ..lastModified = DateTimeUtil.nullCheck(
          DateTime.parse(aJson[attributeLastModified]), DateTime.now())
      ..logId = StringUtil.nullCheck(aJson[attributeLogId].toString(), '')
      ..name = StringUtil.nullCheck(aJson[attributeName].toString(), '')
      ..start = DateTimeUtil.join(
          Formats.onlyDayDateFormatTicks.parse(aJson[attributeStartDate]),
          Formats.onlyTimeNoSeconds.parse(aJson[attributeStartTime]))
      ..steps = IntUtil.nullCheck(aJson[attributeSteps], 0);
    return anActivity;
  }
}

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class FitbitActivityLog {
  static final attributeActivityId = 'activityId';
  static final attributeActivityParentId = 'activityParentId';
  static final attributeActivityParentName = 'activityParentName';

  String activityId = '';
  String activityParentId = '';
  String activityParentName = '';

  FitbitActivityLog();

  factory FitbitActivityLog.fromJson({required Map<String, dynamic> aJson}) {
    final aLog = FitbitActivityLog();
    aLog
      ..activityId = aJson[attributeActivityId].toString()
      ..activityParentId = aJson[attributeActivityParentId].toString()
      ..activityParentName = aJson[attributeActivityParentName].toString();
    return aLog;
  }
}

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class FitbitGoal {
  static final attributeActiveMinutes = 'activeMinutes';
  static final attributeCaloriesOut = 'caloriesOut';
  static final attributeDistance = 'distance';
  static final attributeFloors = 'floors';
  static final attributeSteps = 'steps';

  int activeMinutes = 0;
  int caloriesOut = 0;
  double distance = 0;
  int floors = 0;
  int steps = 0;

  FitbitGoal();

  factory FitbitGoal.fromJson({required Map<String, dynamic> aJson}) {
    final aGoal = FitbitGoal();
    aGoal
      ..activeMinutes = IntUtil.nullCheck(aJson[attributeActiveMinutes], 0)
      ..caloriesOut = IntUtil.nullCheck(aJson[attributeCaloriesOut], 0)
      ..distance = DoubleUtil.nullCheck(aJson[attributeDistance], 0.0)
      ..floors = IntUtil.nullCheck(aJson[attributeFloors], 0)
      ..steps = IntUtil.nullCheck(aJson[attributeSteps], 0);
    return aGoal;
  }
}

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class FitbitDistance {
  static final attributeActivity = 'activity';
  static final attributedistance = 'distance';

  String activity = '';
  double distance = 0.0;

  FitbitDistance();

  factory FitbitDistance.fromJson({required Map<String, dynamic> aJson}) {
    final aDistance = FitbitDistance();
    aDistance.activity = aJson[attributeActivity].toString();
    aDistance.distance = DoubleUtil.nullCheck(aJson[attributedistance], 0.0);
    return aDistance;
  }
}

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class FitbitHeartRateZone {
  static final attributeCaloriesOut = 'caloriesOut';
  static final attributeMax = 'max';
  static final attributeMin = 'min';
  static final attributeMinutes = 'minutes';
  static final attributeName = 'name';

  int caloriesOut = 0;
  int max = 0;
  int min = 0;
  int minutes = 0;
  String name = '';

  FitbitHeartRateZone();

  factory FitbitHeartRateZone.fromJson({required Map<String, dynamic> aJson}) {
    final aZone = FitbitHeartRateZone();
    aZone
      ..caloriesOut = IntUtil.nullCheck(aJson[attributeCaloriesOut], 0)
      ..max = IntUtil.nullCheck(aJson[attributeMax], 0)
      ..min = IntUtil.nullCheck(aJson[attributeMin], 0)
      ..minutes = IntUtil.nullCheck(aJson[attributeMinutes], 0)
      ..name = aJson[attributeName];
    return aZone;
  }
}

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class FitbitDaySummary {
  static final attributeActiveScore = 'activeScore';
  static final attributeActivityCalories = 'activityCalories';
  static final attributeCaloriesEstimationMu = 'caloriesEstimationMu';
  static final attributeCaloriesBMR = 'caloriesBMR';
  static final attributeCaloriesOut = 'caloriesOut';
  static final attributeCaloriesOutUnestimated = 'caloriesOutUnestimated';
  static final attributeDistances = 'distances';
  static final attributeElevation = 'elevation';
  static final attributeFairlyActiveMinutes = 'fairlyActiveMinutes';
  static final attributeFloors = 'floors';
  static final attributeHeartRateZones = 'heartRateZones';
  static final attributeLightlyActiveMinutes = 'lightlyActiveMinutes';
  static final attributeMarginalCalories = 'marginalCalories';
  static final attributeRestingHeartRate = 'restingHeartRate';
  static final attributeSteps = 'steps';
  static final attributeUseEstimation = 'useEstimation';
  static final attributeVeryActiveMinutes = 'veryActiveMinutes';

  int activeScore = 0;
  int activityCalories = 0;
  int caloriesEstimationMu = 0;
  int caloriesBMR = 0;
  int caloriesOut = 0;
  int caloriesOutUnestimated = 0;
  List<FitbitDistance> distances = [];
  double elevation = 0.0;
  int fairlyActiveMinutes = 0;
  int floors = 0;
  List<FitbitHeartRateZone> heartRateZones = [];
  int lightlyActiveMinutes = 0;
  int marginalCalories = 0;
  int restingHeartRate = 0;
  int steps = 0;
  bool useEstimation = false;
  int veryActiveMinutes = 0;

  FitbitDaySummary();

  factory FitbitDaySummary.fromJson({required Map<String, dynamic> aJson}) {
    final aSummary = FitbitDaySummary();
    aSummary
      ..activeScore = IntUtil.nullCheck(aJson[attributeActiveScore], 0)
      ..activityCalories =
          IntUtil.nullCheck(aJson[attributeActivityCalories], 0)
      ..caloriesEstimationMu =
          IntUtil.nullCheck(aJson[attributeCaloriesEstimationMu], 0)
      ..elevation = DoubleUtil.nullCheck(aJson[attributeElevation], 0.0)
      ..fairlyActiveMinutes =
          IntUtil.nullCheck(aJson[attributeFairlyActiveMinutes], 0)
      ..floors = IntUtil.nullCheck(aJson[attributeFloors], 0)
      ..lightlyActiveMinutes =
          IntUtil.nullCheck(aJson[attributeLightlyActiveMinutes], 0)
      ..marginalCalories =
          IntUtil.nullCheck(aJson[attributeMarginalCalories], 0)
      ..restingHeartRate =
          IntUtil.nullCheck(aJson[attributeRestingHeartRate], 0)
      ..steps = IntUtil.nullCheck(aJson[attributeSteps], 0)
      ..useEstimation = BoolUtil.nullCheck(aJson[attributeUseEstimation], false)
      ..veryActiveMinutes =
          IntUtil.nullCheck(aJson[attributeVeryActiveMinutes], 0);
    // distances
    final aDistancesData = aJson[attributeDistances];
    List<FitbitDistance> aDistances = [];
    for (int i = 0; i < aDistancesData.length; i++) {
      aDistances.add(FitbitDistance.fromJson(aJson: aDistancesData[i]));
    }
    aSummary.distances = aDistances;
    //heart rate zones
    final aHrzdata = aJson[attributeHeartRateZones];
    List<FitbitHeartRateZone> aZones = [];
    for (int i = 0; i < aHrzdata.length; i++) {
      aZones.add(FitbitHeartRateZone.fromJson(aJson: aHrzdata[i]));
    }
    aSummary.heartRateZones = aZones;
    return aSummary;
  }
}

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class FitbitDailyActivitySummary implements FitbitData {
  static final attributeActivityLog = 'activityLog';
  static final attributeActivities = 'activities';
  static final attributeGoals = 'goals';
  static final attributeSummary = 'summary';

  FitbitActivityLog activityLog = FitbitActivityLog();
  List<FitbitFullActivity> activities = [];
  FitbitGoal goals = FitbitGoal();
  FitbitDaySummary summary = FitbitDaySummary();

  FitbitDailyActivitySummary();

  @override
  toJson<T extends FitbitData>() {
    Map<String, dynamic> aMap = Map();
    return jsonEncode(aMap);
  }

  factory FitbitDailyActivitySummary.fromJson(
      {required Map<String, dynamic> aJson}) {
    final aSummary = FitbitDailyActivitySummary();
    // log
    if (aJson[attributeActivityLog] != null) {
      aSummary.activityLog =
          FitbitActivityLog.fromJson(aJson: aJson[attributeActivityLog]);
    }
    // activities
    if (aJson[attributeActivities] != null) {
      final anActivitiesData = aJson[attributeActivities];
      List<FitbitFullActivity> anActivities = [];
      for (int i = 0; i < anActivitiesData.length; i++) {
        anActivities
            .add(FitbitFullActivity.fromJson(aJson: anActivitiesData[i]));
      }
      aSummary.activities = anActivities;
    }
    // goals
    if (aJson[attributeGoals] != null) {
      final aGoalsData = aJson[attributeGoals];
      aSummary.goals = FitbitGoal.fromJson(aJson: aGoalsData);
    }
    // summary stats
    if (aJson[attributeSummary] != null) {
      aSummary.summary =
          FitbitDaySummary.fromJson(aJson: aJson[attributeSummary]);
    }
    return aSummary;
  }

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

}
