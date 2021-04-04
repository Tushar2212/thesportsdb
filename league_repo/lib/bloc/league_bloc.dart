import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:league_repo/bloc/events.dart';
import 'package:league_repo/bloc/states.dart';
import 'package:league_repo/models/league_res_model.dart';
import 'package:league_repo/network/leagueHttpClient.dart';

class LeagueBloc extends Bloc<LeagueEvents, LeagueStates> {
  final LeagueHttpClient _httpClient;

  LeagueBloc(this._httpClient) : super(LeagueInit());

  @override
  Stream<LeagueStates> mapEventToState(LeagueEvents event) async* {
    yield LeagueSearchLoading();

    if (event is LoadCountryLeagues) {
      try {
        final LeagueResponseModel leagueData =
            await _httpClient.searchLeagues(event.country, null);
        if (leagueData == null) yield LeagueSearchFail();

        if (leagueData.countrys == null || leagueData.countrys.isEmpty)
          yield LeagueSearchLoading();
        else
          yield LeaguesForCountryLoaded(leagueData.countrys);
      } catch (error) {
        yield LeagueSearchFail();
      }
    }
    if (event is LeagueSearch) {
      try {
        final LeagueResponseModel leagueData =
            await _httpClient.searchLeagues(event.country, event.text);
        if (leagueData == null) yield LeagueSearchFail();

        if (leagueData.countrys == null || leagueData.countrys.isEmpty)
          yield LeagueSearchLoading();
        else
          yield LeagueSearchDone(leagueData.countrys);
      } catch (error) {
        yield LeagueSearchFail();
      }
    }
  }
}
