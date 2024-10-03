import 'package:shared_preferences/shared_preferences.dart';

import '../di/dependency_injection_container.dart';

const kDarkMode = 'DARK_MODE';

class SharedPreferencesService {
  final _sharedPreferences = getIt.getAsync<SharedPreferences>();

  Future<SharedPreferences> sharedPreferences() {
    return _sharedPreferences;
  }

  Future<bool> isDarkMode() async {
    final sharedPreferences = await _sharedPreferences;
    return sharedPreferences.getBool(kDarkMode) ?? false;
  }

  Future<void> setDarkMode({required bool isDarkMode}) async {
    final sharedPreferences = await _sharedPreferences;
    sharedPreferences.setBool(kDarkMode, isDarkMode);
  }

}
