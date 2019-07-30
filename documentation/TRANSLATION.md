# Translation

EZ Flutter supports the usage of multiple languages for a app.

## Table of Contents

1. [Basics](#basics)
2. [Usage](#start-an-ez-flutter-app)
   * [Define supported languages](#define-supported-languages)
   * [Access translation](#access-translation)

## Basics

Translation is handled by different **.json** files that contain the translation for each language supported by the app. The translation files are automatically loaded by the [EzRunner](/lib/src/ez_runner.dart) at startup.

Create a **.json** file with the pattern **locale_$loacle.json** under the locale folder for each supported language.

> Remember to add the **locale** folder to your pubspec.yaml file!

Example: locale_en.json && locale_de.json

```json
//locale_en.json
{
  "some_message": "This is some message!"
}
//locale_de.json
{
  "some_message": "Dies ist eine Nachricht!"
}
```

## Usage

### Define supported languages

Add all supported locales to the [EzRunner](/lib/src/ez_runner.dart) at startup.

```dart
EzRunner.run(CustomWidget(), [Locale('en'), Locale('de'), Locale('en')]);
```

### Access translation

Access the translation within your app via the [EzTranslator](/lib/src/model/EzTranslator.dart).

```dart
EzTranslator.of(context).text("some_message");
```
