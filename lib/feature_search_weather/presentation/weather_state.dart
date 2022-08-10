import 'package:equatable/equatable.dart';
import 'package:weather_test_app/core/models/weather_dto.dart';

class WeatherState extends Equatable {
  final bool isBadRequest;
  final bool isLoading;
  final WeatherDto? response;

  const WeatherState._({
    this.isBadRequest = false,
    this.isLoading = false,
    this.response,
  });

  const WeatherState.initial() : this._();

  WeatherState copyWith({
    bool? isBadRequest,
    bool? isLoading,
    WeatherDto? response,
  }) {
    return WeatherState._(
      isBadRequest: isBadRequest ?? this.isBadRequest,
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [
        isBadRequest,
        isLoading,
        response,
      ];
}
