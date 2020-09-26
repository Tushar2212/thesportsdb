
import 'package:chopper/chopper.dart';
import 'package:choppersample/model/sport_list_model.dart';
import 'package:choppersample/network/apiRequest.dart';
import 'package:choppersample/network/networkClient.dart';
import 'package:choppersample/network/serializer/JsonTypeConvertor.dart';
import 'package:choppersample/utils/Constants.dart';

part 'sportsApiService.chopper.dart';

class SportsReq extends ApiRequest
{
  SportsReq() : super(null);
}


@ChopperApi(baseUrl: "/all_sports.php")
abstract class SportsApiService extends ChopperService implements NetworkClient {

  @Get()
  Future<Response<SportListModel>> getSportsList();



  static SportsApiService create() {
    final client = ChopperClient(
        baseUrl: baseUrl,
        services: [_$SportsApiService()],
        interceptors: [
              (Request request) async {
            if (request.method == HttpMethod.Get) {
              chopperLogger.info('Sports Request Sent');
              chopperLogger.info(request.url);
              chopperLogger.info(request.body);
            }
            return request;
          },
              (Response response) async {
            if (response.statusCode == 200) {
              chopperLogger.info('Sports Response Received');
              chopperLogger.info(response.body);
            }
            return response;
          }
        ],
        converter: JsonToTypeConverter({
          SportListModel : (json) =>SportListModel.fromJson(json)
        })
    );
    return _$SportsApiService(client);
  }
}
