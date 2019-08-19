import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'EzMaterialThemeData.g.dart';

@JsonSerializable(includeIfNull: false)
class EzMaterialThemeData {
  EzMaterialThemeData({
    this.primaryColor,
    this.secondaryHeaderColor,
    this.textSelectionColor,
    this.cursorColor,
    this.textSelectionHandleColor,
    this.backgroundColor,
    this.dialogBackgroundColor,
    this.indicatorColor,
    this.hintColor,
    this.errorColor,
    this.toggleableActiveColor,
    this.selectedRowColor,
    this.unselectedWidgetColor,
    this.disabledColor,
    this.buttonColor,
    this.canvasColor,
    this.scaffoldBackgroundColor,
    this.bottomAppBarColor,
    this.cardColor,
    this.dividerColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.primaryColorLight,
    this.primaryColorDark,
    this.accentColor,
  });

  Color primaryColor;
  Color secondaryHeaderColor;
  Color textSelectionColor;
  Color cursorColor;
  Color textSelectionHandleColor;
  Color backgroundColor;
  Color dialogBackgroundColor;
  Color indicatorColor;
  Color hintColor;
  Color errorColor;
  Color toggleableActiveColor;
  Color selectedRowColor;
  Color unselectedWidgetColor;
  Color disabledColor;
  Color buttonColor;
  Color canvasColor;
  Color scaffoldBackgroundColor;
  Color bottomAppBarColor;
  Color cardColor;
  Color dividerColor;
  Color focusColor;
  Color hoverColor;
  Color highlightColor;
  Color splashColor;
  Color primaryColorLight;
  Color primaryColorDark;
  Color accentColor;

  /*
   * Json to EzMaterialThemeData object
   */
  factory EzMaterialThemeData.fromJson(Map<String, dynamic> json) =>
      _$EzMaterialThemeDataFromJson(json);

  /*
   * EzMaterialThemeData object to json
   */
  Map<String, dynamic> toJson() => _$EzMaterialThemeDataToJson(this);
}
