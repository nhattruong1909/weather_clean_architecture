import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_architecture/core/mapper/data_mapper.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/forcast_weather_remote_info_hourly_response_model/city_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/forcast_weather_remote_info_hourly_response_model/weather_info_by_hour_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_theme_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/city_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_by_hour_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_forecast_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/utils/enums/weather_type_enum.dart';

part 'weather_info_forecast_response_model.g.dart';

@JsonSerializable()
class WeatherInfoForecastResponseModel
    implements DataMapper<WeatherInfoForecastEntity> {
  final List<WeatherInfoByHourResponseModel>? list;
  final CityResponseModel? city;

  WeatherInfoForecastResponseModel({this.list, this.city});

  factory WeatherInfoForecastResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$WeatherInfoForecastResponseModelFromJson(json);

  @override
  WeatherInfoForecastEntity mapToEntity() {
    final List<WeatherInfoByHourEntity>? _list = list
        ?.map((WeatherInfoByHourResponseModel weatherInfoByHourResponseModel) =>
            weatherInfoByHourResponseModel.mapToEntity())
        .toList();
    final List<WeatherThemeEntity?>? weatherTypeEntity = _list
        ?.map((WeatherInfoByHourEntity entity) =>
            entity.weather?[0]?.main?.toWeatherType().toWeatherTheme())
        .toList();
    return WeatherInfoForecastEntity(
        list: _list,
        city: city?.mapToEntity() ?? CityEntity(),
        weatherTheme: weatherTypeEntity);
  }
}
