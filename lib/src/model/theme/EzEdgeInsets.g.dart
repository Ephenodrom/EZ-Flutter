// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EzEdgeInsets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EzEdgeInsets _$EzEdgeInsetsFromJson(Map<String, dynamic> json) {
  return EzEdgeInsets(
    bottom: (json['bottom'] as num)?.toDouble(),
    left: (json['left'] as num)?.toDouble(),
    right: (json['right'] as num)?.toDouble(),
    top: (json['top'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$EzEdgeInsetsToJson(EzEdgeInsets instance) =>
    <String, dynamic>{
      'bottom': instance.bottom,
      'left': instance.left,
      'right': instance.right,
      'top': instance.top,
    };
