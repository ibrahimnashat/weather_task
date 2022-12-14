// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditonModel _$ConditonModelFromJson(Map<String, dynamic> json) =>
    ConditonModel(
      text: json['text'] as String,
      icon: json['icon'] as String,
      code: (json['code'] as num).toDouble(),
    );

Map<String, dynamic> _$ConditonModelToJson(ConditonModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };
