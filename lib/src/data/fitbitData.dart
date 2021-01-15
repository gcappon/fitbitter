/// [FitbitData] is the abstract class implementing the data model
/// of Fitbit generated data.
abstract class FitbitData {
  /// Returns the status of a [FitbitData]
  String toString();

  /// Converts the [value] to a json.
  dynamic toJson<T extends FitbitData>();
} // FitbitData
