import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// A divider with a text.
///
/// The text is displayed in the middle of the divider.
/// [pLeft] defines the amount of empty space to the left of the divider.
/// [pRight] defines the amount of empty space to the right of the divider.
/// [text] is the text to display.
/// [color] is the color of the divider.
/// [textBackgroundColor] is the backgroundcolor of the text. It is recommended to use the same backgroundcolor as the parent widget.
/// The default ist the scaffold background color.
///
class EzDivider extends StatelessWidget {
  EzDivider({
    Key key,
    this.pLeft = 0.0,
    this.pRight = 0.0,
    this.color,
    this.text,
    this.textBackgroundColor,
  }) : super(key: key);

  /// The amount of empty space to the left of the divider.
  final double pLeft;

  /// The amount of empty space to the right of the divider.
  final double pRight;

  /// The color of the line.
  final Color color;

  /// The background color of the text. The default ist the scaffold background color.
  final Color textBackgroundColor;

  /// The text to display
  final Text text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getBoxHeight(context),
      child: Center(child: Stack(children: getChildren(context))),
    );
  }

  List<Widget> getChildren(BuildContext context) {
    List<Widget> list = [];
    list.add(
      Container(
        height: getHeight(context),
        margin: EdgeInsetsDirectional.only(start: pLeft, end: pRight),
        decoration: BoxDecoration(
          border: Border(
            bottom: createBorderSide(context, color: color),
          ),
        ),
      ),
    );

    if (text != null) {
      list.add(
        Center(
          child: Container(
            color: textBackgroundColor == null
                ? Theme.of(context).scaffoldBackgroundColor
                : textBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: text,
            ),
          ),
        ),
      );
    }

    return list;
  }

  double getHeight(BuildContext context) {
    if (text.style != null) {
      return text.style.fontSize / 2;
    } else {
      double height = Theme.of(context).textTheme.bodyText2.fontSize;
      return height / 2;
    }
  }

  double getBoxHeight(BuildContext context) {
    if (text.style != null) {
      return text.style.fontSize;
    } else {
      double height = Theme.of(context).textTheme.bodyText2.fontSize;
      return height;
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
