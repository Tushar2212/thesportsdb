// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sportsApiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$SportsApiService extends SportsApiService {
  _$SportsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SportsApiService;

  @override
  Future<Response<SportListModel>> getSportsList() {
    final $url = '/all_sports.php';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SportListModel, SportListModel>($request);
  }
}
