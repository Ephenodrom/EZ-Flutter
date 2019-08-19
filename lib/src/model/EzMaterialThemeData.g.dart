// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EzMaterialThemeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EzMaterialThemeData _$EzMaterialThemeDataFromJson(Map<String, dynamic> json) {
  return EzMaterialThemeData(
    primaryColor: json['primaryColor'],
    secondaryHeaderColor: json['secondaryHeaderColor'],
    textSelectionColor: json['textSelectionColor'],
    cursorColor: json['cursorColor'],
    textSelectionHandleColor: json['textSelectionHandleColor'],
    backgroundColor: json['backgroundColor'],
    dialogBackgroundColor: json['dialogBackgroundColor'],
    indicatorColor: json['indicatorColor'],
    hintColor: json['hintColor'],
    errorColor: json['errorColor'],
    toggleableActiveColor: json['toggleableActiveColor'],
    selectedRowColor: json['selectedRowColor'],
    unselectedWidgetColor: json['unselectedWidgetColor'],
    disabledColor: json['disabledColor'],
    buttonColor: json['buttonColor'],
    canvasColor: json['canvasColor'],
    scaffoldBackgroundColor: json['scaffoldBackgroundColor'],
    bottomAppBarColor: json['bottomAppBarColor'],
    cardColor: json['cardColor'],
    dividerColor: json['dividerColor'],
    focusColor: json['focusColor'],
    hoverColor: json['hoverColor'],
    highlightColor: json['highlightColor'],
    splashColor: json['splashColor'],
    primaryColorLight: json['primaryColorLight'],
    primaryColorDark: json['primaryColorDark'],
    accentColor: json['accentColor'],
  );
}

Map<String, dynamic> _$EzMaterialThemeDataToJson(EzMaterialThemeData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('primaryColor', instance.primaryColor);
  writeNotNull('secondaryHeaderColor', instance.secondaryHeaderColor);
  writeNotNull('textSelectionColor', instance.textSelectionColor);
  writeNotNull('cursorColor', instance.cursorColor);
  writeNotNull('textSelectionHandleColor', instance.textSelectionHandleColor);
  writeNotNull('backgroundColor', instance.backgroundColor);
  writeNotNull('dialogBackgroundColor', instance.dialogBackgroundColor);
  writeNotNull('indicatorColor', instance.indicatorColor);
  writeNotNull('hintColor', instance.hintColor);
  writeNotNull('errorColor', instance.errorColor);
  writeNotNull('toggleableActiveColor', instance.toggleableActiveColor);
  writeNotNull('selectedRowColor', instance.selectedRowColor);
  writeNotNull('unselectedWidgetColor', instance.unselectedWidgetColor);
  writeNotNull('disabledColor', instance.disabledColor);
  writeNotNull('buttonColor', instance.buttonColor);
  writeNotNull('canvasColor', instance.canvasColor);
  writeNotNull('scaffoldBackgroundColor', instance.scaffoldBackgroundColor);
  writeNotNull('bottomAppBarColor', instance.bottomAppBarColor);
  writeNotNull('cardColor', instance.cardColor);
  writeNotNull('dividerColor', instance.dividerColor);
  writeNotNull('focusColor', instance.focusColor);
  writeNotNull('hoverColor', instance.hoverColor);
  writeNotNull('highlightColor', instance.highlightColor);
  writeNotNull('splashColor', instance.splashColor);
  writeNotNull('primaryColorLight', instance.primaryColorLight);
  writeNotNull('primaryColorDark', instance.primaryColorDark);
  writeNotNull('accentColor', instance.accentColor);
  return val;
}
