import 'package:json_annotation/json_annotation.dart';
import 'package:weather_task/features/current_weather/domain/entiries/condition.dart';
part 'condition_model.g.dart';

@JsonSerializable()
class ConditonModel extends Condition {
  const ConditonModel({
    required super.text,
    required super.icon,
    required super.code,
  });

  factory ConditonModel.fromJson(Map<String, dynamic> json) =>
      _$ConditonModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditonModelToJson(this);
}
