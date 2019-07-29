import 'package:flutter/material.dart';

class EzTransition extends StatefulWidget {
  final Function() process;
  final Widget child;
  EzTransition(this.child, this.process);

  @override
  _EzTransitionState createState() => _EzTransitionState();
}

class _EzTransitionState extends State<EzTransition> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.process);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
