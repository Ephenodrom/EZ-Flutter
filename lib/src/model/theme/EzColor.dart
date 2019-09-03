import 'dart:ui';

import 'package:basic_utils/basic_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'EzColor.g.dart';

@JsonSerializable()
class EzColor {
  String hex;

  EzColor(this.hex);

  Color toColor() {
    return Color(ColorUtils.hexToInt(hex));
  }

  EzColor.fromColor(Color color) {
    this.hex = "#" + color.value.toRadixString(16).substring(2);
  }

  factory EzColor.fromJson(Map<String, dynamic> json) =>
      _$EzColorFromJson(json);

  Map<String, dynamic> toJson() => _$EzColorToJson(this);
}
