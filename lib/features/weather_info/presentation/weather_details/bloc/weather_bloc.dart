import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_forecast_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/usecases/get_weather_data_by_city.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/usecases/get_weather_data_forecast.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.getWeatherDataByCity,
    required this.getWeatherDataForecast,
  }) : super(const WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});
    on<WeatherInitialEvent>(_onInitate);
    on<WeatherInputCityEvent>(_onInputCity);
  }
  final GetWeatherDataByCity getWeatherDataByCity;
  final GetWeatherDataForecast getWeatherDataForecast;

  FutureOr<void> _onInitate(
      WeatherInitialEvent event, Emitter<WeatherState> emit) async {
    emit(const WeatherInitial());
  }

  FutureOr<void> _onInputCity(
      WeatherInputCityEvent event, Emitter<WeatherState> emit) async {
    emit(const WeatherLoadingState());
    var result_present = await getWeatherDataByCity(event.cityName);
    var result_forecast = await getWeatherDataForecast(event.cityName);
    result_present
        .fold((l_present) => emit(WeatherErrorState(l_present.message)),
            // (r) => emit(WeatherLoadedByCityState(r)));
            (r_present) {
      // final result_forecast = await getWeatherDataForecast(event.cityName);
      result_forecast.fold(
          (l_forecast) => emit(WeatherErrorState(l_forecast.message)),
          (r_forecast) =>
              emit(WeatherLoadedByCityState(r_present, r_forecast)));
    });
  }
}
