# Blocs

EZ Flutter supports managing different configuration files that can be accessed inside the app.

## Table of Contents

1. [Basics](#basics)
2. [Usage](#usage)
   * [EZ settings](#ez-settings)
   * [Environment settings](#environment-settings)
   * [Application settings](#application-settings)
   * [Accessing the settings](#accessing-the-settings)

## Basics

The [EzRunner](/lib/src/ez_runner.dart) loads different configuration files at startup.

> Remember to add the **assets** folder to your pubspec.yaml file!

## Usage

### EZ settings

The [EzRunner](/lib/src/ez_runner.dart) loads automatically a json file with the name ez_settings.json from the assets directory.

The ez_settings.json should only contain configuration that refers to the EZ Framework.

[EzSettingsKeys](/lib/src/model/EzSettingsKeys.dart) defines all settings available for the EZ Framework.

### Environment settings

If **envPath** is set as an argument in the **run** method of the [EzRunner](/lib/src/ez_runner.dart), it loads the the configuration and it can be accessed via [EzSettings](/lib/src/model/EzSettings.dart) **env()** method.

```dart
EzRunner.run(CustomWidget() ,
      envPath: "assets/env_dev.json");
```

The environment .json file should contain configuration depending on the current environment the app is running.

### Application settings

The [EzRunner](/lib/src/ez_runner.dart) will load the configurationf from the **applicationPath** and make it available via the **app()** method of the [EzSettings](/lib/src/model/EzSettings.dart).

```dart
EzRunner.run(CustomWidget(),
      applicationPath: "assets/application.json");
```

### Accessing the settings

The settings can be accessed via the [EzSettings](/lib/src/model/EzSettings.dart) class.

```dart
Map<String, dynamic> ezSettings = EzSettings.ez();
Map<String, dynamic> envSettings = EzSettings.env();
Map<String, dynamic> appSettings = EzSettings.app();
```
