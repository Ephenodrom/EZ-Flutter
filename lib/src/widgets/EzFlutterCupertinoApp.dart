import 'package:ez_flutter/ez_flutter.dart';
import 'package:ez_flutter/src/model/EzDynamicTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EzFlutterCupertinoApp extends StatefulWidget {
  Widget app;
  String title;
  List<Locale> locales;
  List<CupertinoThemeData> cupertinoThemes;
  bool displayDebugBadge;
  String initialRoute;
  Map<String, WidgetBuilder> routes;
  Locale locale;

  EzFlutterCupertinoApp(this.app, this.title, this.locales,
      this.cupertinoThemes, this.displayDebugBadge,
      {this.initialRoute, this.routes, this.locale});

  @override
  _EzFlutterCupertinoAppState createState() => _EzFlutterCupertinoAppState();
}

class _EzFlutterCupertinoAppState extends State<EzFlutterCupertinoApp> {
  ThemeData currentTheme;

  @override
  void initState() {
    EzDynamicTheme().cupertinoThemes = widget.cupertinoThemes;
    EzDynamicTheme().addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        initialRoute: widget.initialRoute,
        routes: widget.routes,
        locale: widget.locale,
        title: widget.title,
        theme: EzDynamicTheme().currentCupertinoTheme(),
        localizationsDelegates: [
          EzTranslationsDelegate(widget.locales),
        ],
        supportedLocales: widget.locales,
        debugShowCheckedModeBanner: widget.displayDebugBadge,
        home: widget.app);
  }
}
