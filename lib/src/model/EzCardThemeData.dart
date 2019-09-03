import 'package:flutter/material.dart';
import 'EzColor.dart';
import 'EzEdgeInsets.dart';

class EzCardThemeData {
  Clip clipBehavior;
  EzColor color;
  double elevation;
  EzEdgeInsets margin;
  ShapeBorder shape;

  EzCardThemeData(
      {this.clipBehavior, this.color, this.elevation, this.margin, this.shape});

  CardTheme toCardTheme() {
    return CardTheme(
      clipBehavior: clipBehavior,
      color: color.toColor(),
      elevation: elevation,
      margin: margin.toEdgeInsets(),
      shape: shape,
    );
  }
}
