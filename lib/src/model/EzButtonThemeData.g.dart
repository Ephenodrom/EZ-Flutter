// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EzButtonThemeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EzButtonThemeData _$EzButtonThemeDataFromJson(Map<String, dynamic> json) {
  return EzButtonThemeData(
    buttonColor: json['buttonColor'] == null
        ? null
        : EzColor.fromJson(json['buttonColor'] as Map<String, dynamic>),
    disabledColor: json['disabledColor'] == null
        ? null
        : EzColor.fromJson(json['disabledColor'] as Map<String, dynamic>),
    focusColor: json['focusColor'] == null
        ? null
        : EzColor.fromJson(json['focusColor'] as Map<String, dynamic>),
    highlightColor: json['highlightColor'] == null
        ? null
        : EzColor.fromJson(json['highlightColor'] as Map<String, dynamic>),
    hoverColor: json['hoverColor'] == null
        ? null
        : EzColor.fromJson(json['hoverColor'] as Map<String, dynamic>),
    splashColor: json['splashColor'] == null
        ? null
        : EzColor.fromJson(json['splashColor'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EzButtonThemeDataToJson(EzButtonThemeData instance) =>
    <String, dynamic>{
      'buttonColor': instance.buttonColor,
      'focusColor': instance.focusColor,
      'highlightColor': instance.highlightColor,
      'hoverColor': instance.hoverColor,
      'splashColor': instance.splashColor,
      'disabledColor': instance.disabledColor,
    };
