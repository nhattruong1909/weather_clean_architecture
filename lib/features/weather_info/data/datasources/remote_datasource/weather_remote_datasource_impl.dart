import 'package:dio/dio.dart';

import 'package:weather_clean_architecture/core/constant/constant.dart';
import 'package:weather_clean_architecture/core/network/dio_client.dart';
import 'package:weather_clean_architecture/core/network/network_exception.dart';
import 'package:weather_clean_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/weather_info_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/forcast_weather_remote_info_hourly_response_model/weather_info_forecast_response_model.dart';

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  WeatherRemoteDatasourceImpl({required this.dio});
  final DioClient dio;

  @override
  Future<WeatherInfoResponseModel?> getWeatherInfoByCity(
      String cityName) async {
    try {
      final response = await dio
          .get(Constant.weather, {'q': cityName, 'appid': Constant.apiKey});
      final model = WeatherInfoResponseModel.fromJson(
          response.data as Map<String, dynamic>);
      return model;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

  @override
  Future<WeatherInfoForecastResponseModel?> getWeatherForecast(
      String cityName) async {
    try {
      final response = await dio.get(
          Constant.weather_forecast, {'q': cityName, 'appid': Constant.apiKey});
      final model = WeatherInfoForecastResponseModel.fromJson(
          response.data as Map<String, dynamic>);
      return model;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}
