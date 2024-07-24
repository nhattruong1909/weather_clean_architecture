import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/forcast_weather_remote_info_hourly_response_model/weather_info_forecast_response_model.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherInfoResponseModel?> getWeatherInfoByCity(String cityName);
  Future<WeatherInfoForecastResponseModel?> getWeatherForecast(String cityName);
}
