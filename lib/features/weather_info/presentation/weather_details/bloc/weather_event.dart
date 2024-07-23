part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherInitialEvent extends WeatherEvent {
  const WeatherInitialEvent();
}

// ignore: must_be_immutable
class WeatherInputCityEvent extends WeatherEvent {
  String? cityName;
  WeatherInputCityEvent(this.cityName);
}
