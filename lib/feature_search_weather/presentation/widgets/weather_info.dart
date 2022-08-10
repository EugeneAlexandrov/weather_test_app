import 'package:flutter/material.dart';
import 'package:weather_test_app/core/models/weather_dto.dart';
import 'package:weather_test_app/styles.dart';

class WeatherInfoWidget extends StatelessWidget {
  final WeatherDto weather;

  const WeatherInfoWidget({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(247, 236, 222, 1),
        Color.fromRGBO(233, 218, 193, 1),
      ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weather.weather[0].main.toString(), style: mainTextStyle),
          Text("${weather.mainInfo.temp} \u2103", style: mainTextStyle),
          Text("${weather.mainInfo.humidity} %", style: mainTextStyle),
          Text('${weather.wind.speed} m/s', style: mainTextStyle),
        ],
      ),
    );
  }
}
