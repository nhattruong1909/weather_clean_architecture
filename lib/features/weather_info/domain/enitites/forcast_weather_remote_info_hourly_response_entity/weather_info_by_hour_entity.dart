import 'package:equatable/equatable.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/clouds_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/main_weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_description_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/wind_info_entity.dart';

class WeatherInfoByHourEntity extends Equatable {
  final String? dt;
  final MainWeatherInfoEntity? main;
  final WindInfoEntity? wind;
  final CloudsEntity? clouds;
  final List<WeatherDescriptionEntity?>? weather;

  WeatherInfoByHourEntity(
      {this.dt, this.main, this.wind, this.clouds, this.weather});

  @override
  // TODO: implement props
  List<Object?> get props => [dt, main, wind, clouds, weather];
}
