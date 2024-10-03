import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';
import '../services/shared_preferences_service.dart';
import '../services/theme_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingletonAsync(SharedPreferences.getInstance);
  getIt.registerLazySingleton(
    () => ApiClient.initDioClient(
      'https://some-weather-api.com',
    ),
  );
  getIt.registerLazySingleton(() => ApiClient(getIt()));

  getIt.registerLazySingleton(SharedPreferencesService.new);
  getIt.registerLazySingleton(() => ThemeService(getIt()));

  await _initDependencies();
}

Future<void> _initDependencies() async {
  final themeService = getIt.get<ThemeService>();
  themeService.init();
}

