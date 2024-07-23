import 'package:equatable/equatable.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/clouds_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/sunset_sunries_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/weather_description_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/main_weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/weather_theme_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/wind_info_entity.dart';

class WeatherInfoEntity extends Equatable{

  final List<WeatherDescriptionEntity?>? weather;
  final MainWeatherInfoEntity? main;
  final WindInfoEntity? wind;
  final String? visibility;
  final CloudsEntity? clouds;
  final String? dt;
  final SunsetSunriseEntity? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final WeatherThemeEntity? weatherTheme;

  const WeatherInfoEntity({
      this.weather,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.weatherTheme,
  });

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[
    weather,
    main,
    visibility,
    wind,
    clouds,
    dt,
    sys,
    timezone,
    id,
    name,
    weatherTheme
  ];

}