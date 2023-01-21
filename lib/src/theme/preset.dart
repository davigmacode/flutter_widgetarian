import 'package:flutter/material.dart';
import 'extension/severity.dart';

abstract class ThemePreset {
  @protected
  BuildContext get context;

  @protected
  ThemeData get appTheme => Theme.of(context);

  @protected
  SeverityThemeData get severityTheme => SeverityTheme.of(context);

  @protected
  ColorScheme get colorScheme => appTheme.colorScheme;

  @protected
  bool get isLight => appTheme.brightness == Brightness.light;

  @protected
  bool get isDark => appTheme.brightness == Brightness.dark;
}
