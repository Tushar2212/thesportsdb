// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeagueResponseModel _$LeagueResponseModelFromJson(Map<String, dynamic> json) {
  return LeagueResponseModel()
    ..countrys = (json['countrys'] as List)
        ?.map((e) =>
            e == null ? null : League.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$LeagueResponseModelToJson(
        LeagueResponseModel instance) =>
    <String, dynamic>{
      'countrys': instance.countrys,
    };

League _$LeagueFromJson(Map<String, dynamic> json) {
  return League()
    ..idLeague = json['idLeague'] as String
    ..idSoccerXML = json['idSoccerXML'] as String
    ..idAPIfootball = json['idAPIfootball'] as String
    ..strSport = json['strSport'] as String
    ..strLeague = json['strLeague'] as String
    ..strLeagueAlternate = json['strLeagueAlternate'] as String
    ..strDivision = json['strDivision'] as String
    ..idCup = json['idCup'] as String
    ..strCurrentSeason = json['strCurrentSeason'] as String
    ..intFormedYear = json['intFormedYear'] as String
    ..dateFirstEvent = json['dateFirstEvent'] as String
    ..strGender = json['strGender'] as String
    ..strCountry = json['strCountry'] as String
    ..strWebsite = json['strWebsite'] as String
    ..strFacebook = json['strFacebook'] as String
    ..strTwitter = json['strTwitter'] as String
    ..strYoutube = json['strYoutube'] as String
    ..strRSS = json['strRSS'] as String
    ..strDescriptionEN = json['strDescriptionEN'] as String
    ..strDescriptionDE = json['strDescriptionDE'] as String
    ..strDescriptionFR = json['strDescriptionFR'] as String
    ..strDescriptionIT = json['strDescriptionIT'] as String
    ..strDescriptionCN = json['strDescriptionCN'] as String
    ..strDescriptionJP = json['strDescriptionJP'] as String
    ..strDescriptionRU = json['strDescriptionRU'] as String
    ..strDescriptionES = json['strDescriptionES'] as String
    ..strDescriptionPT = json['strDescriptionPT'] as String
    ..strDescriptionSE = json['strDescriptionSE'] as String
    ..strDescriptionNL = json['strDescriptionNL'] as String
    ..strDescriptionHU = json['strDescriptionHU'] as String
    ..strDescriptionNO = json['strDescriptionNO'] as String
    ..strDescriptionPL = json['strDescriptionPL'] as String
    ..strDescriptionIL = json['strDescriptionIL'] as String
    ..strFanart1 = json['strFanart1'] as String
    ..strFanart2 = json['strFanart2'] as String
    ..strFanart3 = json['strFanart3'] as String
    ..strFanart4 = json['strFanart4'] as String
    ..strBanner = json['strBanner'] as String
    ..strBadge = json['strBadge'] as String
    ..strLogo = json['strLogo'] as String
    ..strPoster = json['strPoster'] as String
    ..strTrophy = json['strTrophy'] as String
    ..strNaming = json['strNaming'] as String
    ..strComplete = json['strComplete'] as String
    ..strLocked = json['strLocked'] as String;
}

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'idLeague': instance.idLeague,
      'idSoccerXML': instance.idSoccerXML,
      'idAPIfootball': instance.idAPIfootball,
      'strSport': instance.strSport,
      'strLeague': instance.strLeague,
      'strLeagueAlternate': instance.strLeagueAlternate,
      'strDivision': instance.strDivision,
      'idCup': instance.idCup,
      'strCurrentSeason': instance.strCurrentSeason,
      'intFormedYear': instance.intFormedYear,
      'dateFirstEvent': instance.dateFirstEvent,
      'strGender': instance.strGender,
      'strCountry': instance.strCountry,
      'strWebsite': instance.strWebsite,
      'strFacebook': instance.strFacebook,
      'strTwitter': instance.strTwitter,
      'strYoutube': instance.strYoutube,
      'strRSS': instance.strRSS,
      'strDescriptionEN': instance.strDescriptionEN,
      'strDescriptionDE': instance.strDescriptionDE,
      'strDescriptionFR': instance.strDescriptionFR,
      'strDescriptionIT': instance.strDescriptionIT,
      'strDescriptionCN': instance.strDescriptionCN,
      'strDescriptionJP': instance.strDescriptionJP,
      'strDescriptionRU': instance.strDescriptionRU,
      'strDescriptionES': instance.strDescriptionES,
      'strDescriptionPT': instance.strDescriptionPT,
      'strDescriptionSE': instance.strDescriptionSE,
      'strDescriptionNL': instance.strDescriptionNL,
      'strDescriptionHU': instance.strDescriptionHU,
      'strDescriptionNO': instance.strDescriptionNO,
      'strDescriptionPL': instance.strDescriptionPL,
      'strDescriptionIL': instance.strDescriptionIL,
      'strFanart1': instance.strFanart1,
      'strFanart2': instance.strFanart2,
      'strFanart3': instance.strFanart3,
      'strFanart4': instance.strFanart4,
      'strBanner': instance.strBanner,
      'strBadge': instance.strBadge,
      'strLogo': instance.strLogo,
      'strPoster': instance.strPoster,
      'strTrophy': instance.strTrophy,
      'strNaming': instance.strNaming,
      'strComplete': instance.strComplete,
      'strLocked': instance.strLocked,
    };
