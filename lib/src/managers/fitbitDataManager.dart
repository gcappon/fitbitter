import '../data/fitbitData.dart';

abstract class FitbitDataManager{

  final String clientID;
  final String clientSecret;

  FitbitDataManager({this.clientID, this.clientSecret});

  Future<FitbitData> fetch(String userID);
  
}// FitbitDataManager