import 'package:ez_flutter/src/model/EzSettings.dart';
import 'package:ez_flutter/src/widgets/EzFlutterCupertinoApp.dart';
import 'package:ez_flutter/src/widgets/EzFlutterMaterialApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import '../ez_flutter.dart';
import 'model/EzTranslator.dart';

///
/// The class for starting a EZ Flutter app.
///
/// It calls the runApp method with a [MaterialApp] or [CupertinoApp] adding a [EzTranslationsDelegate]
/// and the [locales] as supported locales.
///
/// [title] is the title of the app.
/// [blocs] are custom BLOCs that can be added to the [EzGlobalBloc] to be accessable within the app.
/// [cupertino] defines if the runner should use [CupertinoApp] instead of [MaterialApp].
/// [locales] are the supported languages. The default is 'EN'.
/// [initialRoute] initial application route.
/// [routes] The application's top-level routing table.
/// [locale] The appilcation locale.
/// [envPath] is the path for the environment configuration.
/// [applicationPath] is the path for your application configuration.
/// [externalUrl] is the url for external configuration.
/// [queryParameters] are the queryParameters to use while fetching the external configuration.
/// [headers] are the headers to use while fetching the external configuration.
/// [materialThemeData] the material theme data to add to the [MaterialApp]
/// [cupertinoThemeData] the material theme data to add to the [CupertinoApp]
///
/// Running the application with default settings.
/// * It will only load the EZ Flutter settings stored in the assets/ez_settings.json file
/// * It will only support EN as a language for translation
/// * It will run a MaterialApp
/// * It will use the default values of ThemeData
/// * It will only add the default blocs from EZ Flutter to the [EzGlobalBloc]
///
/// ```dart
/// void main() async =>
///      await EzRunner.run(MyHomePage(), "EZ Flutter App");
/// ```
///
class EzRunner {
  static Future<void> run(
    Widget app,
    String title, {
    String? initialRoute,
    Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{},
    Locale? locale,
    bool cupertino = false,
    List<Locale> locales = const [Locale('en')],
    String? envPath,
    String? applicationPath,
    ThemeData? materialThemeData,
    CupertinoThemeData? cupertinoThemeData,
    String? externalUrl,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    bool displayDebugBadge = true,
    List<ThemeData>? materialThemes,
    List<CupertinoThemeData>? cupertinoThemes,
  }) async {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
    WidgetsFlutterBinding.ensureInitialized();

    await EzSettings.init(
        envPath: envPath,
        applicationPath: applicationPath,
        externalUrl: externalUrl,
        queryParameters: queryParameters,
        headers: headers);

    Widget wrapper;
    if (cupertino) {
      wrapper = getCupertinoWrapper(
        app,
        title,
        locales,
        displayDebugBadge,
        initialRoute: initialRoute,
        routes: routes,
        locale: locale,
        cupertinoThemeData: cupertinoThemeData,
      );
    } else {
      wrapper = getMaterialWrapper(
        app,
        title,
        locales,
        displayDebugBadge,
        initialRoute: initialRoute,
        routes: routes,
        locale: locale,
        materialThemes: materialThemes,
        materialThemeData: materialThemeData,
      );
    }

    return runApp(wrapper);
  }
}

Widget getMaterialWrapper(
    Widget app, String title, List<Locale> locales, bool displayDebugBadge,
    {String? initialRoute,
    Map<String, WidgetBuilder>? routes,
    Locale? locale,
    List<ThemeData>? materialThemes,
    ThemeData? materialThemeData}) {
  List<ThemeData> themes;
  if (materialThemes == null) {
    themes = [
      materialThemeData ?? ThemeData(),
    ];
  } else {
    themes = materialThemes;
  }
  return EzFlutterMaterialApp(
    app,
    title,
    locales,
    themes,
    displayDebugBadge,
    initialRoute: initialRoute,
    routes: routes,
    locale: locale,
  );
}

Widget getCupertinoWrapper(
    Widget app, String title, List<Locale> locales, bool displayDebugBadge,
    {String? initialRoute,
    CupertinoThemeData? cupertinoThemeData,
    Map<String, WidgetBuilder>? routes,
    Locale? locale,
    List<CupertinoThemeData>? cupertinoThemes}) {
  List<CupertinoThemeData> themes;
  if (cupertinoThemes == null) {
    themes = [cupertinoThemeData ?? CupertinoThemeData()];
  } else {
    themes = cupertinoThemes;
  }
  return EzFlutterCupertinoApp(
    app,
    title,
    locales,
    themes,
    displayDebugBadge,
    initialRoute: initialRoute,
    routes: routes,
    locale: locale,
  );
}
