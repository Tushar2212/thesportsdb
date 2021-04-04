import 'package:league_repo/models/league_res_model.dart';

abstract class LeagueStates {}

class LeagueInit extends LeagueStates {}

class LeagueSearchLoading extends LeagueStates {}

class LeagueSearchFail extends LeagueStates {}

class LeaguesForCountryLoaded extends LeagueStates {

  final List<League> leagues;

  LeaguesForCountryLoaded(this.leagues);

}

class LeagueSearchDone extends LeagueStates {

  final List<League> leagues;

  LeagueSearchDone(this.leagues);

}
