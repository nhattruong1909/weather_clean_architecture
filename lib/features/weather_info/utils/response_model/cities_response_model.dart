import 'package:json_annotation/json_annotation.dart';

part 'cities_response_model.g.dart';

@JsonSerializable()
class CitiesResponseModel {
  final String? name;

  CitiesResponseModel({this.name});

  factory CitiesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CitiesResponseModelFromJson(json);
}
