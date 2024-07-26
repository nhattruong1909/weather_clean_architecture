part of 'weather_bloc.dart';

sealed class WeatherState {
  const WeatherState();

  // @override
  // List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherLoadedByCityState extends WeatherState {
  final WeatherInfoEntity? weatherInfoEntity;
  final WeatherInfoForecastEntity? weatherInfoForecastEntity;
  const WeatherLoadedByCityState(
      {this.weatherInfoEntity, this.weatherInfoForecastEntity});
  //     @override
  // List<Object?> get props =><Object?>[weatherInfoEntity,weatherInfoForecastEntity];
}

final class WeatherLoadingState extends WeatherState {
  const WeatherLoadingState();
}

final class WeatherErrorState extends WeatherState {
  final String? message;
  const WeatherErrorState(this.message);
}
