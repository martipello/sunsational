import 'package:shared_preferences/shared_preferences.dart';

const kDarkMode = 'DARK_MODE';

class SharedPreferencesService {
  SharedPreferencesService(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  Future<bool> isDarkMode() async {
    final sharedPreferences = _sharedPreferences;
    return sharedPreferences.getBool(kDarkMode) ?? false;
  }

  Future<void> setDarkMode({required bool isDarkMode}) async {
    final sharedPreferences = _sharedPreferences;
    sharedPreferences.setBool(kDarkMode, isDarkMode);
  }

}
