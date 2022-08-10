import 'package:json_annotation/json_annotation.dart';
import 'package:weather_test_app/core/models/clouds.dart';
import 'package:weather_test_app/core/models/coord.dart';
import 'package:weather_test_app/core/models/main_info.dart';
import 'package:weather_test_app/core/models/sys.dart';
import 'package:weather_test_app/core/models/weather.dart';
import 'package:weather_test_app/core/models/wind.dart';

part 'weather_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherDto {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  @JsonKey(name: 'main')
  final MainInfo mainInfo;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherDto(
      this.coord,
      this.weather,
      this.base,
      this.mainInfo,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod);

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);

  @override
  String toString() {
    return 'WeatherDto{coord: $coord, weather: $weather, base: $base, main: $mainInfo, visibility: $visibility, wind: $wind, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod}';
  }
}
