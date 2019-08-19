import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// Wrapper for the [AppBar] with gradient background.
///
/// The [AppBar] ist wrapped inside a [Container] with [Boxdecoration] and gradient set to the given [Gradient].
/// The [EzGradientAppBar] has the same arguments as the [AppBar].
///
class EzGradientAppBar extends StatelessWidget {
  EzGradientAppBar({
    Key key,
    this.gradient,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shape,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
  })  : assert(automaticallyImplyLeading != null),
        assert(elevation == null || elevation >= 0.0),
        assert(primary != null),
        assert(titleSpacing != null),
        assert(toolbarOpacity != null),
        assert(bottomOpacity != null),
        preferredSize = Size.fromHeight(
            kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  ///
  /// The [Gradient] for the [BoxDecoration]
  ///
  final Gradient gradient;

  /// See [AppBar.leading]
  final Widget leading;

  /// See [AppBar.automaticallyImplyLeading]
  final bool automaticallyImplyLeading;

  /// See [AppBar.title]
  final Widget title;

  /// See [AppBar.actions]
  final List<Widget> actions;

  /// See [AppBar.flexibleSpace]
  final Widget flexibleSpace;

  /// See [AppBar.bottom]
  final PreferredSizeWidget bottom;

  /// See [AppBar.elevation]
  final double elevation;

  /// See [AppBar.shape]
  final ShapeBorder shape;

  /// See [AppBar.backgroundColor]
  final Color backgroundColor;

  /// See [AppBar.brightness]
  final Brightness brightness;

  /// See [AppBar.iconTheme]
  final IconThemeData iconTheme;

  /// See [AppBar.actionsIconTheme]
  final IconThemeData actionsIconTheme;

  /// See [AppBar.textTheme]
  final TextTheme textTheme;

  /// See [AppBar.primary]
  final bool primary;

  /// See [AppBar.centerTitle]
  final bool centerTitle;

  /// See [AppBar.titleSpacing]
  final double titleSpacing;

  /// See [AppBar.toolbarOpacity]
  final double toolbarOpacity;

  /// See [AppBar.bottomOpacity]
  final double bottomOpacity;

  /// See [AppBar.preferredSize]
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(gradient: gradient),
      child: AppBar(
        key: key,
        actions: actions,
        actionsIconTheme: actionsIconTheme,
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: backgroundColor,
        bottom: bottom,
        bottomOpacity: bottomOpacity,
        brightness: brightness,
        centerTitle: centerTitle,
        elevation: elevation,
        flexibleSpace: flexibleSpace,
        iconTheme: iconTheme,
        leading: leading,
        primary: primary,
        shape: shape,
        textTheme: textTheme,
        title: title,
        titleSpacing: titleSpacing,
        toolbarOpacity: toolbarOpacity,
      ),
    );
  }
}
