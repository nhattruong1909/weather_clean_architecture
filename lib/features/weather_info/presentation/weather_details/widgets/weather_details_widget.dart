import 'package:flutter/material.dart';
import 'package:weather_clean_architecture/core/constant/Constant.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/weather_remote_info_response_enitity/weather_info_entity.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    super.key,
    required this.weather,
  });
  final WeatherInfoEntity weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            widthFactor: double.infinity,
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: const BoxDecoration(
                    color: Constant.backgroundDetails,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Align(
                    alignment: Alignment.center,
                    widthFactor: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(weather.name!,
                                style: const TextStyle(fontSize: 30))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(weather.weather?.first?.main ?? '',
                                style: const TextStyle(fontSize: 20))),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                                weather.weather?.first?.description ?? '',
                                style: const TextStyle(fontSize: 20)))
                      ],
                    )))),
        Align(
            alignment: Alignment.center,
            widthFactor: double.infinity,
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: const BoxDecoration(
                    color: Constant.backgroundDetails,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text('Temperature: ${weather.main?.temp ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child:
                          Text('Feel like: ${weather.main?.feels_like ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                          'Temperature maximum: ${weather.main?.temp_max ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                          'Temperature minimum: ${weather.main?.temp ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text('Pressure: ${weather.main?.pressure ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text('Humidity: ${weather.main?.humidity ?? ''}'),
                    )
                  ],
                ))),
        Align(
            alignment: Alignment.center,
            widthFactor: double.infinity,
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: const BoxDecoration(
                    color: Constant.backgroundDetails,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text('Wind: ${weather.wind?.speed ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text('Visibility: ${weather.visibility ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text('Sunrise: ${weather.sys?.sunrise ?? ''}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text('Sunset: ${weather.sys?.sunset ?? ''}'),
                    )
                  ],
                ))),
      ],
    );
  }
}
