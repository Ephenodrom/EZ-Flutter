import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ez_flutter_model.dart';

class EzDynamicTheme extends ChangeNotifier {
  static EzDynamicTheme _singleton = EzDynamicTheme._internal();

  factory EzDynamicTheme() {
    return _singleton;
  }

  EzDynamicTheme._internal();

  List<ThemeData> themes = [];
  List<CupertinoThemeData> cupertinoThemes = [];

  int currentThemeIndex = 0;

  Future<void> setTheme(int index) async {
    currentThemeIndex = index;
    await EzSettings.updateSp(EzSettingsKeys.KEY_EZ_CURRENT_THEME, index);
    notifyListeners();
  }

  ThemeData currentTheme() {
    return themes.elementAt(currentThemeIndex);
  }

  CupertinoThemeData currentCupertinoTheme() {
    return cupertinoThemes.elementAt(currentThemeIndex);
  }
}
