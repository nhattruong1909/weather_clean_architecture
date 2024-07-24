// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_clean_architecture/features/weather_info/presentation/weather_details/widgets/error_widget.dart';
import 'package:weather_clean_architecture/features/weather_info/presentation/weather_details/bloc/weather_bloc.dart';
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
        onSubmitted: (value) =>
            blocWeather.add(WeatherInputCityEvent(searchController.text)),
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
              else if (state is WeatherLoadedByCityState)
                return WeatherDetailsWidget(
                    weather: state.weatherInfoEntity!,
                    weather_forecast: state.weatherInfoForecastEntity!);
              else if (state is WeatherErrorState)
                return CustomErrorWidget(error: state.message);
              else
                throw const CustomErrorWidget(error: 'Unknown Error!');
            },
          ),
        ));
  }
}
