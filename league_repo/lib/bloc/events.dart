abstract class LeagueEvents {}

class LoadCountryLeagues extends LeagueEvents {
  final String country;

  LoadCountryLeagues(this.country);
}

class LeagueSearch extends LeagueEvents {
  final String country;
  final String text;

  LeagueSearch(this.country, {this.text});
}
