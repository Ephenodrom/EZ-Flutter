// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EzCardThemeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EzCardThemeData _$EzCardThemeDataFromJson(Map<String, dynamic> json) {
  return EzCardThemeData(
    clipBehavior: json['clipBehavior'],
    color: json['color'] == null
        ? null
        : EzColor.fromJson(json['color'] as Map<String, dynamic>),
    elevation: (json['elevation'] as num)?.toDouble(),
    margin: json['margin'] == null
        ? null
        : EzEdgeInsets.fromJson(json['margin'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EzCardThemeDataToJson(EzCardThemeData instance) =>
    <String, dynamic>{
      'clipBehavior': instance.clipBehavior,
      'color': instance.color,
      'elevation': instance.elevation,
      'margin': instance.margin,
    };
