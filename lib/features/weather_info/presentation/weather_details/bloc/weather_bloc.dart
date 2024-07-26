import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:weather_clean_architecture/core/commondomain/usecases/base_params_usecase.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_forecast_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/usecases/get_current_location_forecast.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/usecases/get_current_location_weather.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/usecases/get_weather_data_by_city.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/usecases/get_weather_data_forecast.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.getCurrentLocationWeather,
    required this.getCurrentLocationForecast,
    required this.getWeatherDataByCity,
    required this.getWeatherDataForecast,
  }) : super(const WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});
    on<WeatherInitialEvent>(_onInitate);
    on<WeatherInputCityEvent>(_onInputCity);
    on<WeatherInitialCurrentEvent>(_onInitateCurrent);
    on<WeatherInitailForecastEvent>(_onInitateForecast);
    on<WeatherInputCityForCurrentEvent>(_onInputCityForCurrent);
    on<WeatherInputCityForForcaseEvent>(_onInputCityForForecast);
  }
  final GetWeatherDataByCity getWeatherDataByCity;
  final GetWeatherDataForecast getWeatherDataForecast;
  final GetCurrentLocationWeather getCurrentLocationWeather;
  final GetCurrentLocationForecast getCurrentLocationForecast;

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
          (r_forecast) => emit(WeatherLoadedByCityState(
              weatherInfoEntity: r_present,
              weatherInfoForecastEntity: r_forecast)));
    });
  }

  FutureOr<void> _onInputCityForCurrent(
      WeatherInputCityForCurrentEvent event, Emitter<WeatherState> emit) async {
    emit(const WeatherLoadingState());
    var result_present = await getWeatherDataByCity(event.cityName);
    result_present.fold(
        (l) => emit(WeatherErrorState(l.message)),
        (r) => emit(WeatherLoadedByCityState(
            weatherInfoEntity: r,
            weatherInfoForecastEntity: state is WeatherLoadedByCityState
                ? (state as WeatherLoadedByCityState).weatherInfoForecastEntity
                : null)));
  }

  FutureOr<void> _onInputCityForForecast(
      WeatherInputCityForForcaseEvent event, Emitter<WeatherState> emit) async {
    emit(const WeatherLoadingState());

    var result_forecast = await getWeatherDataForecast(event.cityName);
    result_forecast.fold(
        (l) => emit(WeatherErrorState(l.message)),
        (r) => emit(WeatherLoadedByCityState(
            weatherInfoEntity: state is WeatherLoadedByCityState
                ? (state as WeatherLoadedByCityState).weatherInfoEntity
                : null,
            weatherInfoForecastEntity: r)));
  }

  FutureOr<void> _onInitateCurrent(
      WeatherInitialCurrentEvent event, Emitter<WeatherState> emit) async {
    var result_present = await getCurrentLocationWeather(NoParams());
    result_present.fold(
        (l) => emit(WeatherErrorState(l.message)),
        (r) => emit(WeatherLoadedByCityState(
            weatherInfoEntity: r,
            weatherInfoForecastEntity: state is WeatherLoadedByCityState
                ? (state as WeatherLoadedByCityState).weatherInfoForecastEntity
                : null)));
  }

  FutureOr<void> _onInitateForecast(
      WeatherInitailForecastEvent event, Emitter<WeatherState> emit) async {
    var result_forecast = await getCurrentLocationForecast(NoParams());
    result_forecast.fold(
        (l) => emit(WeatherErrorState(l.message)),
        (r) => emit(WeatherLoadedByCityState(
            weatherInfoEntity: state is WeatherLoadedByCityState
                ? (state as WeatherLoadedByCityState).weatherInfoEntity
                : null,
            weatherInfoForecastEntity: r)));
  }
}
