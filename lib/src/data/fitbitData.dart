abstract class FitbitData{

  /// Returns the status of a [FitbitData]
  String toString();

  /// Converts the [value] to something that can be passed to
  /// [JsonCodec.encode].
  dynamic toJson<T extends FitbitData>();

}// FitbitData