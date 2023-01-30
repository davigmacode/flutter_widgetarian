import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'data.dart';

@immutable
class ColorThemeDefaults extends ColorThemeData with ThemePreset {
  ColorThemeDefaults(this.context, [ColorThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  Brightness get brightness => appTheme.colorScheme.brightness;

  Color get unselectedWidgetColor => appTheme.unselectedWidgetColor;

  Color get background => appTheme.colorScheme.background;
  Color get outline => appTheme.colorScheme.outline;
  Color get shadow => appTheme.colorScheme.shadow;

  Color get surface => appTheme.colorScheme.surface;
  Color get surfaceTint => appTheme.colorScheme.surfaceTint;
  Color get surfaceVariant => appTheme.colorScheme.surfaceVariant;
  Color get onSurface => appTheme.colorScheme.onSurface;
  Color get onSurfaceVariant => appTheme.colorScheme.onSurfaceVariant;

  Color get primary => appTheme.colorScheme.primary;
  Color get primaryContainer => appTheme.colorScheme.primaryContainer;
  Color get onPrimary => appTheme.colorScheme.onPrimary;
  Color get onPrimaryContainer => appTheme.colorScheme.onPrimaryContainer;

  Color get secondary => appTheme.colorScheme.secondary;
  Color get secondaryContainer => appTheme.colorScheme.secondaryContainer;
  Color get onSecondary => appTheme.colorScheme.onSecondary;
  Color get onSecondaryContainer => appTheme.colorScheme.onSecondaryContainer;

  Color get tertiary => appTheme.colorScheme.tertiary;
  Color get tertiaryContainer => appTheme.colorScheme.tertiaryContainer;
  Color get onTertiary => appTheme.colorScheme.onTertiary;
  Color get onTertiaryContainer => appTheme.colorScheme.onTertiaryContainer;

  Color get inversePrimary => appTheme.colorScheme.inversePrimary;
  Color get inverseSurface => appTheme.colorScheme.inverseSurface;
  Color get onInverseSurface => appTheme.colorScheme.onInverseSurface;

  Color get error => appTheme.colorScheme.error;
  Color get errorContainer => appTheme.colorScheme.errorContainer;
  Color get onError => appTheme.colorScheme.onError;
  Color get onErrorContainer => appTheme.colorScheme.onErrorContainer;
}
