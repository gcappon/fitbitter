/// [FitbitAPIURL] is the abstract class implementing the data model
/// of a url of Fitbit APIs.
abstract class FitbitAPIURL {
  /// The string representation of the url.
  String? url;

  /// The id of the user requesting for the data.
  String? userID;

  /// Default [FitbitAPIURL] constructor.
  FitbitAPIURL({this.url, this.userID});
} // FitbitAPIURL
