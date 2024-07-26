import 'package:flutter/material.dart';
import 'package:weather_clean_architecture/core/constant/constant.dart';
import 'package:weather_clean_architecture/core/utils/values/style.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_info_entity.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    super.key,
    required this.weather,
  });
  final WeatherInfoEntity weather;

  @override
  Widget build(BuildContext context) {
    final _icon = weather.weather?[0]?.icon ?? '01d';
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
                    color: Color(0x26FFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Column(
                  children: [
                    Padding(
                        padding: Constant.paddingValue,
                        child: Text(weather.name ?? '',
                            style: poppinsBold.copyWith(fontSize: 30))),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.network(
                        'https://openweathermap.org/img/wn/$_icon@2x.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                        padding: Constant.paddingValue,
                        child: Text(weather.main?.temp ?? '',
                            style: poppinsBoldItalic.copyWith(fontSize: 70))),
                    Padding(
                        padding: Constant.paddingValue,
                        child: Text(weather.weather?.first?.description ?? '',
                            style: poppinsMediumItalic.copyWith(fontSize: 20)))
                  ],
                ))),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      'Pressure',
                      style: poppinsRegular.copyWith(fontSize: 20),
                    ),
                    Text.rich(TextSpan(children: [
                      const WidgetSpan(
                          child: Icon(
                        Icons.cloud,
                        color: Colors.white,
                        size: 20,
                      )),
                      TextSpan(
                          text: weather.main?.pressure.toString() ?? 'None',
                          style: poppinsRegular.copyWith(fontSize: 20))
                    ]))
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(children: [
                  Text(
                    'Visibility',
                    style: poppinsRegular.copyWith(fontSize: 20),
                  ),
                  Text.rich(TextSpan(children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.visibility,
                      color: Colors.white,
                      size: 20,
                    )),
                    TextSpan(
                        text: weather.visibility?.toString() ?? 'None',
                        style: poppinsRegular.copyWith(fontSize: 20))
                  ]))
                ])),
            Expanded(
                flex: 1,
                child: Column(children: [
                  Text(
                    'Humidity',
                    style: poppinsRegular.copyWith(fontSize: 20),
                  ),
                  Text.rich(TextSpan(children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.water_drop,
                      color: Colors.white,
                      size: 20,
                    )),
                    TextSpan(
                        text: weather.main?.humidity?.toString() ?? 'None',
                        style: poppinsRegular.copyWith(fontSize: 20))
                  ]))
                ]))
          ],
        )
      ],
    );
  }
}
