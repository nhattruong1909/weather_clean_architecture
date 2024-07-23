import 'package:weather_clean_architecture/core/network/network_exception.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class WeatherRepository {
  Future<Either<NetworkException, WeatherInfoEntity?>> getWeatherDataByCity(
      {String? cityName});
}
