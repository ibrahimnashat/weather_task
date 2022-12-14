// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:weather_task/features/current_weather/domain/entiries/state.dart';

import 'condition_model.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel extends State {
  final String last_updated;
  final double wind_degree;
  final double temp_c;
  final String wind_dir;
  final ConditonModel condition;
  const StateModel({
    required this.condition,
    required this.last_updated,
    required this.wind_degree,
    required this.wind_dir,
    required this.temp_c,
  }) : super(
          weatherCondition: condition,
          lastUpdated: last_updated,
          windDegree: wind_degree,
          windDir: wind_dir,
          tempC: temp_c,
        );

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);
  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}
