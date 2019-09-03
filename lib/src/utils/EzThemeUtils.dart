import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class EzThemeUtils {
  static ThemeData getDefaultLightTheme() {
    return ThemeData(
        primaryColor: Colors.blue,
        buttonColor: Color(ColorUtils.hexToInt("#E0E0E0")),
        focusColor: Color(ColorUtils.hexToInt("#E0E0E0")),
        highlightColor: Color(ColorUtils.hexToInt("#999999")),
        hoverColor: Color(ColorUtils.hexToInt("#F5F5F5")),
        splashColor: Color(ColorUtils.hexToInt("#999999")),
        disabledColor: Color(ColorUtils.hexToInt("#9E9E9E")),
        scaffoldBackgroundColor: Colors.grey[50],
        dividerTheme: getDefaultLightDividerThemeData(),
        cardTheme: getDefaultLightCardTheme(),
        buttonTheme: getDefaultLightButtonThemeData(),
        appBarTheme: getDefaultLightAppBarTheme());
  }

  static DividerThemeData getDefaultLightDividerThemeData() {
    return DividerThemeData(
        color: const Color(0x1F000000),
        endIndent: 0,
        indent: 0,
        space: 0,
        thickness: 1);
  }

  static AppBarTheme getDefaultLightAppBarTheme() {
    return AppBarTheme(
        brightness: Brightness.light,
        color: Colors.blue,
        elevation: 4,
        textTheme: Typography(platform: TargetPlatform.android).black,
        actionsIconTheme: const IconThemeData(color: Colors.black),
        iconTheme: const IconThemeData(color: Colors.black));
  }

  static ButtonThemeData getDefaultLightButtonThemeData() {
    return ButtonThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
        alignedDropdown: false,
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        minWidth: 88,
        colorScheme: ColorScheme.fromSwatch(),
        layoutBehavior: ButtonBarLayoutBehavior.padded,
        materialTapTargetSize: null,
        textTheme: ButtonTextTheme.normal);
  }

  static CardTheme getDefaultLightCardTheme() {
    return CardTheme(
      clipBehavior: Clip.none,
      color: Colors.white,
      elevation: 1,
      margin: EdgeInsets.all(4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
  }
}
