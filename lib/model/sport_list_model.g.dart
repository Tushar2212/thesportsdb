// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SportListModel _$SportListModelFromJson(Map<String, dynamic> json) {
  return SportListModel()
    ..sports = (json['sports'] as List)
        ?.map((e) =>
            e == null ? null : Sports.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SportListModelToJson(SportListModel instance) =>
    <String, dynamic>{
      'sports': instance.sports,
    };

Sports _$SportsFromJson(Map<String, dynamic> json) {
  return Sports()
    ..idSport = json['idSport'] as String
    ..strSport = json['strSport'] as String
    ..strFormat = json['strFormat'] as String
    ..strSportThumb = json['strSportThumb'] as String
    ..strSportThumbGreen = json['strSportThumbGreen'] as String
    ..strSportDescription = json['strSportDescription'] as String;
}

Map<String, dynamic> _$SportsToJson(Sports instance) => <String, dynamic>{
      'idSport': instance.idSport,
      'strSport': instance.strSport,
      'strFormat': instance.strFormat,
      'strSportThumb': instance.strSportThumb,
      'strSportThumbGreen': instance.strSportThumbGreen,
      'strSportDescription': instance.strSportDescription,
    };
