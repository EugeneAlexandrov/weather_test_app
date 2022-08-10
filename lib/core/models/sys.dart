import 'package:json_annotation/json_annotation.dart';

part 'sys.g.dart';

@JsonSerializable()
class Sys {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  Sys(this.type, this.id, this.country, this.sunrise, this.sunset);

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);

  @override
  String toString() {
    return '{"type": $type, "id": $id, "country": $country, "sunrise": $sunrise, "sunset": $sunset}';
  }
}
