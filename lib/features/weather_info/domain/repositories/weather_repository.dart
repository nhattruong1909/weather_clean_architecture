import 'package:weather_clean_architecture/core/network/network_exception.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_forecast_entity.dart';

abstract class WeatherRepository {
  Future<Either<NetworkException, WeatherInfoEntity?>> getWeatherDataByCity(
      {String? cityName});
  Future<Either<NetworkException, WeatherInfoForecastEntity?>>
      getWeatherForecast({String? cityName});
  Future<Either<NetworkException, WeatherInfoEntity?>>
      getCurrentLocationWeather();
  Future<Either<NetworkException, WeatherInfoForecastEntity?>>
      getCurrentLocationForecast();
}
