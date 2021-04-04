// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sportsApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$SportsApiService extends SportsApiService {
  _$SportsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = SportsApiService;

  Future<Response<SportListModel>> getSportsList() {
    final $url = '/all_sports.php';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SportListModel, SportListModel>($request);
  }
}
