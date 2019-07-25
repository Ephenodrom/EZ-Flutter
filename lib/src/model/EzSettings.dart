import 'package:global_configuration/global_configuration.dart';

class EzSettings {
  static const String KEY_APP_SETTINGS = "app_settings";
  static const String KEY_ENV_SETTINGS = "env_settings";
  static const String KEY_CUSTOM_SETTINGS = "custom_settings";
  static const String PATH_APP_SETTINGS = "assets/application.json";

  static Map<String, dynamic> app() =>
      GlobalConfiguration().get(KEY_APP_SETTINGS);

  static Map<String, dynamic> env() =>
      GlobalConfiguration().get(KEY_ENV_SETTINGS);

  static Map<String, dynamic> custom() =>
      GlobalConfiguration().get(KEY_CUSTOM_SETTINGS);

  static init({String envPath, String customPath}) async {
    await GlobalConfiguration()
        .loadFromPathIntoKey(PATH_APP_SETTINGS, KEY_APP_SETTINGS);
    if (envPath != null) {
      await GlobalConfiguration()
          .loadFromPathIntoKey(envPath, KEY_ENV_SETTINGS);
    }
    if (customPath != null) {
      await GlobalConfiguration()
          .loadFromPathIntoKey(customPath, KEY_CUSTOM_SETTINGS);
    }
  }
}
