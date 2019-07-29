import 'package:flutter/material.dart';

class EzSpinner extends StatefulWidget {
  EzSpinner({Key key, this.text}) : super(key: key);

  final Text text;

  @override
  _EzSpinnerState createState() => _EzSpinnerState();
}

class _EzSpinnerState extends State<EzSpinner>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: getChildren(),
    ));
  }

  List<Widget> getChildren() {
    List<Widget> children = [];
    children.add(CircularProgressIndicator(key: widget.key));
    if (widget.text != null) {
      children.add(widget.text);
    }
    return children;
  }
}
