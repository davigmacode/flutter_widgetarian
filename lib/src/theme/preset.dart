import 'package:flutter/material.dart';
import 'extension/color/main.dart';

abstract class ThemePreset {
  @protected
  BuildContext get context;

  @protected
  ThemeData get appTheme => Theme.of(context);

  @protected
  TextTheme get textTheme => appTheme.textTheme;

  @protected
  ColorThemeDefaults get colorTheme =>
      ColorThemeDefaults(context, ColorTheme.of(context));

  @protected
  bool get isLight => appTheme.brightness == Brightness.light;

  @protected
  bool get isDark => appTheme.brightness == Brightness.dark;
}
