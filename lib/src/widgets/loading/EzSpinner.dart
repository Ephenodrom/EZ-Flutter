import 'package:flutter/material.dart';

///
/// A normal spinner with some text.
///
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: getChildren(),
    ));
  }

  List<Widget> getChildren() {
    List<Widget> children = [];
    children.add(CircularProgressIndicator(key: widget.key));
    if (widget.text != null) {
      children.add(Padding(
          padding: EdgeInsets.symmetric(vertical: 8), child: widget.text));
    }
    return children;
  }
}
