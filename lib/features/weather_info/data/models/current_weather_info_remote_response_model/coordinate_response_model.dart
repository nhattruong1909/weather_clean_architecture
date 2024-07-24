import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_architecture/core/mapper/data_mapper.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/coordinate_entity.dart';

part 'coordinate_response_model.g.dart';

@JsonSerializable()
class CoordinateResponseModel implements DataMapper<CoordinateEntity> {
  final double? lon;
  final double? lat;

  CoordinateResponseModel({this.lon, this.lat});
  factory CoordinateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinateResponseModelFromJson(json);
  @override
  CoordinateEntity mapToEntity() {
    return CoordinateEntity(lon: lon ?? 0.0, lat: lat ?? 0.0);
  }
}
