import 'package:get_it/get_it.dart';
import 'package:weather_test_app/core/services/Api_client.dart';
import 'package:weather_test_app/feature_city_validate/presentation/city_cubit.dart';
import 'package:weather_test_app/feature_search_weather/presentation/weather_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  setupServices();
  setupBlocs();
}

void setupServices() {
  locator.registerSingleton(ApiClient());
}

void setupBlocs() {
  locator.registerSingleton(CityCubit());
  locator.registerSingleton(WeatherCubit(apiClient: locator.get()));
}
