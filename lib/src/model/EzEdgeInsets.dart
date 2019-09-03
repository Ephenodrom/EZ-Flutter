import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'EzEdgeInsets.g.dart';

@JsonSerializable()
class EzEdgeInsets {
  double bottom;
  double left;
  double right;
  double top;

  EzEdgeInsets({
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
    this.top = 0,
  });

  EzEdgeInsets.all(double value) {
    this.bottom = value;
    this.left = value;
    this.right = value;
    this.top = value;
  }

  EdgeInsets toEdgeInsets() {
    return EdgeInsets.only(bottom: bottom, left: left, right: right, top: top);
  }

  EzEdgeInsets.fromEdgeInsets(EdgeInsets geometry) {
    this.bottom = geometry.bottom;
    this.left = geometry.left;
    this.right = geometry.right;
    this.top = geometry.top;
  }

  factory EzEdgeInsets.fromJson(Map<String, dynamic> json) =>
      _$EzEdgeInsetsFromJson(json);

  Map<String, dynamic> toJson() => _$EzEdgeInsetsToJson(this);
}
