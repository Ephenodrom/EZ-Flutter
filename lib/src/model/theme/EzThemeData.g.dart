// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EzThemeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EzThemeData _$EzThemeDataFromJson(Map<String, dynamic> json) {
  return EzThemeData(
    primaryColor: json['primaryColor'] == null
        ? null
        : EzColor.fromJson(json['primaryColor'] as Map<String, dynamic>),
    scaffoldBackgroundColor: json['scaffoldBackgroundColor'] == null
        ? null
        : EzColor.fromJson(
            json['scaffoldBackgroundColor'] as Map<String, dynamic>),
    cardThemeData: json['cardThemeData'] == null
        ? null
        : EzCardThemeData.fromJson(
            json['cardThemeData'] as Map<String, dynamic>),
    buttonThemeData: json['buttonThemeData'] == null
        ? null
        : EzButtonThemeData.fromJson(
            json['buttonThemeData'] as Map<String, dynamic>),
  )..appBarTheme = json['appBarTheme'] == null
      ? null
      : EzAppBarThemeData.fromJson(json['appBarTheme'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EzThemeDataToJson(EzThemeData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('primaryColor', instance.primaryColor);
  writeNotNull('scaffoldBackgroundColor', instance.scaffoldBackgroundColor);
  writeNotNull('cardThemeData', instance.cardThemeData);
  writeNotNull('buttonThemeData', instance.buttonThemeData);
  writeNotNull('appBarTheme', instance.appBarTheme);
  return val;
}
