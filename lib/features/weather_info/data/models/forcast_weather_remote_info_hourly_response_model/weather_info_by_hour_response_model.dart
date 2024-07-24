import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_architecture/core/mapper/data_mapper.dart';
import 'package:weather_clean_architecture/core/utils/helpers/date_extension_function.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/clouds_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/main_weather_info_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/weather_description_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/wind_info_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/clouds_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/main_weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_description_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/wind_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_by_hour_entity.dart';

part 'weather_info_by_hour_response_model.g.dart';

@JsonSerializable()
class WeatherInfoByHourResponseModel
    implements DataMapper<WeatherInfoByHourEntity> {
  final int? dt;
  final MainWeatherInfoResponseModel? main;
  final WindInfoResponseModel? wind;
  final CloudsResponseModel? clouds;
  final List<WeatherDescriptionResponseModel>? weather;

  WeatherInfoByHourResponseModel(
      {this.dt, this.main, this.wind, this.clouds, this.weather});

  factory WeatherInfoByHourResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoByHourResponseModelFromJson(json);

  @override
  WeatherInfoByHourEntity mapToEntity() {
    final List<WeatherDescriptionEntity>? _weather = weather
        ?.map((WeatherDescriptionResponseModel weatherDescriptionEntity) =>
            weatherDescriptionEntity.mapToEntity())
        .toList();
    return WeatherInfoByHourEntity(
        dt: dt.fromTimestampToTime() ?? '',
        main: main?.mapToEntity() ?? MainWeatherInfoEntity(),
        wind: wind?.mapToEntity() ?? const WindInfoEntity(),
        clouds: clouds?.mapToEntity() ?? const CloudsEntity(),
        weather: _weather);
  }
}
