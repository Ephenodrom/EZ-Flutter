import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// Wrapper for the [BottomAppBar] with gradient background.
///
/// The [BottomAppBar] ist wrapped inside a [Container] with [Boxdecoration] and gradient set to the given [Gradient].
/// The [EzGradientBottomAppBar] has the same arguments as the [BottomAppBar].
///
class EzGradientBottomAppBar extends StatelessWidget {
  EzGradientBottomAppBar({
    Key key,
    this.gradient,
    this.color,
    this.elevation,
    this.shape,
    this.clipBehavior = Clip.none,
    this.notchMargin = 4.0,
    this.child,
  })  : assert(clipBehavior != null),
        assert(elevation == null || elevation >= 0.0),
        assert(notchMargin != null),
        super(key: key);

  ///
  /// The [Gradient] for the [BoxDecoration]
  ///
  final Gradient gradient;

  /// See [BottomAppBar.child]
  final Widget child;

  /// See [BottomAppBar.color]
  final Color color;

  /// See [BottomAppBar.elevation]
  final double elevation;

  /// See [BottomAppBar.shape]
  final NotchedShape shape;

  /// See [BottomAppBar.clipBehavior]
  final Clip clipBehavior;

  /// See [BottomAppBar.notchMargin]
  final double notchMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: BottomAppBar(
        child: child,
        clipBehavior: clipBehavior,
        color: color,
        elevation: elevation,
        notchMargin: notchMargin,
        shape: shape,
      ),
    );
  }
}
