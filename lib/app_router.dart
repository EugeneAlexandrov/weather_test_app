import 'package:flutter/material.dart';
import 'package:weather_test_app/feature_city_validate/presentation/city_screen.dart';
import 'package:weather_test_app/feature_search_weather/presentation/weather_screen.dart';

class AppRouter {
  static const String main = '/';
  static const String details = '/details';

  static Map<String, Widget Function(BuildContext context)> routes = {
    AppRouter.main: (_) => const CityScreen(),
    AppRouter.details: (_) => const WeatherScreen(),
  };
}
