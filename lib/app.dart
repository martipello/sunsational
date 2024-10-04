import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../di/dependency_injection_container.dart' as di;
import 'di/dependency_injection_container.dart';
import 'navigation/navigation_config.dart';
import 'services/theme_service.dart';
import 'theme/theme.g.dart';

class App {
  static void init() async {
    runZonedGuarded<Future<void>>(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        GoRouter.optionURLReflectsImperativeAPIs = true;
        await di.init();
        final appRouter = router();
        runApp(
          ChangeNotifierProvider<ThemeService>(
            create: (_) => getIt.get<ThemeService>(),
            builder: (context, _) {
              final isDarkMode = context.watch<ThemeService>().isDarkMode;
              return MaterialApp.router(
                theme: kLightTheme,
                darkTheme: kDarkTheme,
                themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', ''),
                ],
                routerConfig: appRouter,
              );
            },
          ),
        );
      },
      (error, stack) {
        if (kDebugMode) {
          print('runZonedGuarded: Caught error in runZonedGuarded');
        }
      },
    );
  }
}
