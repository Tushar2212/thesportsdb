import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:league_repo/models/league_res_model.dart';

class LeagueHttpClient {
  final http.Client client;
  final String baseUrl;

  //URL is mandatory
  LeagueHttpClient(this.baseUrl, {http.Client client})
      : this.client = client ?? http.Client();

  Future<LeagueResponseModel> searchLeagues(String country, String text) async {
    print("$baseUrl/search_all_leagues.php?c=$country&s=$text");

    final res = text != null
        ? await client.get("$baseUrl/search_all_leagues.php?c=$country&s=$text")
        : await client.get("$baseUrl/search_all_leagues.php?c=$country");

    final jsonData = json.decode(res.body);

    print(jsonData);
    if (res.statusCode == 200) {
      return LeagueResponseModel.fromJson(jsonData);
    } else {
      throw Exception("Error in League API Service");
    }
  }
}
