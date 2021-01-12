import 'package:dio/dio.dart';

import '../errors/fitbitRateLimitExceededError.dart';
import '../errors/fitbitUnauthorizedError.dart';
import '../errors/fitbitNotFoundError.dart';
import '../errors/fitbitBadRequestError.dart';
import '../errors/fitbitForbiddenError.dart';

import '../data/fitbitData.dart';

abstract class FitbitDataManager{

  final String clientID;
  final String clientSecret;

  FitbitDataManager({this.clientID, this.clientSecret});

  Future<FitbitData> fetch(String userID);
  
  static void manageError(DioError e){

    switch (e.response.statusCode) {
        case 200:
          break;
        case 400:
          throw FitbitBadRequestError(message: e.response.data['errors'][0]['message']);
          break;
        case 401:
          throw FitbitUnauthorizedError(message: e.response.data['errors'][0]['message']);
          break;
        case 403:
          throw FitbitForbiddenError(message: e.response.data['errors'][0]['message']);
          break;
        case 404:
          throw FitbitNotFoundError(message: e.response.data['errors'][0]['message']);
          break;
        case 429:
        throw FitbitRateLimitExceededError(message: e.response.data['errors'][0]['message']);
          break;
      }// switch

  }// manageError


}// FitbitDataManager