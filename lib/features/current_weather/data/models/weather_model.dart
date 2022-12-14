import 'package:json_annotation/json_annotation.dart';
import 'package:weather_task/features/current_weather/data/models/state_model.dart';
import 'package:weather_task/features/current_weather/data/models/location_model.dart';
import 'package:weather_task/features/current_weather/domain/entiries/weather.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Weather {
  final StateModel current;
  final LocationModel location;
  const WeatherModel({
    required this.current,
    required this.location,
  }) : super(weatherState: current, weatherLocation: location);

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
