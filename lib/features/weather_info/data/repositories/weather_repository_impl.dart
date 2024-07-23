import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/fpdart.dart';

import 'package:weather_clean_architecture/core/network/network_exception.dart';
import 'package:weather_clean_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDatasource weatherRemoteDatasource;
  WeatherRepositoryImpl({required this.weatherRemoteDatasource});

  @override
  Future<Either<NetworkException, WeatherInfoEntity?>> getWeatherDataByCity(
      {String? cityName}) async {
    try {
      if (cityName != null) {
        final model =
            await weatherRemoteDatasource.getWeatherInfoByCity(cityName);
        if (model != null) {
          return right(model.mapToEntity());
        } else {
          return left(NetworkException('Wrong City!'));
        }
      } else {
        return left(NetworkException('No City!'));
      }
    } on DioException catch (e) {
      return left(NetworkException.fromDioError(e));
    }
  }
}
