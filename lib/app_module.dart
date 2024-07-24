import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_clean_architecture/core/network/dio_client.dart';
import 'package:weather_clean_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource.dart';
import 'package:weather_clean_architecture/features/weather_info/data/datasources/remote_datasource/weather_remote_datasource_impl.dart';
import 'package:weather_clean_architecture/features/weather_info/data/repositories/weather_repository_impl.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/repositories/weather_repository.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/usecases/get_weather_data_by_city.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/usecases/get_weather_data_forecast.dart';
import 'package:weather_clean_architecture/features/weather_info/presentation/weather_details/bloc/weather_bloc.dart';
import 'package:weather_clean_architecture/features/weather_info/presentation/weather_details/view/home_page.dart';

class AppModule extends Module {
  AppModule();
  // @override
  // List<Bind<Object>> get binds => [
  //       Bind.lazySingleton((i) => DioClient()),
  //       Bind.lazySingleton<WeatherRemoteDatasource>(
  //           (i) => WeatherRemoteDatasourceImpl(i.get<DioClient>())),
  //       Bind.lazySingleton<WeatherRepository>(
  //           (i) => WeatherRepositoryImpl(i.get<WeatherRemoteDatasource>())),
  //       Bind.lazySingleton((i) => GetWeatherDataByCity(i.get())),
  //       Bind.lazySingleton((i) => WeatherBloc(i.get<GetWeatherDataByCity>())),
  //     ];

  // @override
  // List<ModularRoute> get routes =>
  //     [ChildRoute('/', child: (context, args) => HomePage())];
  @override
  void binds(Injector i) {
    // TODO: implement binds
    i.addLazySingleton(() => DioClient());
    i.addLazySingleton<WeatherRemoteDatasource>(
        () => WeatherRemoteDatasourceImpl(dio: i.get<DioClient>()));
    i.addLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
        weatherRemoteDatasource: i.get<WeatherRemoteDatasource>()));
    i.addLazySingleton(() =>
        GetWeatherDataByCity(weatherRepository: i.get<WeatherRepository>()));
    i.addLazySingleton(() =>
        GetWeatherDataForecast(weatherRepository: i.get<WeatherRepository>()));
    i.addLazySingleton(() => WeatherBloc(
        getWeatherDataByCity: i.get<GetWeatherDataByCity>(),
        getWeatherDataForecast: i.get<GetWeatherDataForecast>()));
  }

  @override
  void routes(RouteManager r) {
    // TODO: implement routes
    r.child('/', child: (conext) => const HomePage());
  }
}
