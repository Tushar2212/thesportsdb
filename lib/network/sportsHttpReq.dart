import 'package:chopper/chopper.dart';
import 'package:choppersample/network/httpRequest.dart';
import 'package:choppersample/network/leagueApiService/leagueApiService.dart';
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


class LeagueHttpRequest extends SendHttpRequest {

  final LeagueApiService _chopperLeagueClient = LeagueApiService.create();


  @override
  Future<Response> sendHttpRequest(HttpRQ httpRQ) async {
    LeagueReq leagueReq = httpRQ;
    switch(httpRQ.requestType)
    {
      case RequestType.GetLeagues :     return await _chopperLeagueClient.getLeaguesByCountry(leagueReq.c);
      break;
      case RequestType.SearchLeague :     return await _chopperLeagueClient.searchLeague(leagueReq.s, leagueReq.c);
      break;
      default: return null;
    }
  }

}

abstract class HttpCustomClient {
}