import 'package:flutter/material.dart';
import 'package:weather_clean_architecture/core/utils/values/style.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_forecast_entity.dart';

class Weather3hoursListWidget extends StatelessWidget {
  const Weather3hoursListWidget({super.key, required this.weather});
  final WeatherInfoForecastEntity weather;

  @override
  Widget build(BuildContext context) {
    final timestamps = weather.list ?? [];
    if (timestamps.isEmpty) {
      return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: const BoxDecoration(
              color: Color(0x26FFFFFF),
              borderRadius: const BorderRadius.all(Radius.circular(20.0))),
          child: Center(child: Text(' No forecast data.')));
    }
    return Container(
        width: double.infinity,
        height: 400,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
            color: Color(0x26FFFFFF),
            borderRadius: const BorderRadius.all(Radius.circular(20.0))),
        child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            itemCount: timestamps.length,
            itemBuilder: (BuildContext context, int index) {
              final _icon = timestamps[index].weather?[0]?.icon ?? '01d';
              return Container(
                  width: 40,
                  height: 40,
                  child: Row(children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          timestamps[index].dt ?? '',
                          style: poppinsRegular.copyWith(fontSize: 30),
                        )),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.network(
                            'https://openweathermap.org/img/wn/$_icon@2x.png',
                            fit: BoxFit.fitHeight,
                          )),
                    ),
                    Expanded(
                        flex: 2,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(timestamps[index].main?.temp ?? '',
                                style: poppinsRegular.copyWith(fontSize: 30))))
                  ]));
            }));
  }
}
