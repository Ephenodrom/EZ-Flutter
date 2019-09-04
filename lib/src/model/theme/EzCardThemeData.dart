import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'EzColor.dart';
import 'EzEdgeInsets.dart';

part 'EzCardThemeData.g.dart';

@JsonSerializable()
class EzCardThemeData {
  Clip clipBehavior;
  EzColor color;
  double elevation;
  EzEdgeInsets margin;
  //ShapeBorder shape;

  EzCardThemeData({this.clipBehavior, this.color, this.elevation, this.margin});

  CardTheme toCardTheme() {
    return CardTheme(
      clipBehavior: clipBehavior,
      color: color.toColor(),
      elevation: elevation,
      margin: margin.toEdgeInsets(),
      //shape: shape,
    );
  }

  factory EzCardThemeData.fromJson(Map<String, dynamic> json) =>
      _$EzCardThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$EzCardThemeDataToJson(this);
}
