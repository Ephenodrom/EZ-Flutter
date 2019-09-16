import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Static class to access the different types of settings.
///
/// * Access the EZ Flutter setting via EzSettings.az()
/// * Access your environment settings via EzSettings.env()
/// * Access your application settings via EzSettings.app()
/// * Access your shared preference settings via EzSettings.sp()
/// * Access your external settings via EzSettings.ex()
///
class EzSettings {
  static const String TAG = "EzSettings";
  static const String KEY_EZ_SETTINGS = "ez_settings";
  static const String KEY_ENV_SETTINGS = "env_settings";
  static const String KEY_APP_SETTINGS = "app_settings";
  static const String KEY_SP_SETTINGS = "shared_preferences";
  static const String KEY_EXTERNAL_SETTINGS = "external_settings";
  static const String KEY_EZ_SHARED_PREFERENCES = "ez_shared_preferences";
  static const String PATH_EZ_SETTINGS = "assets/ez_settings.json";

  ///
  /// Return the EZ Flutter settings
  ///
  static Map<String, dynamic> ez() =>
      GlobalConfiguration().get(KEY_EZ_SETTINGS);

  ///
  /// Return the environment settings
  ///
  static Map<String, dynamic> env() =>
      GlobalConfiguration().get(KEY_ENV_SETTINGS);

  ///
  /// Return the application settings
  ///
  static Map<String, dynamic> app() =>
      GlobalConfiguration().get(KEY_APP_SETTINGS);

  ///
  /// Return the shared preferences settings
  ///
  static Map<String, dynamic> sp() =>
      GlobalConfiguration().get(KEY_SP_SETTINGS);

  ///
  /// Update a value in the shared preferences settings
  ///
  static dynamic updateSp(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String persistent = prefs.getString(KEY_EZ_SHARED_PREFERENCES);
     Map<String, dynamic> persistentAsMap;
    if(persistent != null){
       persistentAsMap = json.decode(persistent);
    }else{
      persistentAsMap = {};
    }
    persistentAsMap[key] = value;
    persistent = json.encode(persistentAsMap);
    await prefs.setString(KEY_EZ_SHARED_PREFERENCES, persistent);
    if(GlobalConfiguration().get(KEY_SP_SETTINGS) != null){
      GlobalConfiguration().updateValue(KEY_SP_SETTINGS, persistent);
    } else{
      GlobalConfiguration().addValue(KEY_SP_SETTINGS, persistent);
    }
    return value;
  }

  static init(
      {String envPath,
      String applicationPath,
      String externalUrl,
      Map<String, String> queryParameters,
      Map<String, String> headers}) async {
    try {
      Logger(TAG).info("Try to load configuration from $PATH_EZ_SETTINGS");
      await GlobalConfiguration()
          .loadFromPathIntoKey(PATH_EZ_SETTINGS, KEY_EZ_SETTINGS);
    } catch (e) {
      Logger(TAG).info("Could not load configuration from $PATH_EZ_SETTINGS");
    }
    if (envPath != null) {
      Logger(TAG).info("Try to load configuration from $envPath");
      await GlobalConfiguration()
          .loadFromPathIntoKey(envPath, KEY_ENV_SETTINGS);
    }
    if (applicationPath != null) {
      Logger(TAG).info("Try to load configuration from $applicationPath");
      await GlobalConfiguration()
          .loadFromPathIntoKey(applicationPath, KEY_APP_SETTINGS);
    }
    if (externalUrl != null) {
      Logger(TAG).info("Try to load configuration from external $externalUrl");
      try {
        await GlobalConfiguration().loadFromUrlIntoKey(
            applicationPath, KEY_EXTERNAL_SETTINGS,
            queryParameters: queryParameters, headers: headers);
      } catch (e) {
        Logger(TAG).info(
            "Could not load configuration from $applicationPath because of $e");
      }
    }
    try {
      Logger(TAG).info("Try to load configuration from shared preferences");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String persistent = prefs.getString(KEY_EZ_SHARED_PREFERENCES);
      if (persistent != null) {
        Map<String, dynamic> persistentAsMap = json.decode(persistent);
        GlobalConfiguration().setValue(KEY_SP_SETTINGS, persistentAsMap);
      }
    } catch (e) {
      Logger(TAG).info(
          "Could not load configuration from shared preferences because of $e");
    }
  }
}
