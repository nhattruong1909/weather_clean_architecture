import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/usecases/get_weather_data_by_city.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({required this.getWeatherDataByCity})
      : super(const WeatherInitial()) {
    on<WeatherEvent>((event, emit) {});
    on<WeatherInitialEvent>(_onInitate);
    on<WeatherInputCityEvent>(_onInputCity);
  }
  final GetWeatherDataByCity getWeatherDataByCity;

  FutureOr<void> _onInitate(
      WeatherInitialEvent event, Emitter<WeatherState> emit) async {
    emit(const WeatherInitial());
  }

  FutureOr<void> _onInputCity(
      WeatherInputCityEvent event, Emitter<WeatherState> emit) async {
    emit(const WeatherLoadingState());
    var result = await getWeatherDataByCity(event.cityName);
    result.fold((l) => emit(WeatherErrorState(l.message)),
        (r) => emit(WeatherLoadedByCityState(r)));
  }
}
