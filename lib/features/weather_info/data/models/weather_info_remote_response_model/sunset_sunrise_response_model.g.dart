// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sunset_sunrise_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SunsetSunriseResponseModel _$SunsetSunriseResponseModelFromJson(
        Map<String, dynamic> json) =>
    SunsetSunriseResponseModel(
      type: (json['type'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      country: json['country'] as String?,
      sunrise: (json['sunrise'] as num?)?.toInt(),
      sunset: (json['sunset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SunsetSunriseResponseModelToJson(
        SunsetSunriseResponseModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
