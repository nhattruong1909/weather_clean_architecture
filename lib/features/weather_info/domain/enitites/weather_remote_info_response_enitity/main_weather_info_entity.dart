import 'package:equatable/equatable.dart';

class MainWeatherInfoEntity extends Equatable{
  final String? temp;
  final double? feels_like;
  final double? temp_min;
  final double? temp_max;
  final int? pressure;
  final int? humidity;

  MainWeatherInfoEntity({this.temp,
  this.feels_like,
  this.temp_min,
  this.temp_max,
  this.pressure,
  this.humidity});

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[
    temp,
    feels_like,
    temp_min,
    temp_max,
    pressure,
    humidity
  ];


}