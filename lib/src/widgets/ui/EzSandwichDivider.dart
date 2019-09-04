import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// A divider with a text between two lines.
///
/// The text is displayed between the two lines.
/// [pLeft] defines the amount of empty space to the left of each line.
/// [pRight] defines the amount of empty space to the right of each line.
/// [text] is the text to display.
/// [color] is the color of each line.
///
class EzSandwichDivider extends StatelessWidget {
  EzSandwichDivider({
    Key key,
    this.tPLeft = 0.0,
    this.tPRight = 0.0,
    this.bPLeft = 0.0,
    this.bPRight = 0.0,
    this.color,
    this.text,
  }) : super(key: key);

  /// The amount of empty space to the left of the top line.
  final double tPLeft;

  /// The amount of empty space to the right of the top line.
  final double tPRight;

  /// The amount of empty space to the left of the bottom line.
  final double bPLeft;

  /// The amount of empty space to the right of the bottom line.
  final double bPRight;

  /// The color of the line.
  final Color color;

  /// The text to display
  final Text text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(child: Column(children: getChildren(context))),
    );
  }

  List<Widget> getChildren(BuildContext context) {
    List<Widget> list = [];
    list.add(
      Container(
        height: 16,
        margin: EdgeInsetsDirectional.only(start: tPLeft, end: tPRight),
        decoration: BoxDecoration(
          border: Border(
            bottom: createBorderSide(context, color: color),
          ),
        ),
      ),
    );

    if (text != null) {
      list.add(Center(
        child: text,
      ));
    }

    list.add(
      Container(
        height: 16,
        margin: EdgeInsetsDirectional.only(start: bPLeft, end: bPRight),
        decoration: BoxDecoration(
          border: Border(
            top: createBorderSide(context, color: color),
          ),
        ),
      ),
    );

    return list;
  }

  double getBoxHeight(BuildContext context) {
    if (text.style != null) {
      return 32 + text.style.fontSize;
    } else {
      double height = Theme.of(context).textTheme.body1.fontSize;
      return 32 + height;
    }
  }

  BorderSide createBorderSide(BuildContext context,
      {Color color, double width = 0.0}) {
    assert(width != null);
    return BorderSide(
      color: color ?? Theme.of(context).dividerColor,
      width: width,
    );
  }
}
