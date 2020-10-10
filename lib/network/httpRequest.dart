import 'package:chopper/chopper.dart';
import 'package:choppersample/utils/enums.dart';

abstract class SendHttpRequest {

  Future<Response> sendHttpRequest(HttpRQ httpRQ);
  // sendRequest(ApiRequest pApiRequest) {
  //   if (pApiRequest is SportsReq && client is SportsApiService)
  //     return (client as SportsApiService).getSportsList();
  //
  //   if (pApiRequest is LeagueReq && client is LeagueApiService) {
  //
  //     if (pApiRequest.reqType == LeagueRequestType.GetLeagues)
  //       return (client as LeagueApiService).getLeaguesByCountry(pApiRequest.c);
  //
  //     if (pApiRequest.reqType == LeagueRequestType.SearchLeague)
  //       return (client as LeagueApiService)
  //           .searchLeague(pApiRequest.s, pApiRequest.c);
  //   }
  // }
}

abstract class HttpRQ {
  final RequestType _requestType;
RequestType get requestType => _requestType;
  HttpRQ(this._requestType);

}

class SportsRQ extends HttpRQ
{
  SportsRQ(RequestType requestType) : super(requestType);

}

class LeagueReq extends HttpRQ{
  final String s;
  final String c;
  final RequestType reqType;
  LeagueReq({this.s, this.c,this.reqType}) : super(reqType);
}
