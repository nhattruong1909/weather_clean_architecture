import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_architecture/core/mapper/data_mapper.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/wind_info_entity.dart';

part 'wind_info_response_model.g.dart';

@JsonSerializable()
class WindInfoResponseModel implements DataMapper<WindInfoEntity>{
  final double? speed;
  final int? deg;

  WindInfoResponseModel({this.speed, this.deg});

  factory WindInfoResponseModel.fromJson(Map<String,dynamic> json)
  => _$WindInfoResponseModelFromJson(json);

  @override
  WindInfoEntity mapToEntity() {
    return WindInfoEntity(
      speed: speed ?? 0.0,
      deg: deg ?? 0
    );
  }





}