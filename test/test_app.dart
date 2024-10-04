import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sunsational/di/dependency_injection_container.dart' as di;
import 'package:sunsational/navigation/navigation_config.dart';
import 'package:sunsational/services/theme_service.dart';
import 'package:sunsational/theme/theme.g.dart';

Widget testApp(GoRouter appRouter) {

  GoRouter.optionURLReflectsImperativeAPIs = true;
  final appRouter = router();
  return ChangeNotifierProvider<ThemeService>(
    create: (_) => di.getIt.get<ThemeService>(),
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
  );
}

Widget testWidget(Widget widget) {
  return MaterialApp(
    home: widget,
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('en', ''),
    ],
  );
}
