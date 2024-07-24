import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_clean_architecture/core/commondomain/usecases/base_params_usecase.dart';
import 'package:weather_clean_architecture/core/network/network_exception.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/repositories/weather_repository.dart';

@injectable
class GetWeatherDataByCity
    implements BaseParamsUsecase<WeatherInfoEntity?, String> {
  final WeatherRepository weatherRepository;
  GetWeatherDataByCity({required this.weatherRepository});

  @override
  Future<Either<NetworkException, WeatherInfoEntity?>> call(String? cityName) {
    return weatherRepository.getWeatherDataByCity(cityName: cityName);
  }
}
