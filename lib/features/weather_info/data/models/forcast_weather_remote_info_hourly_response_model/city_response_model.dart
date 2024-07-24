import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_architecture/core/mapper/data_mapper.dart';
import 'package:weather_clean_architecture/core/utils/helpers/date_extension_function.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/city_entity.dart';

part 'city_response_model.g.dart';

@JsonSerializable()
class CityResponseModel implements DataMapper<CityEntity> {
  final int? id;
  final String? name;
  final int? sunrise;
  final int? sunset;

  CityResponseModel({this.id, this.name, this.sunrise, this.sunset});

  factory CityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CityResponseModelFromJson(json);

  @override
  CityEntity mapToEntity() {
    return CityEntity(
        id: id ?? 0,
        name: name ?? '',
        sunrise: sunrise?.fromTimestampToTime() ?? '',
        sunset: sunset?.fromTimestampToTime() ?? '');
  }
}
