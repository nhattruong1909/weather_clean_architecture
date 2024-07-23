import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_architecture/core/mapper/data_mapper.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/weather_description_entity.dart';

part 'weather_description_response_model.g.dart';

@JsonSerializable()
class WeatherDescriptionResponseModel implements DataMapper<WeatherDescriptionEntity>{
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherDescriptionResponseModel({this.id, this.main, this.description, this.icon});

  factory WeatherDescriptionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionResponseModelFromJson(json);

  @override
  WeatherDescriptionEntity mapToEntity() {
    return WeatherDescriptionEntity(
      id: id ?? 0,
      main: main ?? "",
      description: description ?? "",
      icon: icon ?? "",
    );
  }
}