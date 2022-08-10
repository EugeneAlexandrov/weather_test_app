import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_test_app/core/services/Api_client.dart';
import 'package:weather_test_app/feature_search_weather/presentation/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final ApiClient apiClient;

  WeatherCubit({required this.apiClient}) : super(const WeatherState.initial());

  void onTapLoading(String city) {
    emit(state.copyWith(isLoading: true));
    try {
      apiClient.loadCurrentWeather(city).then((response) {
        if (response == null) {
          emit(state.copyWith(isBadRequest: true, isLoading: false));
        } else {
          emit(state.copyWith(response: response, isLoading: false));
        }
      });
    } catch (e) {
      emit(state.copyWith(isBadRequest: true));
    }
  }
}
