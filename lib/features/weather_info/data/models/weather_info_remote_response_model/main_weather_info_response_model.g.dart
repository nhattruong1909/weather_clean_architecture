// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather_info_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainWeatherInfoResponseModel _$MainWeatherInfoResponseModelFromJson(
        Map<String, dynamic> json) =>
    MainWeatherInfoResponseModel(
      temp: (json['temp'] as num?)?.toDouble(),
      feels_like: (json['feels_like'] as num?)?.toDouble(),
      temp_min: (json['temp_min'] as num?)?.toDouble(),
      temp_max: (json['temp_max'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toInt(),
      humidity: (json['humidity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MainWeatherInfoResponseModelToJson(
        MainWeatherInfoResponseModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
