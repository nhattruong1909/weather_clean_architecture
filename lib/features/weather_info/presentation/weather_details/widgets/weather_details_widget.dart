import 'package:flutter/material.dart';
import 'package:weather_clean_architecture/core/constant/constant.dart';
import 'package:weather_clean_architecture/core/utils/values/style.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/current_weather_remote_info_response_enitity/weather_info_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/domain/enitites/forcast_weather_remote_info_hourly_response_entity/weather_info_forecast_entity.dart';
import 'package:weather_clean_architecture/features/weather_info/presentation/weather_details/widgets/weather_3hours_list_widget.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    super.key,
    required this.weather,
    required this.weather_forecast,
  });
  final WeatherInfoEntity weather;
  final WeatherInfoForecastEntity weather_forecast;

  @override
  Widget build(BuildContext context) {
    final _icon = weather.weather?[0]?.icon ?? '01d';
    final _firstColor =
        weather.weatherTheme?.firstColor ?? const Color(0xFF3E97C8);
    final _secondColor =
        weather.weatherTheme?.secondColor ?? const Color(0xFFD8E7F2);
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
            children: [
              Align(
                  alignment: Alignment.center,
                  widthFactor: double.infinity,
                  child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      decoration: const BoxDecoration(
                          color: Color(0x26FFFFFF),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0))),
                      child: Column(
                        children: [
                          Padding(
                              padding: Constant.paddingValue,
                              child: Text(weather.name!,
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
                                  style: poppinsBoldItalic.copyWith(
                                      fontSize: 70))),
                          Padding(
                              padding: Constant.paddingValue,
                              child: Text(
                                  weather.weather?.first?.description ?? '',
                                  style: poppinsMediumItalic.copyWith(
                                      fontSize: 20)))
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
                            WidgetSpan(
                                child: Icon(
                              Icons.cloud,
                              color: Colors.white,
                              size: 20,
                            )),
                            TextSpan(
                                text:
                                    weather.main?.pressure.toString() ?? 'None',
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
                          WidgetSpan(
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
                          WidgetSpan(
                              child: Icon(
                            Icons.water_drop,
                            color: Colors.white,
                            size: 20,
                          )),
                          TextSpan(
                              text:
                                  weather.main?.humidity?.toString() ?? 'None',
                              style: poppinsRegular.copyWith(fontSize: 20))
                        ]))
                      ]))
                ],
              ),
              Align(
                  alignment: Alignment.center,
                  widthFactor: double.infinity,
                  child: Weather3hoursListWidget(weather: weather_forecast))
            ],
          ),
        ));
  }
}
