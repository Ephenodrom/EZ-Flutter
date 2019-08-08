import 'package:global_configuration/global_configuration.dart';
import 'package:logging/logging.dart';

///
/// Static class to access the different types of settings.
///
/// * Access the EZ Flutter setting via EzSettings.az()
/// * Access your environment settings via EzSettings.env()
/// * Access your application settings via EzSettings.app()
///
class EzSettings {
  static const String TAG = "EzSettings";
  static const String KEY_EZ_SETTINGS = "ez_settings";
  static const String KEY_ENV_SETTINGS = "env_settings";
  static const String KEY_APP_SETTINGS = "app_settings";
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

  static init({String envPath, String applicationPath}) async {
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
  }
}
