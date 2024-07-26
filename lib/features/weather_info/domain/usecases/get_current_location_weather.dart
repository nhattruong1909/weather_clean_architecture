import 'package:fpdart/src/either.dart';
import 'package:weather_clean_architecture/core/commondomain/usecases/base_params_usecase.dart';
import 'package:weather_clean_architecture/core/network/network_exception.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/repositories/weather_repository.dart';

class GetCurrentLocationWeather
    implements BaseParamsUsecase<WeatherInfoEntity?, NoParams> {
  final WeatherRepository weatherRepository;
  GetCurrentLocationWeather({required this.weatherRepository});

  @override
  Future<Either<NetworkException, WeatherInfoEntity?>> call(
      NoParams? params) async {
    return await weatherRepository.getCurrentLocationWeather();
  }
}
