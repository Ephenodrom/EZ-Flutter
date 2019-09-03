import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'EzColor.dart';
import 'EzIconThemeData.dart';

part 'EzAppBarThemeData.g.dart';

@JsonSerializable()
class EzAppBarThemeData {
  Brightness brightness;
  EzColor color;
  double elevation;
  EzIconThemeData actionsIconTheme;
  EzIconThemeData iconTheme;
  //TextTheme textTheme;

  EzAppBarThemeData({
    this.brightness,
    this.color,
    this.elevation,
    this.actionsIconTheme,
    this.iconTheme,
    //this.textTheme,
  });

  AppBarTheme toAppBarTheme() {
    return AppBarTheme(
      color: color.toColor(),
      elevation: elevation,
      brightness: brightness,
      actionsIconTheme: actionsIconTheme.toIconThemeData(),
      iconTheme: iconTheme.toIconThemeData(),
      //textTheme: textTheme,
    );
  }

  EzAppBarThemeData.fromAppBarTheme(AppBarTheme theme) {
    color = EzColor.fromColor(theme.color);
    elevation = theme.elevation;
    brightness = theme.brightness;
    actionsIconTheme =
        EzIconThemeData.fromIconThemeData(theme.actionsIconTheme);
    iconTheme = EzIconThemeData.fromIconThemeData(theme.iconTheme);
    //textTheme = theme.textTheme;
  }

  factory EzAppBarThemeData.fromJson(Map<String, dynamic> json) =>
      _$EzAppBarThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$EzAppBarThemeDataToJson(this);
}
