import 'package:equatable/equatable.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_theme_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/city_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_by_hour_entity.dart';

class WeatherInfoForecastEntity extends Equatable {
  final List<WeatherInfoByHourEntity>? list;
  final CityEntity? city;

  WeatherInfoForecastEntity({this.list, this.city, this.weatherTheme});

  @override
  // TODO: implement props
  List<Object?> get props => [list, city, weatherTheme];

  final List<WeatherThemeEntity?>? weatherTheme;
}
