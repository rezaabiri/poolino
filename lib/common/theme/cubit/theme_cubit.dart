import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../utils/prefs_opreator.dart';
import '../my_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(MyThemes.lightTheme);

  PrefsOperator prefsOperator = locator<PrefsOperator>();

  Future<void> _saveTheme(bool isDark) async {
    await prefsOperator.changeTheme(isDark);
  }

  Future<bool> _loadTheme() async {
    bool isDark = await prefsOperator.getTheme();
    return isDark;
  }

  Future<void> loadTheme() async {
    emit(await prefsOperator.getTheme() ? MyThemes.darkTheme : MyThemes.lightTheme);
  }

  Future<void> _updateTheme() async {
    final bool isDark = await _loadTheme();
    emit(isDark ? MyThemes.darkTheme : MyThemes.lightTheme);
  }

  void setTheme(bool isDark) {
    emit(isDark ? MyThemes.darkTheme : MyThemes.lightTheme);
  }

  void setDarkTheme() async {
    await _saveTheme(true);
    _updateTheme();
  }
  void setLightTheme() async {
    await _saveTheme(false);
    _updateTheme();
  }
}
