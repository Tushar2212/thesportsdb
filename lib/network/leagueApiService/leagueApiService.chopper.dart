// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leagueApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$LeagueApiService extends LeagueApiService {
  _$LeagueApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = LeagueApiService;

  @override
  Future<Response<LeagueResponseModel>> getLeaguesByCountry(String c) {
    final $url = '/search_all_leagues.php';
    final $params = <String, dynamic>{'c': c};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<LeagueResponseModel, LeagueResponseModel>($request);
  }

  @override
  Future<Response<LeagueResponseModel>> searchLeague(String s, String c) {
    final $url = '/search_all_leagues.php';
    final $params = <String, dynamic>{'s': s, 'c': c};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<LeagueResponseModel, LeagueResponseModel>($request);
  }


}
