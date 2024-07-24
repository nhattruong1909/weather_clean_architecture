// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info_forecast_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoForecastResponseModel _$WeatherInfoForecastResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherInfoForecastResponseModel(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => WeatherInfoByHourResponseModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      city: json['city'] == null
          ? null
          : CityResponseModel.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherInfoForecastResponseModelToJson(
        WeatherInfoForecastResponseModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'city': instance.city,
    };
