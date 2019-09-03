// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EzIconThemeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EzIconThemeData _$EzIconThemeDataFromJson(Map<String, dynamic> json) {
  return EzIconThemeData(
    color: json['color'] == null
        ? null
        : EzColor.fromJson(json['color'] as Map<String, dynamic>),
    opacity: (json['opacity'] as num)?.toDouble(),
    size: (json['size'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$EzIconThemeDataToJson(EzIconThemeData instance) =>
    <String, dynamic>{
      'color': instance.color,
      'opacity': instance.opacity,
      'size': instance.size,
    };
