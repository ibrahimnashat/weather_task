// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateModel _$StateModelFromJson(Map<String, dynamic> json) => StateModel(
      condition:
          ConditonModel.fromJson(json['condition'] as Map<String, dynamic>),
      last_updated: json['last_updated'] as String,
      wind_degree: (json['wind_degree'] as num).toDouble(),
      wind_dir: json['wind_dir'] as String,
      temp_c: (json['temp_c'] as num).toDouble(),
    );

Map<String, dynamic> _$StateModelToJson(StateModel instance) =>
    <String, dynamic>{
      'last_updated': instance.last_updated,
      'wind_degree': instance.wind_degree,
      'temp_c': instance.temp_c,
      'wind_dir': instance.wind_dir,
      'condition': instance.condition.toJson(),
    };
