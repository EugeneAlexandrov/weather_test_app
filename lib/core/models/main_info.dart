import 'package:json_annotation/json_annotation.dart';

part 'main_info.g.dart';

@JsonSerializable()
class MainInfo {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'sea_level', required: false)
  final int? seaLevel;
  @JsonKey(name: 'grnd_level', required: false)
  final int? grndLevel;

  MainInfo(this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure,
      this.humidity, this.seaLevel, this.grndLevel);

  factory MainInfo.fromJson(Map<String, dynamic> json) =>
      _$MainInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MainInfoToJson(this);

  @override
  String toString() {
    return '{"temp": $temp, "feels_like": $feelsLike, "temp_min": $tempMin, "temp_max": $tempMax, "pressure": $pressure, "humidity": $humidity, "sea_level": $seaLevel, "grnd_level": $grndLevel}';
  }
}
