import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

import 'ez_flutter_model.dart';

///
/// EzDynamicTheme handles multiple themes at once and defines which theme to use. See the [EzRunner] class on how to setup multiple themes within the [EzRunner.run()] method.
///
class EzDynamicTheme extends ChangeNotifier {
  static EzDynamicTheme _singleton = EzDynamicTheme._internal();

  factory EzDynamicTheme() {
    return _singleton;
  }

  EzDynamicTheme._internal() {
    Logger(TAG).info("Initialise EzDynamicTheme");
    if (EzSettings.sp() != null) {
      if (EzSettings.sp().containsKey(EzSettingsKeys.KEY_EZ_CURRENT_THEME)) {
        currentThemeIndex =
            EzSettings.sp()[EzSettingsKeys.KEY_EZ_CURRENT_THEME];
        Logger(TAG).info("Set current theme to $currentThemeIndex");
      }
    } else {
      Logger(TAG).info("First start, use theme index 0");
    }
  }

  static const String TAG = "EzDynamicTheme";

  ///
  /// The material themes
  ///
  List<ThemeData> themes = [];

  ///
  /// The cupertino themes
  ///
  List<CupertinoThemeData> cupertinoThemes = [];

  ///
  /// The current theme
  ///
  int currentThemeIndex = 0;

  ///
  /// Set the theme to use by giving the [index] to use. This will notify the app to automatically switch the theme and will persist the current theme to use in the shared perferences.
  ///
  Future<void> setTheme(int index) async {
    Logger(TAG).info("Set theme index to $index");
    currentThemeIndex = index;
    await EzSettings.updateSp(EzSettingsKeys.KEY_EZ_CURRENT_THEME, index);
    notifyListeners();
  }

  ///
  /// Returns the current material theme
  ///
  ThemeData currentTheme() {
    return themes.elementAt(currentThemeIndex);
  }

  ///
  /// Returns the current cupertino theme
  ///
  CupertinoThemeData currentCupertinoTheme() {
    return cupertinoThemes.elementAt(currentThemeIndex);
  }
}
