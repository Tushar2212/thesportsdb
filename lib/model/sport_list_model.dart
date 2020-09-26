
import 'package:json_annotation/json_annotation.dart';

part 'sport_list_model.g.dart';

@JsonSerializable()
class SportListModel
{
List<Sports> sports;

SportListModel();

factory SportListModel.fromJson(Map<String, dynamic> json) => _$SportListModelFromJson(json);
Map<String, dynamic> toJson() => _$SportListModelToJson(this);
}

@JsonSerializable()
class Sports {
  String idSport;
  String strSport;
  String strFormat;
  String strSportThumb;
  String strSportThumbGreen;
  String strSportDescription;

  Sports();

  factory Sports.fromJson(Map<String, dynamic> json) => _$SportsFromJson(json);
  Map<String, dynamic> toJson() => _$SportsToJson(this);
}