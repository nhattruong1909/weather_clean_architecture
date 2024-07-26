import 'package:fpdart/src/either.dart';
import 'package:weather_clean_architecture/core/commondomain/usecases/base_params_usecase.dart';
import 'package:weather_clean_architecture/core/network/network_exception.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_forecast_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/repositories/weather_repository.dart';

class GetCurrentLocationForecast
    implements BaseParamsUsecase<WeatherInfoForecastEntity?, NoParams> {
  final WeatherRepository weatherRepository;

  GetCurrentLocationForecast({required this.weatherRepository});

  @override
  Future<Either<NetworkException, WeatherInfoForecastEntity?>> call(
      NoParams? params) {
    return weatherRepository.getCurrentLocationForecast();
  }
}
