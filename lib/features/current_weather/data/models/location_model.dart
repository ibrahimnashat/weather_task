import 'package:json_annotation/json_annotation.dart';
import 'package:weather_task/features/current_weather/domain/entiries/locaton.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends Location {
  final double lat;
  final double lon;

  const LocationModel({
    required super.name,
    required super.region,
    required super.country,
    required super.localtime,
    required this.lat,
    required this.lon,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
