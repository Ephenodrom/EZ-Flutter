# EZ Flutter (Alpha)

EZ Flutter is a collection of widgets, packages and many more usefull things, mixed up in a little framework. The aim is to make standard features easily available from scratch.

## Table of Contents

1. [Install](#install)
   * [pubspec.yaml](#pubspec.yaml)
2. [Import](#import)
3. [Features](#features)
   * [Global Messaging](#global-messaging)
   * [Automatic Configuration Loading](#automatic-configuration-loading)
   * [Multilanguage Support](#multilanguage-support)
   * [Buildin Customizable Transition Screen](#buildin-customizable-transition-screen)
   * [Buildin Bloc Support](#buildin-bloc-support)
   * [Util Classes](#util-classes)
   * [Manage Theme Via Json](#manage-theme-via-json)
4. [Documentation](#documentation)
5. [Contribution](#contribution)
6. [Used Packages](#used-packages)
7. [Changelog](#changelog)
8. [Copyright and license](#copyright-and-license)

## Install

### pubspec.yaml

Update **pubspec.yaml** and add the following line to your dependencies.

```yaml
dependencies:
  ez_flutter: ^0.3.0
```

Update your **pubspec.yaml** file and add the following assets locations :

```yaml
flutter:
  assets:
   - assets/
   - locale/
```

## Import

Import the package with :

```dart
import 'package:ez_flutter/ez_flutter.dart';
```

## Features

### Global Messaging

Display a message to the user from anywhere inside the app with just one line of code.

### Automatic Configuration Loading

Loading a configuration from multiple json files and make it available everywhere inside the app.

### Multilanguage Support

Build in translation feature that can be used everywhere inside the app.

### Buildin Customizable Transition Screen

EZ Flutter provides a customizable loading screen to switch between to screens after some work is done.

### Buildin Bloc Support

EZ Flutter comes with a Blocprovider to easily handle multiple blocs within the app.

### Util Classes

EZ Flutter integrates the [Basic Utils](https://pub.dev/packages/basic_utils) package and provides many useful helper classes to master different situations.

### Manage Theme Via Json

EZ Flutter offers the possibility to manage themes via json files.

## Documentation

The documentation is located at [ez-flutter.de/docs](https://ez-flutter.de/docs).

## Contribution

You have an idea for some usefull widgets every app needs ? You are facing a bug ? Check out the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## Used Packages

* Logging <https://pub.dev/packages/logging>
* Dart Basic Utils <https://pub.dev/packages/basic_utils>
* Flutter Global Configuration <https://pub.dev/packages/global_configuration>
* RxDart <https://pub.dev/packages/rxdart>
* shared_preferences <https://pub.dev/packages/shared_preferences>

## Changelog

For a detailed changelog, see the [CHANGELOG.md](CHANGELOG.md) file

## Copyright and license

MIT License

Copyright (c) 2019 Ephenodrom

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
