import 'package:ez_flutter/ez_flutter.dart';
import 'package:ez_flutter/src/model/EzDynamicTheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class EzFlutterMaterialApp extends StatefulWidget {
  Widget app;
  String title;
  List<Locale> locales;
  List<ThemeData> materialThemes;
  bool displayDebugBadge;
  String initialRoute;
  Map<String, WidgetBuilder> routes;
  Locale locale;

  EzFlutterMaterialApp(this.app, this.title, this.locales, this.materialThemes,
      this.displayDebugBadge,
      {this.initialRoute, this.routes, this.locale});

  @override
  _EzFlutterMaterialAppState createState() => _EzFlutterMaterialAppState();
}

class _EzFlutterMaterialAppState extends State<EzFlutterMaterialApp> {
  ThemeData currentTheme;

  @override
  void initState() {
    EzDynamicTheme().themes = widget.materialThemes;
    EzDynamicTheme().addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: widget.initialRoute,
        routes: widget.routes,
        locale: widget.locale,
        title: widget.title,
        theme: EzDynamicTheme().currentTheme(),
        localizationsDelegates: [
          EzTranslationsDelegate(widget.locales),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: widget.locales,
        debugShowCheckedModeBanner: widget.displayDebugBadge,
        home: widget.app);
  }
}
