import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_architecture/core/mapper/data_mapper.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/clouds_entity.dart';

part 'clouds_response_model.g.dart';

@JsonSerializable()
class CloudsResponseModel implements DataMapper<CloudsEntity>{
  final int? all;

  CloudsResponseModel({this.all});
  factory CloudsResponseModel.fromJson(Map<String,dynamic> json)
  => _$CloudsResponseModelFromJson(json);

  @override
  CloudsEntity mapToEntity() {
    return CloudsEntity(
      all: all ?? 0,
    );
  }




}