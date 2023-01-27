import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/extension/main.dart';

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

  /// An [Iterable<ThemeExtension>] with material 2 default values.
  static Iterable<ThemeExtension> m2(BuildContext context) => [
        // ColorThemeData.defaults(context),
        SheetThemeData.m2(context),
        ToggleButtonThemeData.m2(context),
        ButtonThemeData.m2(context),
        // AvatarThemeData.defaults(context),
        // BadgeThemeData.defaults(context),
        ChipThemeData.m2(context),
        // AlertThemeData.defaults(context),
        CheckboxThemeData.m2(context),
        // CheckboxTileThemeData.defaults(context),
        RadioThemeData.m2(context),
        // RadioTileThemeData.defaults(context),
        SwitchThemeData.m3(context),
        // SwitchTileThemeData.defaults(context),
      ];

  /// An [Iterable<ThemeExtension>] with material 3 default values.
  static Iterable<ThemeExtension> m3(BuildContext context) => [
        // ColorThemeData.defaults(context),
        SheetThemeData.m3(context),
        ToggleButtonThemeData.m3(context),
        ButtonThemeData.m3(context),
        // AvatarThemeData.defaults(context),
        // BadgeThemeData.defaults(context),
        ChipThemeData.m3(context),
        // AlertThemeData.defaults(context),
        CheckboxThemeData.m3(context),
        // CheckboxTileThemeData.defaults(context),
        RadioThemeData.m3(context),
        // RadioTileThemeData.defaults(context),
        SwitchThemeData.m3(context),
        SwitchTileThemeData.m3(context),
      ];

  /// An [Iterable<ThemeExtension>] with ios default values.
  static Iterable<ThemeExtension> ios(BuildContext context) => [
        // ColorThemeData.defaults(context),
        SheetThemeData.m3(context),
        ButtonThemeData.m3(context),
        // AvatarThemeData.defaults(context),
        // BadgeThemeData.defaults(context),
        ChipThemeData.m3(context),
        // AlertThemeData.defaults(context),
        CheckboxThemeData.m3(context),
        // CheckboxTileThemeData.defaults(context),
        RadioThemeData.m3(context),
        // RadioTileThemeData.defaults(context),
        SwitchThemeData.ios(context),
        // SwitchTileThemeData.defaults(context),
      ];
}
