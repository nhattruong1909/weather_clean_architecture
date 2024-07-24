import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final int? id;
  final String? name;
  final String? sunrise;
  final String? sunset;

  CityEntity({this.id, this.name, this.sunrise, this.sunset});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, sunrise, sunset];
}
