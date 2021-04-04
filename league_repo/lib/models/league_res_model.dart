import 'package:json_annotation/json_annotation.dart';

part 'league_res_model.g.dart';

@JsonSerializable()
class LeagueResponseModel{
  List<League> countrys;

  LeagueResponseModel();

  factory LeagueResponseModel.fromJson(Map<String, dynamic> json) => _$LeagueResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueResponseModelToJson(this);
}


@JsonSerializable()
class League
{
  String idLeague;
  String idSoccerXML;
  String idAPIfootball;
  String strSport;
  String strLeague;
  String strLeagueAlternate;
  String strDivision;
  String idCup;
  String strCurrentSeason;
  String intFormedYear;
  String dateFirstEvent;
  String strGender;
  String strCountry;
  String strWebsite;
  String strFacebook;
  String strTwitter;
  String strYoutube;
  String strRSS;
  String strDescriptionEN;
  String strDescriptionDE;
  String strDescriptionFR;
  String strDescriptionIT;
  String strDescriptionCN;
  String strDescriptionJP;
  String strDescriptionRU;
  String strDescriptionES;
  String strDescriptionPT;
  String strDescriptionSE;
  String strDescriptionNL;
  String strDescriptionHU;
  String strDescriptionNO;
  String strDescriptionPL;
  String strDescriptionIL;
  String strFanart1;
  String strFanart2;
  String strFanart3;
  String strFanart4;
  String strBanner;
  String strBadge;
  String strLogo;
  String strPoster;
  String strTrophy;
  String strNaming;
  String strComplete;
  String strLocked;

  League();

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}