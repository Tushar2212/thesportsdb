import 'package:chopper/chopper.dart';
import 'package:choppersample/network/httpRequest.dart';
import 'package:choppersample/network/sportsApiService/sportsApiService.dart';
import 'package:choppersample/utils/enums.dart';

class SportsHttpRequest extends SendHttpRequest {

  final SportsApiService _chopperSportsClient = SportsApiService.create();


  @override
  Future<Response> sendHttpRequest(HttpRQ httpRQ) async {

    switch(httpRQ.requestType)
    {
      case RequestType.GetSportsList :return await _chopperSportsClient.getSportsList();
      break;
      default: return null;
    }

  }

}

abstract class HttpCustomClient {
}