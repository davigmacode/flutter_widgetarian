import 'dart:ui' show Brightness;
import 'package:flutter/material.dart' show ThemeExtension;
export 'package:flutter/material.dart'
    show
        Theme,
        ThemeData,
        ThemeMode,
        ThemeExtension,
        TextTheme,
        ColorScheme,
        Brightness;

typedef ThemeExtensionIterable = Iterable<ThemeExtension<dynamic>>;

extension BrightnessFlag on Brightness {
  /// Whether or not this is light
  ///
  /// ```dart
  /// final isLight = Theme.of(context).brightness.isLight;
  /// ```
  bool get isLight => this == Brightness.light;

  /// Whether or not this is dark
  ///
  /// ```dart
  /// final isDark = Theme.of(context).brightness.isDark;
  /// ```
  bool get isDark => this == Brightness.dark;
}
