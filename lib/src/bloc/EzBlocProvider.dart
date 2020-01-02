import 'package:flutter/material.dart';

import 'EzBlocBase.dart';

class EzBlocProvider<T extends EzBlocBase> extends StatefulWidget {
  EzBlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _EzBlocProviderState<T> createState() => _EzBlocProviderState<T>();

  static T of<T extends EzBlocBase>(BuildContext context) {
    EzBlocProvider<T> provider =
        context.findAncestorWidgetOfExactType<EzBlocProvider<T>>();
    return provider.bloc;
  }
}

class _EzBlocProviderState<T> extends State<EzBlocProvider<EzBlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
