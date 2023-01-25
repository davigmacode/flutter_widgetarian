import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class ButtonThemeDefaults extends ButtonThemeData with ThemePreset {
  ButtonThemeDefaults(this.context, [ButtonThemeData? other])
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

  @override
  get dangerStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.danger,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: colorTheme.danger,
          borderColor: colorTheme.danger,
        ),
        ButtonVariant.elevated: ButtonStyle(
          shadowColor: colorTheme.danger,
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.danger,
        ),
      }.merge(super.dangerStyle);

  @override
  get warningStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.warning,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: colorTheme.warning,
          borderColor: colorTheme.warning,
        ),
        ButtonVariant.elevated: ButtonStyle(
          shadowColor: colorTheme.warning,
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.warning,
        ),
      }.merge(super.warningStyle);

  @override
  get successStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.success,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: colorTheme.success,
          borderColor: colorTheme.success,
        ),
        ButtonVariant.elevated: ButtonStyle(
          shadowColor: colorTheme.success,
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.success,
        ),
      }.merge(super.successStyle);

  @override
  get infoStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.info,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: colorTheme.info,
          borderColor: colorTheme.info,
        ),
        ButtonVariant.elevated: ButtonStyle(
          shadowColor: colorTheme.info,
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.info,
        ),
      }.merge(super.infoStyle);
}

@immutable
class ButtonThemeM2 extends ButtonThemeData with ThemePreset {
  ButtonThemeM2(this.context, [ButtonThemeData? other]) : super.from(other);

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
        ButtonVariant.text: ButtonStyle(
          foregroundColor: colorTheme.primary,
          backgroundColor: colorTheme.surface,
          overlayColor: colorTheme.onSurface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          foregroundColor: colorTheme.primary,
          backgroundColor: colorTheme.primary,
          overlayColor: colorTheme.onSurface,
        ),
        ButtonVariant.elevated: ButtonStyle(
          foregroundColor: colorTheme.primary,
          backgroundColor: colorTheme.surface,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: colorTheme.primary,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: colorTheme.primary,
          backgroundColor: Colors.transparent,
          overlayColor: colorTheme.onSurface,
        ),
      }.merge(super.variantStyle);
}

@immutable
class ButtonThemeM3 extends ButtonThemeData with ThemePreset {
  ButtonThemeM3(this.context, [ButtonThemeData? other]) : super.from(other);

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
        foregroundColor: colorTheme.primary,
        borderColor: colorTheme.outline,
        shadowColor: colorTheme.shadow,
      ).merge(super.style);

  @override
  get variantStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
          overlayColor: colorTheme.onSurface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          backgroundOpacity: .3,
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surfaceVariant,
          overlayColor: colorTheme.onSurface,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: colorTheme.surfaceVariant,
        ),
        ButtonVariant.elevated: ButtonStyle(
          surfaceTint: colorTheme.surfaceTint,
          backgroundColor: colorTheme.surface,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
          overlayColor: colorTheme.onSurface,
        ),
      }.merge(super.variantStyle);
}
