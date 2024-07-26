import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_clean_architecture/core/constant/constant.dart';
import 'package:weather_clean_architecture/features/weather_info/utils/request_model/weather_by_coordinates_request_model.dart';

class LocationHelper {
  LocationHelper();
  Future<WeatherByCoordinatesRequestModel> getCurrentCoordinate() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return WeatherByCoordinatesRequestModel();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return WeatherByCoordinatesRequestModel(
        lon: position.longitude, lat: position.latitude);
  }

  Future<String?> getCurrentCityName() async {
    final currentCoord = await getCurrentCoordinate();
    Dio _dio = Dio(BaseOptions(
        baseUrl: Constant.urlGeocoding,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 20),
        responseType: ResponseType.json));
    final response = await _dio.get(Constant.reverse, queryParameters: {
      'lat': currentCoord.lat,
      'lon': currentCoord.lon,
      'limit': "1",
      'appid': Constant.apiKey
    });
    final String? name = response.data[0]['name'];
    return name;
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}
