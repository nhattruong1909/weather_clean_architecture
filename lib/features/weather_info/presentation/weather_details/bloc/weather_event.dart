// ignore_for_file: must_be_immutable

part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherInitialEvent extends WeatherEvent {
  const WeatherInitialEvent();
}

class WeatherInitialCurrentEvent extends WeatherEvent {
  const WeatherInitialCurrentEvent();
}

class WeatherInitailForecastEvent extends WeatherEvent {
  const WeatherInitailForecastEvent();
}

// ignore: duplicate_ignore
// ignore: must_be_immutable
class WeatherInputCityEvent extends WeatherEvent {
  String? cityName;
  WeatherInputCityEvent(this.cityName);
}

class WeatherInputCityForCurrentEvent extends WeatherEvent {
  String? cityName;
  WeatherInputCityForCurrentEvent(this.cityName);
}

class WeatherInputCityForForcaseEvent extends WeatherEvent {
  String? cityName;
  WeatherInputCityForForcaseEvent(this.cityName);
}
