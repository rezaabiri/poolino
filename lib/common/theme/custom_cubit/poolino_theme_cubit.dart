import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poolino/common/theme/poolino_theme.dart';

import '../../../locator.dart';
import '../../utils/prefs_opreator.dart';

part 'poolino_theme_state.dart';

class PoolinoThemeCubit extends Cubit<int> {
  PoolinoThemeCubit() : super(0);

  PrefsOperator prefsOperator = locator<PrefsOperator>();

  Future<void> _saveTheme(bool isDark) async {
    await prefsOperator.changeTheme(isDark);
  }

  Future<bool> _loadTheme() async {
    bool isDark = await prefsOperator.getTheme();
    return isDark;
  }

  Future<void> loadTheme() async {
    emit(await prefsOperator.getTheme() ? 1 : 0);
  }

  Future<void> _updateTheme() async {
    final bool isDark = await _loadTheme();
    emit(isDark ? 1 : 0);
  }

  void setTheme(bool isDark) {
    emit(isDark ? 1 : 0);
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
