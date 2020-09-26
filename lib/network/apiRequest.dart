import 'package:choppersample/network/leagueApiService/leagueApiService.dart';
import 'package:choppersample/network/networkClient.dart';
import 'package:choppersample/network/sportsApiService/sportsApiService.dart';
import 'package:choppersample/utils/enums.dart';

class ApiRequest {
  final NetworkClient client;

  ApiRequest(this.client);

  sendRequest(ApiRequest pApiRequest) {
    if (pApiRequest is SportsReq && client is SportsApiService)
      return (client as SportsApiService).getSportsList();

    if (pApiRequest is LeagueReq && client is LeagueApiService) {

      if (pApiRequest.reqType == LeagueRequestType.GetLeagues)
        return (client as LeagueApiService).getLeaguesByCountry(pApiRequest.c);

      if (pApiRequest.reqType == LeagueRequestType.SearchLeague)
        return (client as LeagueApiService)
            .searchLeague(pApiRequest.s, pApiRequest.c);
    }
  }
}
