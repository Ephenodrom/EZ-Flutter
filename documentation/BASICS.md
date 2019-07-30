# Basics

EZ Flutter is a collection of widgets, packages and many more usefull things, mixed up in little framework. The aim is to make standard features available from scratch.

## Table of Contents

1. [Before you start](#before-you-start)
2. [Start an EZ Flutter aPP](#start-an-ez-flutter-app)
   * [Running the application with default settings](#running-the-application-with-default-settings)
   * [Arguments of the run method](#arguments-of-the-run-method)

## Before you start

* All widgets and model classes from the EZ Flutter framework start with "Ez" to easily identify them.

## Start an EZ Flutter app

To start an EZ Flutter APP, use the **run** method of the [EzRunner](/lib/src/ez_runner.dart).

```dart
  void main() => EzRunner.run(MyHomePage(title: 'Hello EZ'));
```

The [EzRunner](/lib/src/ez_runner.dart) calls the runApp method with a **MaterialApp** or **CupertinoApp**.

### Running the application with default settings

Running a EZ Flutter app with default settings will do the following steps :

* Load the EZ Flutter settings stored in the ez_settings.json file
* Add EN as a supported language
* Run a MaterialApp
* Use the default values of ThemeData

### Arguments of the run method

* **blocs** are custom BLOCs that can be added to the [EzGlobalBloc](/lib/src/bloc/EzGlobalBloc.dart) to be accessable within the app.
* **cupertino** defines if the runner should use **CupertinoApp** instead of **MaterialApp**.
* **locales** are the supported languages. The default is 'EN'.
* **envPath** is the path for the environment configuration.
* **applicationPath** is the path for your application configuration.
* **materialThemeData** the material theme data to add to the **MaterialApp**
* **cupertinoThemeData** the material theme data to add to the **CupertinoApp**
