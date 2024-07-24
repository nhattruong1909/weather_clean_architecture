import 'package:equatable/equatable.dart';

class SunsetSunriseEntity extends Equatable{
  final int? type;
  final int? id;
  final String? country;
  final String? sunrise;
  final String? sunset;

  const SunsetSunriseEntity({this.type, this.id, this.country, this.sunrise, this.sunset});

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[type,id,country,sunrise,sunset];



}