import 'package:flutter/material.dart';
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

  String primaryColor;
  String secondaryHeaderColor;
  String textSelectionColor;
  String cursorColor;
  String textSelectionHandleColor;
  String backgroundColor;
  String dialogBackgroundColor;
  String indicatorColor;
  String hintColor;
  String errorColor;
  String toggleableActiveColor;
  String selectedRowColor;
  String unselectedWidgetColor;
  String disabledColor;
  String buttonColor;
  String canvasColor;
  String scaffoldBackgroundColor;
  String bottomAppBarColor;
  String cardColor;
  String dividerColor;
  String focusColor;
  String hoverColor;
  String highlightColor;
  String splashColor;
  String primaryColorLight;
  String primaryColorDark;
  String accentColor;

  ThemeData toThemeData() {
    ThemeData data = ThemeData();
    if (primaryColor != null) {
      data = data.copyWith(primaryColor: Color(int.parse(primaryColor)));
    }
    if (secondaryHeaderColor != null) {
      data = data.copyWith(
          secondaryHeaderColor: Color(int.parse(secondaryHeaderColor)));
    }
    if (textSelectionColor != null) {
      data = data.copyWith(
          textSelectionColor: Color(int.parse(textSelectionColor)));
    }
    if (cursorColor != null) {
      data = data.copyWith(cursorColor: Color(int.parse(cursorColor)));
    }
    if (backgroundColor != null) {
      data = data.copyWith(backgroundColor: Color(int.parse(backgroundColor)));
    }
    if (dialogBackgroundColor != null) {
      data = data.copyWith(
          dialogBackgroundColor: Color(int.parse(dialogBackgroundColor)));
    }
    if (indicatorColor != null) {
      data = data.copyWith(indicatorColor: Color(int.parse(indicatorColor)));
    }
    if (hintColor != null) {
      data = data.copyWith(hintColor: Color(int.parse(hintColor)));
    }
    if (errorColor != null) {
      data = data.copyWith(errorColor: Color(int.parse(errorColor)));
    }
    if (toggleableActiveColor != null) {
      data = data.copyWith(
          toggleableActiveColor: Color(int.parse(toggleableActiveColor)));
    }
    if (selectedRowColor != null) {
      data =
          data.copyWith(selectedRowColor: Color(int.parse(selectedRowColor)));
    }
    if (unselectedWidgetColor != null) {
      data = data.copyWith(
          unselectedWidgetColor: Color(int.parse(unselectedWidgetColor)));
    }
    if (disabledColor != null) {
      data = data.copyWith(disabledColor: Color(int.parse(disabledColor)));
    }
    if (buttonColor != null) {
      data = data.copyWith(buttonColor: Color(int.parse(buttonColor)));
    }
    if (canvasColor != null) {
      data = data.copyWith(canvasColor: Color(int.parse(canvasColor)));
    }

    if (scaffoldBackgroundColor != null) {
      data = data.copyWith(
          scaffoldBackgroundColor: Color(int.parse(scaffoldBackgroundColor)));
    }
    if (bottomAppBarColor != null) {
      data =
          data.copyWith(bottomAppBarColor: Color(int.parse(bottomAppBarColor)));
    }
    if (cardColor != null) {
      data = data.copyWith(cardColor: Color(int.parse(cardColor)));
    }
    if (dividerColor != null) {
      data = data.copyWith(dividerColor: Color(int.parse(dividerColor)));
    }
    if (focusColor != null) {
      data = data.copyWith(focusColor: Color(int.parse(focusColor)));
    }
    if (hoverColor != null) {
      data = data.copyWith(hoverColor: Color(int.parse(hoverColor)));
    }
    if (highlightColor != null) {
      data = data.copyWith(highlightColor: Color(int.parse(highlightColor)));
    }
    if (splashColor != null) {
      data = data.copyWith(splashColor: Color(int.parse(splashColor)));
    }
    if (primaryColorLight != null) {
      data =
          data.copyWith(primaryColorLight: Color(int.parse(primaryColorLight)));
    }
    if (primaryColorDark != null) {
      data =
          data.copyWith(primaryColorDark: Color(int.parse(primaryColorDark)));
    }
    if (accentColor != null) {
      data = data.copyWith(accentColor: Color(int.parse(accentColor)));
    }

    return data;
  }

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
