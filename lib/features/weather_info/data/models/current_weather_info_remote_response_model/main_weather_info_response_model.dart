import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_architecture/core/mapper/data_mapper.dart';
import 'package:weather_clean_architecture/core/utils/helpers/extension_function.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/main_weather_info_entity.dart';

part 'main_weather_info_response_model.g.dart';

@JsonSerializable()
class MainWeatherInfoResponseModel
    implements DataMapper<MainWeatherInfoEntity> {
  final double? temp;
  @JsonKey(name: 'feels_like')
  final double? feels_like;
  @JsonKey(name: 'temp_min')
  final double? temp_min;
  @JsonKey(name: 'temp_max')
  final double? temp_max;
  final int? pressure;
  final int? humidity;

  MainWeatherInfoResponseModel(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  factory MainWeatherInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherInfoResponseModelFromJson(json);

  @override
  MainWeatherInfoEntity mapToEntity() {
    return MainWeatherInfoEntity(
        temp: temp?.toCelsius() ?? '',
        feels_like: feels_like ?? 0.0,
        temp_min: temp_min ?? 0.0,
        temp_max: temp_max ?? 0.0,
        pressure: pressure ?? 0,
        humidity: humidity ?? 0);
  }
}
