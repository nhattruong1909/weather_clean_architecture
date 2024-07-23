import 'package:weather_clean_architecture/features/weather_info/data/models/weather_info_remote_response_model/weather_info_response_model.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherInfoResponseModel?> getWeatherInfoByCity(String cityName);
}
