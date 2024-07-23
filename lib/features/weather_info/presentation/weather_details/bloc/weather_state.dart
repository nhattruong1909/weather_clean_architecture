part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherLoadedByCityState extends WeatherState {
  final WeatherInfoEntity? weatherInfoEntity;
  const WeatherLoadedByCityState(this.weatherInfoEntity);
}

final class WeatherLoadingState extends WeatherState {
  const WeatherLoadingState();
}

final class WeatherErrorState extends WeatherState {
  final String? message;
  const WeatherErrorState(this.message);
}
