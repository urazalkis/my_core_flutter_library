import 'package:flutter/material.dart';

import '../../constant/design/color_constant.dart';

class AppThemeDark {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    _instance ??= AppThemeDark._init();
    return _instance!;
  }

  AppThemeDark._init();
  ThemeData theme = ThemeData.dark().copyWith(
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorConstant.citra),
      ),
    ),
  );
}
