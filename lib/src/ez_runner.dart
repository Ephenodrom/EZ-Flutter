import 'package:ez_flutter/src/model/EzSettings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import '../ez_flutter.dart';
import 'bloc/EzBlocBase.dart';
import 'bloc/EzBlocProvider.dart';
import 'bloc/EzGlobalBloc.dart';
import 'bloc/blocs/EzMessageBloc.dart';
import 'bloc/blocs/EzLoadingBloc.dart';
import 'model/EzTranslator.dart';

///
/// The class for starting a EZ Flutter app.
///
/// It calls the runApp method with a [MaterialApp] or [CupertinoApp] adding a [EzTranslationsDelegate]
/// and the [locales] as supported locales.
///
/// [blocs] are custom BLOCs that can be added to the [EzGlobalBloc] to be accessable within the app.
/// [cupertino] defines if the runner should use [CupertinoApp] instead of [MaterialApp].
/// [locales] are the supported languages. The default is 'EN'.
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
///
/// ```dart
/// void main() async =>
///      await EzRunner.run(MyHomePage(title: 'Hello EZ'));
/// ```
///
class EzRunner {
  static Future<void> run(Widget app,
      {Map<Type, EzBlocBase> blocs,
      bool cupertino = false,
      List<Locale> locales = const [Locale('en')],
      String envPath,
      String applicationPath,
      ThemeData materialThemeData,
      CupertinoThemeData cupertinoThemeData,
      String externalUrl,
      Map<String, String> queryParameters,
      Map<String, String> headers,
      String themePath}) async {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
    WidgetsFlutterBinding.ensureInitialized();

    if (themePath != null) {
      materialThemeData = await EzThemeUtils.loadThemeFromPath(themePath);
    }

    Widget wrapper;
    if (cupertino) {
      wrapper = getCupertinoWrapper(app, locales, cupertinoThemeData);
    } else {
      wrapper = getMaterialWrapper(app, locales, materialThemeData);
    }
    if (blocs == null) {
      blocs = {};
    }
    blocs.putIfAbsent(EzMessageBloc, () => EzMessageBloc());
    blocs.putIfAbsent(EzLoadingBloc, () => EzLoadingBloc());
    await EzSettings.init(
        envPath: envPath,
        applicationPath: applicationPath,
        externalUrl: externalUrl,
        queryParameters: queryParameters,
        headers: headers);
    return runApp(buildBlocWrapper(wrapper, blocs));
  }
}

Widget buildBlocWrapper(Widget wrapper, Map<Type, EzBlocBase> blocs) {
  return EzBlocProvider<EzGlobalBloc>(
      bloc: EzGlobalBloc(blocs: blocs), child: wrapper);
}

Widget getMaterialWrapper(
    Widget app, List<Locale> locales, ThemeData materialThemeData) {
  return MaterialApp(
      title: 'Flutter Demo',
      theme: materialThemeData != null
          ? materialThemeData
          : ThemeData(primaryColor: Colors.blue),
      localizationsDelegates: [
        EzTranslationsDelegate(locales),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: locales,
      home: app);
}

Widget getCupertinoWrapper(
    Widget app, List<Locale> locales, CupertinoThemeData cupertinoThemeData) {
  return CupertinoApp(
      title: 'Flutter Demo',
      theme: cupertinoThemeData != null
          ? cupertinoThemeData
          : CupertinoThemeData(primaryColor: Colors.blue),
      localizationsDelegates: [
        EzTranslationsDelegate(locales),
      ],
      supportedLocales: locales,
      home: app);
}
