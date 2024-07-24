// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info_by_hour_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoByHourResponseModel _$WeatherInfoByHourResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherInfoByHourResponseModel(
      dt: (json['dt'] as num?)?.toInt(),
      main: json['main'] == null
          ? null
          : MainWeatherInfoResponseModel.fromJson(
              json['main'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : WindInfoResponseModel.fromJson(
              json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : CloudsResponseModel.fromJson(
              json['clouds'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDescriptionResponseModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherInfoByHourResponseModelToJson(
        WeatherInfoByHourResponseModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'weather': instance.weather,
    };
