import 'package:flutter/material.dart';

class EzTransition extends StatefulWidget {
  EzTransition(this.child, this.toProcess, {this.backgroundColor});

  final Function() toProcess;
  final Widget child;
  final Color backgroundColor;

  @override
  _EzTransitionState createState() => _EzTransitionState();
}

class _EzTransitionState extends State<EzTransition> {
  @override
  void initState() {
    super.initState();
    widget.toProcess();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getBackgroundColor(),
      child: widget.child,
    );
  }

  Color getBackgroundColor() {
    return widget.backgroundColor == null
        ? Theme.of(context).backgroundColor
        : widget.backgroundColor;
  }
}
