//TODO remove these ignores for apps
//ignore_for_file:undefined_identifier
//ignore_for_file:creation_with_non_type
//ignore_for_file:uri_does_not_exist
//ignore_for_file:uri_has_not_been_generated

import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';

// Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
final kLightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xffdcdeff),
    primaryContainer: Color(0xfff0f66f),
    secondary: Color(0xffd0ce23),
    secondaryContainer: Color(0xffb8beff),
    tertiary: Color(0xffbdbdbd),
    tertiaryContainer: Color(0xffe6e307),
    appBarColor: Color(0xffb8beff),
    error: Color(0xffb00020),
  ),
  usedColors: 3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

final kDarkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xffd3cbff),
    primaryContainer: Color(0xfff5ff38),
    secondary: Color(0xffaea902),
    secondaryContainer: Color(0xff872100),
    tertiary: Color(0xff86d2e1),
    tertiaryContainer: Color(0xff004e59),
    appBarColor: Color(0xff872100),
    error: Color(0xffcf6679),
  ),
  usedColors: 3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

class AdditionalColors {
  const AdditionalColors({
    this.link = const Color(0xFF6790F0),
  });
  final Color link;
}
