import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:ui';

class EzTranslator {
  static EzTranslator _singleton = new EzTranslator._internal();

  factory EzTranslator() {
    return _singleton;
  }

  EzTranslator._internal();
/*
  EzTranslator(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  static EzTranslator of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }
*/
  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  String text(String key) {
    return _localizedValues[key] ?? '$key';
  }

  static Future<EzTranslator> load(Locale locale) async {
    String jsonContent = await rootBundle
        .loadString("locale/locale_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return _singleton;
  }

  get currentLanguage => locale.languageCode;
}

class TranslationsDelegate extends LocalizationsDelegate<EzTranslator> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'de'].contains(locale.languageCode);

  @override
  Future<EzTranslator> load(Locale locale) => EzTranslator.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
