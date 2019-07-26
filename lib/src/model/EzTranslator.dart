import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:ui';

import 'package:logging/logging.dart';

class EzTranslator {
  EzTranslator(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  static EzTranslator of(BuildContext context) {
    return Localizations.of<EzTranslator>(context, EzTranslator);
  }

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  String text(String key) {
    return _localizedValues[key] ?? '$key';
  }

  static Future<EzTranslator> load(Locale locale) async {
    EzTranslator translations = new EzTranslator(locale);
    String jsonContent = await rootBundle
        .loadString("locale/locale_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;
}

class EzTranslationsDelegate extends LocalizationsDelegate<EzTranslator> {
  static const String TAG = "EzTranslationsDelegate";
  List<String> languageCodes;
  EzTranslationsDelegate(List<Locale> locales) {
    languageCodes = [];
    for (Locale l in locales) {
      languageCodes.add(l.languageCode);
    }
  }

  @override
  bool isSupported(Locale locale) {
    Logger(TAG).info("Check if $locale is supported by $languageCodes");
    return languageCodes.contains(locale.languageCode);
  }

  @override
  Future<EzTranslator> load(Locale locale) {
    Logger(TAG).info("Load file for ${locale.languageCode}");
    return EzTranslator.load(locale);
  }

  @override
  bool shouldReload(EzTranslationsDelegate old) => false;
}
