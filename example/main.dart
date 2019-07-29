import 'package:ez_flutter/ez_flutter.dart';
import 'package:flutter/material.dart';

void main() async =>
    await EzRunner.run(MyHomePage(title: 'Flutter Demo Home Page'));

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: EzGlobalMessageWrapper(
          Center(
            child: Text("Hello EZ Flutter"),
          ),
        ));
  }
}
