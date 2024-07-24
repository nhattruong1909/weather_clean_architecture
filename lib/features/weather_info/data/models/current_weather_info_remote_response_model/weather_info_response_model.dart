import 'package:json_annotation/json_annotation.dart';
import 'package:weather_clean_architecture/core/mapper/data_mapper.dart';
import 'package:weather_clean_architecture/core/utils/helpers/date_extension_function.dart';
import 'package:weather_clean_architecture/core/utils/helpers/extension_function.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/clouds_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/coordinate_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/main_weather_info_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/sunset_sunrise_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/weather_description_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/data/models/current_weather_info_remote_response_model/wind_info_response_model.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/clouds_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/main_weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/sunset_sunries_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_description_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/wind_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/utils/enums/weather_type_enum.dart';

part 'weather_info_response_model.g.dart';

@JsonSerializable()
class WeatherInfoResponseModel extends DataMapper<WeatherInfoEntity> {
  WeatherInfoResponseModel(
      {this.coordinatesData,
      this.weatherDescription,
      this.mainWeatherData,
      this.weatherVisibility,
      this.windData,
      this.cloudsData,
      this.date,
      this.sunsetAndSunriseData,
      this.timezone,
      this.id,
      this.cityName});
  factory WeatherInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoResponseModelFromJson(json);

  @JsonKey(name: 'coord')
  CoordinateResponseModel? coordinatesData;
  @JsonKey(name: 'weather')
  List<WeatherDescriptionResponseModel>? weatherDescription;
  @JsonKey(name: 'main')
  MainWeatherInfoResponseModel? mainWeatherData;
  @JsonKey(name: 'wind')
  WindInfoResponseModel? windData;
  @JsonKey(name: 'visibility')
  int? weatherVisibility;
  @JsonKey(name: 'clouds')
  CloudsResponseModel? cloudsData;
  @JsonKey(name: 'dt')
  int? date;
  @JsonKey(name: 'sys')
  SunsetSunriseResponseModel? sunsetAndSunriseData;
  @JsonKey(name: 'timezone')
  int? timezone;
  int? id;
  @JsonKey(name: 'name')
  String? cityName;

  @override
  WeatherInfoEntity mapToEntity() {
    final List<WeatherDescriptionEntity>? _weatherDescription =
        weatherDescription
            ?.map((WeatherDescriptionResponseModel weatherDescriptionEntity) =>
                weatherDescriptionEntity.mapToEntity())
            .toList();
    final WeatherTypeEnum? weatherTypeEnum =
        _weatherDescription?[0].main?.toWeatherType();
    return WeatherInfoEntity(
      weather: _weatherDescription,
      main: mainWeatherData?.mapToEntity() ?? MainWeatherInfoEntity(),
      id: id ?? 0,
      visibility: weatherVisibility?.toKM() ?? '',
      clouds: cloudsData?.mapToEntity() ?? const CloudsEntity(),
      dt: date?.fromTimestampToDate(),
      name: cityName ?? '',
      sys: sunsetAndSunriseData?.mapToEntity() ?? const SunsetSunriseEntity(),
      timezone: timezone ?? 0,
      wind: windData?.mapToEntity() ?? const WindInfoEntity(),
      weatherTheme: weatherTypeEnum.toWeatherTheme(),
    );
  }
}
