import 'package:json_annotation/json_annotation.dart';

part 'coord.g.dart';

@JsonSerializable()
class Coord {
  final double lon;
  final double lat;

  Coord(this.lon, this.lat);

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);

  Map<String, dynamic> toJson() => _$CoordToJson(this);

  @override
  String toString() {
    return '{"lon": $lon, "lat": $lat}';
  }
}
