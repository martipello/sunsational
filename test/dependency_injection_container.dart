import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunsational/api/api_client.dart';
import 'package:sunsational/api/repositories/weather_repository.dart';
import 'package:sunsational/services/shared_preferences_service.dart';
import 'package:sunsational/services/theme_service.dart';
import 'package:sunsational/ui/view_models/weather_view_model.dart';


final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton(
        () => ApiClient.initDioClient(
      'https://api.openweathermap.org/data/2.5',
    ),
  );
  getIt.registerLazySingleton(() => ApiClient(getIt()));

  getIt.registerLazySingletonAsync(() async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    return SharedPreferencesService(sharedPreferences);
  });
  getIt.registerLazySingletonAsync(() async {
    await getIt.isReady<SharedPreferencesService>();
    final sharedPreferencesService = await getIt.getAsync<SharedPreferencesService>();
    return ThemeService(sharedPreferencesService);
  });
  getIt.registerLazySingleton(() => WeatherRepository(getIt()));
  getIt.registerFactory(() => WeatherViewModel(getIt()));

  await _initDependencies();
}

Future<void> _initDependencies() async {
  final themeService = await getIt.getAsync<ThemeService>();
  themeService.init();
  await getIt.allReady();
}

