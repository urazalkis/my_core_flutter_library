import 'package:flutter/material.dart';

import '../../constant/design/color_constant.dart';

class AppThemeLight {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();
  /*ThemeData get theme => ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorConstant.citra),
          ),
        ),
      );*/
  ThemeData theme = ThemeData.light().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorConstant.citra),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
  );
}
