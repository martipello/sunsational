import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunsational/api/repositories/weather_repository.dart';

import '../api/api_client.dart';
import '../services/shared_preferences_service.dart';
import '../services/theme_service.dart';
import '../ui/view_models/weather_view_model.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingletonAsync(SharedPreferences.getInstance);
  getIt.registerLazySingleton(
    () => ApiClient.initDioClient(
      'https://api.openweathermap.org/data/2.5',
    ),
  );
  getIt.registerLazySingleton(() => ApiClient(getIt()));

  getIt.registerLazySingleton(SharedPreferencesService.new);
  getIt.registerLazySingleton(() => ThemeService(getIt()));
  getIt.registerLazySingleton(() => WeatherRepository(getIt()));
  getIt.registerFactory(() => WeatherViewModel(getIt()));

  await _initDependencies();
}

Future<void> _initDependencies() async {
  final themeService = getIt.get<ThemeService>();
  themeService.init();
}

