import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

@immutable
class ToggleButtonThemeDefaults extends ToggleButtonThemeData with ThemePreset {
  ToggleButtonThemeDefaults(this.context, [ToggleButtonThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  ButtonStyle get style => const ButtonStyle(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        foregroundLoosen: true,
        foregroundJustify: MainAxisAlignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
      ).merge(super.style);

  @override
  get variantStyle => {
        ButtonVariant.text: const DrivenButtonStyle(
          backgroundOpacity: 0,
          borderStyle: BorderStyle.none,
          disabledStyle: ButtonStyle(
            foregroundAlpha: ButtonStyle.disabledForegroundAlpha,
          ),
        ),
        ButtonVariant.tonal: const DrivenButtonStyle(
          backgroundOpacity: .12,
          borderStyle: BorderStyle.none,
          disabledStyle: ButtonStyle(
            foregroundAlpha: ButtonStyle.disabledForegroundAlpha,
            backgroundAlpha: ButtonStyle.disabledBackgroundAlpha,
            borderAlpha: ButtonStyle.disabledBorderAlpha,
          ),
        ),
        ButtonVariant.filled: const DrivenButtonStyle(
          backgroundOpacity: 1,
          borderStyle: BorderStyle.none,
          disabledStyle: ButtonStyle(
            foregroundAlpha: ButtonStyle.disabledForegroundAlpha,
            backgroundAlpha: ButtonStyle.disabledBackgroundAlpha,
            borderAlpha: ButtonStyle.disabledBorderAlpha,
          ),
          hoveredStyle: ButtonStyle(elevation: 1),
          pressedStyle: ButtonStyle(elevation: 0),
        ),
        ButtonVariant.elevated: const DrivenButtonStyle(
          elevation: 1,
          backgroundOpacity: 1,
          borderStyle: BorderStyle.none,
          disabledStyle: ButtonStyle(
            foregroundAlpha: ButtonStyle.disabledForegroundAlpha,
            backgroundAlpha: ButtonStyle.disabledBackgroundAlpha,
            borderAlpha: ButtonStyle.disabledBorderAlpha,
          ),
          hoveredStyle: ButtonStyle(elevation: 3),
          pressedStyle: ButtonStyle(elevation: 1),
        ),
        ButtonVariant.outlined: const DrivenButtonStyle(
          backgroundOpacity: 0,
          borderOpacity: 1,
          borderWidth: 1,
          borderStyle: BorderStyle.solid,
          disabledStyle: ButtonStyle(
            foregroundAlpha: ButtonStyle.disabledForegroundAlpha,
            borderAlpha: ButtonStyle.disabledBorderAlpha,
          ),
        ),
      }.merge(super.variantStyle);
}

@immutable
class ToggleButtonThemeM2 extends ToggleButtonThemeData with ThemePreset {
  ToggleButtonThemeM2(this.context, [ToggleButtonThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => ButtonStyle(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 36.0,
        iconSize: 18.0,
        foregroundSpacing: 8.0,
        foregroundStyle: textTheme.labelLarge?.copyWith(height: 1),
        borderColor: colorTheme.outline,
        shadowColor: colorTheme.shadow,
      ).merge(super.style);

  @override
  get variantStyle => {
        ButtonVariant.text: DrivenButtonStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
          overlayColor: colorTheme.onSurface,
          selectedStyle: ButtonStyle(
            foregroundColor: colorTheme.primary,
            backgroundColor: colorTheme.primary,
          ),
        ),
        ButtonVariant.tonal: DrivenButtonStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.unselectedWidgetColor,
          overlayColor: colorTheme.onSurface,
          selectedStyle: ButtonStyle(
            foregroundColor: colorTheme.primary,
            backgroundColor: colorTheme.primary,
          ),
        ),
        ButtonVariant.elevated: DrivenButtonStyle(
          backgroundColor: colorTheme.surface,
          selectedStyle: ButtonStyle(
            foregroundColor: colorTheme.primary,
            backgroundColor: colorTheme.surface,
          ),
        ),
        ButtonVariant.filled: DrivenButtonStyle(
          backgroundColor: colorTheme.unselectedWidgetColor,
          selectedStyle: ButtonStyle(
            backgroundColor: colorTheme.primary,
          ),
        ),
        ButtonVariant.outlined: DrivenButtonStyle(
          backgroundColor: Colors.transparent,
          foregroundColor: colorTheme.onSurface,
          borderColor: colorTheme.outline,
          overlayColor: colorTheme.onSurface,
          selectedStyle: ButtonStyle(
            foregroundColor: colorTheme.primary,
            borderColor: colorTheme.primary,
            overlayColor: colorTheme.primary,
          ),
        ),
      }.merge(super.variantStyle);
}

@immutable
class ToggleButtonThemeM3 extends ToggleButtonThemeData with ThemePreset {
  ToggleButtonThemeM3(this.context, [ToggleButtonThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => ButtonStyle(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 40.0,
        iconSize: 18.0,
        foregroundSpacing: 8.0,
        foregroundStyle: textTheme.labelLarge?.copyWith(height: 1),
        borderColor: colorTheme.outline,
        shadowColor: colorTheme.shadow,
      ).merge(super.style);

  @override
  get variantStyle => {
        ButtonVariant.text: DrivenButtonStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
          overlayColor: colorTheme.onSurface,
          selectedStyle: ButtonStyle(
            foregroundColor: colorTheme.primary,
            backgroundColor: colorTheme.primary,
          ),
        ),
        ButtonVariant.tonal: DrivenButtonStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.unselectedWidgetColor,
          overlayColor: colorTheme.onSurface,
          selectedStyle: ButtonStyle(
            foregroundColor: colorTheme.primary,
            backgroundColor: colorTheme.primary,
          ),
        ),
        ButtonVariant.elevated: DrivenButtonStyle(
          backgroundColor: colorTheme.surface,
          selectedStyle: ButtonStyle(
            foregroundColor: colorTheme.primary,
            backgroundColor: colorTheme.surface,
          ),
        ),
        ButtonVariant.filled: DrivenButtonStyle(
          backgroundColor: colorTheme.unselectedWidgetColor,
          selectedStyle: ButtonStyle(
            backgroundColor: colorTheme.primary,
          ),
        ),
        ButtonVariant.outlined: DrivenButtonStyle(
          backgroundColor: Colors.transparent,
          foregroundColor: colorTheme.onSurface,
          borderColor: colorTheme.outline,
          overlayColor: colorTheme.onSurface,
          selectedStyle: ButtonStyle(
            foregroundColor: colorTheme.primary,
            borderColor: colorTheme.primary,
            overlayColor: colorTheme.primary,
          ),
        ),
      }.merge(super.variantStyle);
}
