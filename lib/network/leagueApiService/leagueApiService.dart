
import 'package:chopper/chopper.dart';
import 'package:choppersample/model/league_res_model.dart';
import 'package:choppersample/network/apiRequest.dart';
import 'package:choppersample/network/networkClient.dart';
import 'package:choppersample/network/serializer/JsonTypeConvertor.dart';
import 'package:choppersample/utils/Constants.dart';
import 'package:choppersample/utils/enums.dart';

part 'leagueApiService.chopper.dart';


class LeagueReq extends ApiRequest{
  final String s;
  final String c;
  final LeagueRequestType reqType;
  LeagueReq({this.s, this.c,this.reqType}) : super(null);
}

@ChopperApi(baseUrl: "/search_all_leagues.php")
abstract class LeagueApiService extends ChopperService  implements NetworkClient{


  @Get()
  Future<Response<LeagueResponseModel>> getLeaguesByCountry(@Query('c') String c);

  @Get()
  Future<Response<LeagueResponseModel>> searchLeague(@Query('s') String s,@Query('c') String c);


  static LeagueApiService create() {
    final client = ChopperClient(
      baseUrl: baseUrl,
      services: [_$LeagueApiService()],
      interceptors: [
        (Request request) async {
          if (request.method == HttpMethod.Get) {
            chopperLogger.info('Request Sent');
            chopperLogger.info(request.baseUrl);
            chopperLogger.info(request.body);
          }
          return request;
        },
        (Response response) async {
          if (response.statusCode == 200) {
            chopperLogger.info('Response Received');
            chopperLogger.info(response.body);
          }
          return response;
        }
      ],
      converter: JsonToTypeConverter({
        LeagueResponseModel : (json) =>LeagueResponseModel.fromJson(json)
      })
    );
    return _$LeagueApiService(client);
  }
}
