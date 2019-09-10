import 'package:ez_flutter/ez_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// Wrapper for the [Scaffold].
///
/// The [body] of the [Scaffold] is wrapped with [EzGlobalMessageWrapper] to activate the global messaging feature.
///
class EzScaffold extends StatelessWidget {
  EzScaffold(
      {Key key,
      this.body,
      this.appBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.persistentFooterButtons,
      this.backgroundColor,
      this.drawer,
      this.endDrawer,
      this.bottomNavigationBar,
      this.bottomSheet,
      this.resizeToAvoidBottomInset,
      this.primary = true,
      this.drawerDragStartBehavior = DragStartBehavior.start,
      this.extendBody = false,
      this.drawerScrimColor})
      : assert(primary != null),
        assert(extendBody != null),
        assert(drawerDragStartBehavior != null),
        super(key: key);

  /// See [Scaffold.extendBody]
  final bool extendBody;

  /// See [Scaffold.appBar]
  final PreferredSizeWidget appBar;

  /// See [Scaffold.body]
  final Widget body;

  /// See [Scaffold.floatingActionButton]
  final Widget floatingActionButton;

  /// See [Scaffold.floatingActionButtonLocation]
  final FloatingActionButtonLocation floatingActionButtonLocation;

  /// See [Scaffold.floatingActionButtonAnimator]
  final FloatingActionButtonAnimator floatingActionButtonAnimator;

  /// See [Scaffold.persistentFooterButtons]
  final List<Widget> persistentFooterButtons;

  /// See [Scaffold.drawer]
  final Widget drawer;

  /// See [Scaffold.endDrawer]
  final Widget endDrawer;

  /// See [Scaffold.drawerScrimColor]
  final Color drawerScrimColor;

  /// See [Scaffold.bottomNavigationBar]
  final Widget bottomNavigationBar;

  /// See [Scaffold.bottomSheet]
  final Widget bottomSheet;

  /// See [Scaffold.resizeToAvoidBottomInset]
  final bool resizeToAvoidBottomInset;

  /// See [Scaffold.primary]
  final bool primary;

  /// See [Scaffold.drawerDragStartBehavior]
  final DragStartBehavior drawerDragStartBehavior;

  /// See [Scaffold.backgroundColor]
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: EzGlobalMessageWrapper(body),
        backgroundColor: backgroundColor,
        extendBody: extendBody,
        appBar: appBar,
        drawerDragStartBehavior: drawerDragStartBehavior,
        primary: primary,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomSheet: bottomSheet,
        bottomNavigationBar: bottomNavigationBar,
        drawerScrimColor: drawerScrimColor,
        endDrawer: endDrawer,
        drawer: drawer,
        persistentFooterButtons: persistentFooterButtons,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButton: floatingActionButton);
  }
}
