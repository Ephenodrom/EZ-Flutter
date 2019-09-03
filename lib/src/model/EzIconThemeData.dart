import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'EzColor.dart';

part 'EzIconThemeData.g.dart';

@JsonSerializable()
class EzIconThemeData {
  EzColor color;
  double opacity;
  double size;

  EzIconThemeData({this.color, double opacity, this.size});

  EzIconThemeData.fromIconThemeData(IconThemeData data) {
    color = EzColor.fromColor(data.color);
    opacity = data.opacity;
    size = data.size;
  }

  IconThemeData toIconThemeData() {
    return IconThemeData(color: color.toColor(), opacity: opacity, size: size);
  }

  factory EzIconThemeData.fromJson(Map<String, dynamic> json) =>
      _$EzIconThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$EzIconThemeDataToJson(this);
}
