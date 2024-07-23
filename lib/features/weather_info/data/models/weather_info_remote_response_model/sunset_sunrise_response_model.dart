import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_architecture/core/mapper/data_mapper.dart';
import 'package:weather_clean_architecture/core/utils/helpers/date_extension_function.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/sunset_sunries_entity.dart';

part 'sunset_sunrise_response_model.g.dart';

@JsonSerializable()
class SunsetSunriseResponseModel implements DataMapper<SunsetSunriseEntity> {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  SunsetSunriseResponseModel(
      {this.type, this.id, this.country, this.sunrise, this.sunset});

  factory SunsetSunriseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SunsetSunriseResponseModelFromJson(json);

  @override
  SunsetSunriseEntity mapToEntity() {
    return SunsetSunriseEntity(
        type: type ?? 0,
        id: id ?? 0,
        country: country ?? "",
        sunrise: sunrise?.fromTimestampToTime(),
        sunset: sunset?.fromTimestampToTime());
  }
}
