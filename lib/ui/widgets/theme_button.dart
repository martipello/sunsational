import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunsational/extensions/context_extensions.dart';
import 'package:sunsational/services/theme_service.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeService>().isDarkMode;
    return IconButton(
      icon: Icon(isDarkMode ? Icons.sunny : Icons.nightlight_round_sharp),
      onPressed: () {
        context.themeService.setDarkMode(isDarkMode: !isDarkMode);
      },
    );
  }
}
