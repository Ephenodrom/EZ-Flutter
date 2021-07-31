import 'package:ez_flutter/ez_flutter.dart';
import 'package:flutter/material.dart';

void main() async => await EzRunner.run(MyHomePage('My App'), 'Ez Flutter App');

class MyHomePage extends StatefulWidget {
  MyHomePage(this.title);

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
      body: Center(
        child: Text('Hello EZ Flutter'),
      ),
    );
  }
}
