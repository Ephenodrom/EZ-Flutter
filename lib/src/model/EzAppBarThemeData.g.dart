// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EzAppBarThemeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EzAppBarThemeData _$EzAppBarThemeDataFromJson(Map<String, dynamic> json) {
  return EzAppBarThemeData(
    brightness: json['brightness'],
    color: json['color'] == null
        ? null
        : EzColor.fromJson(json['color'] as Map<String, dynamic>),
    elevation: (json['elevation'] as num)?.toDouble(),
    actionsIconTheme: json['actionsIconTheme'] == null
        ? null
        : EzIconThemeData.fromJson(
            json['actionsIconTheme'] as Map<String, dynamic>),
    iconTheme: json['iconTheme'] == null
        ? null
        : EzIconThemeData.fromJson(json['iconTheme'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EzAppBarThemeDataToJson(EzAppBarThemeData instance) =>
    <String, dynamic>{
      'brightness': instance.brightness,
      'color': instance.color,
      'elevation': instance.elevation,
      'actionsIconTheme': instance.actionsIconTheme,
      'iconTheme': instance.iconTheme,
    };
