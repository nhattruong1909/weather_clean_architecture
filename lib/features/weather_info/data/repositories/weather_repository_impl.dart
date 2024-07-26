import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:fpdart/fpdart.dart';

import 'package:weather_clean_architecture/core/network/network_exception.dart';
import 'package:weather_clean_architecture/core/utils/location/location_helper.dart';
import 'package:weather_clean_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_forecast_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDatasource weatherRemoteDatasource;
  final LocationHelper locationHelper;
  WeatherRepositoryImpl(
      {required this.weatherRemoteDatasource, required this.locationHelper});

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

  @override
  Future<Either<NetworkException, WeatherInfoForecastEntity?>>
      getWeatherForecast({String? cityName}) async {
    try {
      if (cityName != null) {
        final model =
            await weatherRemoteDatasource.getWeatherForecast(cityName);
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

  @override
  Future<Either<NetworkException, WeatherInfoForecastEntity?>>
      getCurrentLocationForecast() async {
    try {
      final request_model = await locationHelper.getCurrentCoordinate();
      if (request_model.lat == null || request_model.lon == null) {
        return left(NetworkException('Cannot get current coordinates!'));
      } else {
        final model = await weatherRemoteDatasource
            .getWeatherForecastByCoordinates(request_model);
        if (model != null) {
          return right(model.mapToEntity());
        } else {
          return left(NetworkException('Wrong City!'));
        }
      }
    } on DioException catch (e) {
      return left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, WeatherInfoEntity?>>
      getCurrentLocationWeather() async {
    try {
      final request_model = await locationHelper.getCurrentCoordinate();
      if (request_model.lat == null || request_model.lon == null) {
        return left(NetworkException('Cannot get current coordinates!'));
      } else {
        final model = await weatherRemoteDatasource
            .getWeatherInfoByCoordinates(request_model);
        if (model != null) {
          return right(model.mapToEntity());
        } else {
          return left(NetworkException('Cannot get current weather!'));
        }
      }
    } on DioException catch (e) {
      return left(NetworkException.fromDioError(e));
    }
  }
}
