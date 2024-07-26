// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_clean_architecture/core/utils/values/style.dart';
import 'package:weather_clean_architecture/features/weather_info/presentation/weather_details/widgets/error_widget.dart';
import 'package:weather_clean_architecture/features/weather_info/presentation/weather_details/bloc/weather_bloc.dart';
import 'package:weather_clean_architecture/features/weather_info/presentation/weather_details/widgets/weather_3hours_list_widget.dart';
import 'package:weather_clean_architecture/features/weather_info/presentation/weather_details/widgets/weather_details_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final blocWeather = Modular.get<WeatherBloc>();
  bool _searchBool = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    blocWeather.add(const WeatherInitialEvent());
    blocWeather.add(const WeatherInitialCurrentEvent());
    blocWeather.add(const WeatherInitailForecastEvent());
  }

  Widget _searchTextField() {
    return TextField(
        controller: searchController,
        autofocus: true, //Display the keyboard when TextField is displayed
        cursorColor: Colors.black,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        onSubmitted: (value) {
          // blocWeather.add(WeatherInputCityEvent(searchController.text)),
          blocWeather
              .add(WeatherInputCityForCurrentEvent(searchController.text));
          blocWeather
              .add(WeatherInputCityForForcaseEvent(searchController.text));

          // Future.delayed(Duration(milliseconds: 100)).then((valueFuture) =>
          //     blocWeather
          //         .add(WeatherInputCityForCurrentEvent(searchController.text)));
        },
        textInputAction:
            TextInputAction.search, //Specify the action button on the keyboard
        decoration: const InputDecoration(
            //Style of TextField
            enabledBorder: UnderlineInputBorder(
                //Default TextField border
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: UnderlineInputBorder(
                //Borders when a TextField is in focus
                borderSide: BorderSide(color: Colors.black)),
            hintText:
                'City Name', //Text that is displayed when nothing is entered.
            hintStyle: TextStyle(
                //Style of hintText
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w200)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: blocWeather,
        child: Scaffold(
          appBar: AppBar(
            title:
                !_searchBool ? const Text('Weather App') : _searchTextField(),
            actions: !_searchBool
                ? [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _searchBool = true;
                          });
                        },
                        icon: const Icon(Icons.search))
                  ]
                : [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _searchBool = false;
                          });
                        },
                        icon: const Icon(Icons.clear))
                  ],
          ),
          body: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherInitial) {
                return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/background.jpg'),
                            fit: BoxFit.cover)));
              } else if (state is WeatherLoadingState)
                return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/background.jpg'),
                            fit: BoxFit.cover)),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ));
              else if (state is WeatherLoadedByCityState) {
                final _firstColor =
                    state.weatherInfoEntity?.weatherTheme?.firstColor ??
                        const Color(0xFF3E97C8);
                final _secondColor =
                    state.weatherInfoEntity?.weatherTheme?.secondColor ??
                        const Color(0xFFD8E7F2);
                return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[_secondColor, _firstColor])),
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          BlocBuilder<WeatherBloc, WeatherState>(
                              builder: (context, state) {
                            if (state is WeatherLoadedByCityState &&
                                state.weatherInfoEntity != null) {
                              return WeatherDetailsWidget(
                                  weather: state.weatherInfoEntity!);
                            }

                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: const BoxDecoration(
                                  color: Color(0x26FFFFFF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              width: double.infinity,
                              height: 30,
                              child: Text('Current Weather',
                                  style:
                                      poppinsSemiBold.copyWith(fontSize: 20)),
                            );
                          }),
                          BlocBuilder<WeatherBloc, WeatherState>(
                              builder: (context, state) {
                            if (state is WeatherLoadedByCityState &&
                                state.weatherInfoForecastEntity != null) {
                              return Weather3hoursListWidget(
                                  weather: state.weatherInfoForecastEntity!);
                            }

                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: const BoxDecoration(
                                  color: Color(0x26FFFFFF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                              width: double.infinity,
                              height: 30,
                              child: Text('Current Weather Forecast',
                                  style:
                                      poppinsSemiBold.copyWith(fontSize: 20)),
                            );
                          })
                        ])));
              } else if (state is WeatherErrorState)
                return CustomErrorWidget(error: state.message);
              else
                return const CustomErrorWidget(error: 'Unknown Error!');
            },
          ),
        ));
  }
}
