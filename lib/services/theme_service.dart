import 'package:flutter/foundation.dart';

import 'shared_preferences_service.dart';

class ThemeService with ChangeNotifier {
  ThemeService(this.sharedPreferencesService);

  final SharedPreferencesService sharedPreferencesService;
  bool isDarkMode = false;

  void init() async {
    final isDarkMode = await getSavedDarkMode();
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }

  Future<bool> getSavedDarkMode() async {
    return sharedPreferencesService.isDarkMode();
  }

  Future<void> setDarkMode({required bool isDarkMode}) async {
    sharedPreferencesService.setDarkMode(isDarkMode: isDarkMode);
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }
}
