import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/init/theme/app_theme_dark.dart';
import '../theme/app_theme_light.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeData currentTheme = AppThemeLight.instance.theme;

  ThemeCubit() : super(AppThemeLight.instance.theme);

  void changeTheme(ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      currentTheme = AppThemeLight.instance.theme;
    } else if (themeMode == ThemeMode.dark) {
      currentTheme = AppThemeDark.instance.theme;
    }
    emit(currentTheme);
  }

  void toggleTheme() {
    if (state == AppThemeLight.instance.theme) {
      emit(AppThemeDark.instance.theme);
    } else {
      emit(AppThemeLight.instance.theme);
    }
  }
}
