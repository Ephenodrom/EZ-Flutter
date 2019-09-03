import 'package:json_annotation/json_annotation.dart';
import 'EzColor.dart';

part 'EzButtonThemeData.g.dart';

@JsonSerializable()
class EzButtonThemeData {
  EzColor buttonColor;
  EzColor focusColor;
  EzColor highlightColor;
  EzColor hoverColor;
  EzColor splashColor;
  EzColor disabledColor;

  EzButtonThemeData(
      {this.buttonColor,
      this.disabledColor,
      this.focusColor,
      this.highlightColor,
      this.hoverColor,
      this.splashColor});

  factory EzButtonThemeData.fromJson(Map<String, dynamic> json) =>
      _$EzButtonThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$EzButtonThemeDataToJson(this);
}
