import 'package:ez_flutter/ez_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:ui';

import 'package:logging/logging.dart';

class EzTranslator {
  static const String TAG = 'EzTranslator';

  EzTranslator(Locale locale) {
    this.locale = locale;
    _localizedValues = <dynamic, dynamic>{};
  }

  static EzTranslator? of(BuildContext context) {
    return Localizations.of<EzTranslator>(context, EzTranslator);
  }

  Locale? locale;
  static Map<dynamic, dynamic>? _localizedValues;

  String text(String key, {Map<String, String>? replace}) {
    if (_localizedValues!.containsKey(key)) {
      var value = _localizedValues![key] as String;
      if (replace != null) {
        replace.forEach(
          (String k, String v) {
            value.replaceAll('\$$k', v);
          },
        );
      }
      return value;
    } else {
      return key;
    }
  }

  static Future<EzTranslator> load(Locale locale) async {
    var translations = EzTranslator(locale);
    try {
      Logger(TAG).info(
          'Try to load translation from locale/locale_${locale.languageCode}.json');
      var jsonContent = await rootBundle
          .loadString('locale/locale_${locale.languageCode}.json');
      _localizedValues = json.decode(jsonContent);
    } catch (e) {
      Logger(TAG).info(
          'Could not load translation from locale/locale_${locale.languageCode}.json!');
    }
    await EzSettings.updateSp('CURRENT_LOCALE', locale.languageCode);
    return translations;
  }

  String get currentLanguage => locale!.languageCode;
}

class EzTranslationsDelegate extends LocalizationsDelegate<EzTranslator> {
  static const String TAG = 'EzTranslationsDelegate';
  List<String> languageCodes = [];
  EzTranslationsDelegate(List<Locale> locales) {
    for (var l in locales) {
      languageCodes.add(l.languageCode);
    }
  }

  @override
  bool isSupported(Locale locale) {
    Logger(TAG).info('Check if $locale is supported by $languageCodes');
    return languageCodes.contains(locale.languageCode);
  }

  @override
  Future<EzTranslator> load(Locale locale) {
    Logger(TAG).info('Load file for ${locale.languageCode}');
    return EzTranslator.load(locale);
  }

  @override
  bool shouldReload(EzTranslationsDelegate old) => false;
}
