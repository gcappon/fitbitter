import 'package:fitbitter/src/fitbitConnector.dart';
import 'package:fitbitter/src/urls/fitbitAPIURL.dart';

import 'package:fitbitter/src/utils/formats.dart';

import 'package:fitbitter/src/data/fitbitActivityTimeseriesData.dart';

/// [FitbitActivityTimeseriesAPIURL] is a class that expresses multiple factory
/// constructors to be used to generate Fitbit Web APIs urls to fetch
/// [FitbitActivityTimeseriesData].
class FitbitActivityTimeseriesAPIURL extends FitbitAPIURL {
  /// The type of the activity timeseries.
  final String resourceString;

  /// Default [FitbitActivityTimeseriesAPIURL] constructor.
  FitbitActivityTimeseriesAPIURL(
      {required FitbitCredentials? fitbitCredentials,
      required String url,
      required this.resourceString})
      : super(fitbitCredentials: fitbitCredentials, url: url);

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a given [resource] of a
  /// specific day [date].
  factory FitbitActivityTimeseriesAPIURL.dayWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime date,
      required Resource resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(date);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/${resourceToString[resource]}/date/$dateStr/1d.json',
      resourceString: resourceToString[resource]!,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.day

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific date range
  /// between [startDate] and [endDate].
  factory FitbitActivityTimeseriesAPIURL.dateRangeWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime startDate,
      required DateTime endDate,
      required Resource resource}) {
    String startDateStr = Formats.onlyDayDateFormatTicks.format(startDate);
    String endDateStr = Formats.onlyDayDateFormatTicks.format(endDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/${resourceToString[resource]}/date/$startDateStr/$endDateStr.json',
      resourceString: resourceToString[resource]!,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.dateRange

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific week
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.weekWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate,
      required Resource resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/${resourceToString[resource]}/date/$dateStr/1w.json',
      resourceString: resourceToString[resource]!,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.week

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific month
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.monthWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate,
      required Resource resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/${resourceToString[resource]}/date/$dateStr/1m.json',
      resourceString: resourceToString[resource]!,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.month

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific 3 months range
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.threeMonthsWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate,
      required Resource resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/${resourceToString[resource]}/date/$dateStr/3m.json',
      resourceString: resourceToString[resource]!,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.threeMonths

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific 6 months range
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.sixMonthsWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate,
      required Resource resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/${resourceToString[resource]}/date/$dateStr/6m.json',
      resourceString: resourceToString[resource]!,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.sixMonths

  /// Generates a [FitbitActivityTimeseriesAPIURL] to get [FitbitActivityTimeseriesData] of a specific year
  /// ending in [baseDate].
  factory FitbitActivityTimeseriesAPIURL.yearWithResource(
      {required FitbitCredentials fitbitCredentials,
      required DateTime baseDate,
      required Resource resource}) {
    String dateStr = Formats.onlyDayDateFormatTicks.format(baseDate);
    return FitbitActivityTimeseriesAPIURL(
      url:
          '${_getBaseURL(fitbitCredentials.userID)}/${resourceToString[resource]}/date/$dateStr/1y.json',
      resourceString: resourceToString[resource]!,
      fitbitCredentials: fitbitCredentials,
    );
  } // FitbitActivityTimeseriesAPIURL.yearMonths

  /// A private method that generates the base url of a [FitbitActivityTimeseriesAPIURL].
  static String _getBaseURL(String? userID) {
    return 'https://api.fitbit.com/1/user/$userID/activities';
  } // _getBaseURL

} // FitbitActivityTimeseriesAPIURL

/// enumeration for the resource options that you can specify in the [FitbitActivityTimeseriesAPIURL]
enum Resource {
  /// The number of calories burned during the day for periods of time when the user was active above sedentary level. This value is calculated minute by minute for minutes that fall within this criteria. This includes activity burned calories and BMR.
  activityCalories,

  /// The top level time series for calories burned inclusive of BMR, tracked activity, and manually logged activities.
  calories,

  /// Value includes only BMR calories.
  caloriesBMR,
  distance,
  elevation,
  floors,
  minutesSedentary,
  minutesLightlyActive,
  minutesFairlyActive,
  minutesVeryActive,
  steps,
}

/// Map that converts each element of [Resource] to the corresponding [String] to specify resource in [FitbitActivityTimeseriesAPIURL]
Map<Resource, String> resourceToString = {
  Resource.activityCalories: 'activityCalories',
  Resource.calories: 'calories',
  Resource.caloriesBMR: 'caloriesBMR',
  Resource.distance: 'distance',
  Resource.elevation: 'elevation',
  Resource.floors: 'floors',
  Resource.minutesSedentary: 'minutesSedentary',
  Resource.minutesLightlyActive: 'minutesLightlyActive',
  Resource.minutesFairlyActive: 'minutesFairlyActive',
  Resource.minutesVeryActive: 'minutesVeryActive',
  Resource.steps: 'steps',
};
