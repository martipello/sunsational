import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../services/theme_service.dart';

extension ContextExtension on BuildContext {

  NavigatorState get navigator => Navigator.of(this);

  ColorScheme get colors => Theme.of(this).colorScheme;

  AppLocalizations get strings => AppLocalizations.of(this)!;

  TextTheme get text => Theme.of(this).textTheme;

  ThemeService get themeService => read<ThemeService>();

  bool get isDarkMode => read<ThemeService>().isDarkMode;

}