import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
abstract class ButtonThemePreset extends ButtonThemeData with ThemePreset {
  @protected
  const ButtonThemePreset(this.context) : super.defaults();

  @override
  final BuildContext context;

  /// A [ButtonThemeData] with default values.
  static ButtonThemeData defaults(BuildContext context) =>
      ButtonThemeDefaults(context);

  /// A [ButtonThemeData] with material 2 default values.
  static ButtonThemeData m2(BuildContext context) => ButtonThemeM2(context);

  /// A [ButtonThemeData] with material 3 default values.
  static ButtonThemeData m3(BuildContext context) => ButtonThemeM3(context);
}

@immutable
class ButtonThemeDefaults extends ButtonThemePreset {
  const ButtonThemeDefaults(super.context);

  @override
  ButtonStyle get style => const ButtonStyle(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        foregroundLoosen: true,
        foregroundJustify: MainAxisAlignment.center,
      );

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
      };

  @override
  get dangerStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: severityTheme.danger,
          backgroundColor: colorScheme.surface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          foregroundColor: severityTheme.danger,
          backgroundColor: severityTheme.danger,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: severityTheme.danger,
          borderColor: severityTheme.danger,
        ),
        ButtonVariant.elevated: ButtonStyle(
          shadowColor: severityTheme.danger,
          foregroundColor: severityTheme.danger,
          backgroundColor: colorScheme.surface,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: severityTheme.danger,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.danger,
        ),
      };

  @override
  get warningStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: severityTheme.warning,
          backgroundColor: colorScheme.surface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          foregroundColor: severityTheme.warning,
          backgroundColor: severityTheme.warning,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: severityTheme.warning,
          borderColor: severityTheme.warning,
        ),
        ButtonVariant.elevated: ButtonStyle(
          shadowColor: severityTheme.warning,
          foregroundColor: severityTheme.warning,
          backgroundColor: colorScheme.surface,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: severityTheme.warning,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.warning,
        ),
      };

  @override
  get successStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: severityTheme.success,
          backgroundColor: colorScheme.surface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          foregroundColor: severityTheme.success,
          backgroundColor: severityTheme.success,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: severityTheme.success,
          borderColor: severityTheme.success,
        ),
        ButtonVariant.elevated: ButtonStyle(
          shadowColor: severityTheme.success,
          foregroundColor: severityTheme.success,
          backgroundColor: colorScheme.surface,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: severityTheme.success,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.success,
        ),
      };

  @override
  get infoStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: severityTheme.info,
          backgroundColor: colorScheme.surface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          foregroundColor: severityTheme.info,
          backgroundColor: severityTheme.info,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: severityTheme.info,
          borderColor: severityTheme.info,
        ),
        ButtonVariant.elevated: ButtonStyle(
          shadowColor: severityTheme.info,
          foregroundColor: severityTheme.info,
          backgroundColor: colorScheme.surface,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: severityTheme.info,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.info,
        ),
      };
}

@immutable
class ButtonThemeM2 extends ButtonThemePreset {
  const ButtonThemeM2(super.context);

  @override
  get style => ButtonStyle(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 36.0,
        iconSize: 18.0,
        foregroundSpacing: 8.0,
        foregroundStyle: appTheme.textTheme.labelLarge?.copyWith(height: 1),
        borderColor: colorScheme.outline,
        shadowColor: colorScheme.shadow,
      );

  @override
  get variantStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: colorScheme.primary,
          backgroundColor: colorScheme.surface,
          overlayColor: colorScheme.onSurface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          foregroundColor: colorScheme.primary,
          backgroundColor: colorScheme.primary,
          overlayColor: colorScheme.onSurface,
        ),
        ButtonVariant.elevated: ButtonStyle(
          foregroundColor: colorScheme.primary,
          backgroundColor: colorScheme.surface,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: colorScheme.primary,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: colorScheme.primary,
          backgroundColor: Colors.transparent,
          overlayColor: colorScheme.onSurface,
        ),
      };
}

@immutable
class ButtonThemeM3 extends ButtonThemePreset {
  const ButtonThemeM3(super.context);

  @override
  get style => ButtonStyle(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 40.0,
        iconSize: 18.0,
        foregroundSpacing: 8.0,
        foregroundStyle: appTheme.textTheme.labelLarge?.copyWith(height: 1),
        foregroundColor: colorScheme.primary,
        borderColor: colorScheme.outline,
        shadowColor: colorScheme.shadow,
      );

  @override
  get variantStyle => {
        ButtonVariant.text: ButtonStyle(
          foregroundColor: appTheme.colorScheme.onSurface,
          backgroundColor: colorScheme.surface,
          overlayColor: colorScheme.onSurface,
        ),
        ButtonVariant.tonal: ButtonStyle(
          backgroundOpacity: .3,
          foregroundColor: appTheme.colorScheme.onSurface,
          backgroundColor: appTheme.colorScheme.surfaceVariant,
          overlayColor: colorScheme.onSurface,
        ),
        ButtonVariant.filled: ButtonStyle(
          backgroundColor: appTheme.colorScheme.surfaceVariant,
        ),
        ButtonVariant.elevated: ButtonStyle(
          surfaceTint: appTheme.colorScheme.surfaceTint,
          backgroundColor: appTheme.colorScheme.surface,
        ),
        ButtonVariant.outlined: ButtonStyle(
          foregroundColor: appTheme.colorScheme.onSurface,
          backgroundColor: appTheme.colorScheme.surface,
          overlayColor: colorScheme.onSurface,
        ),
      };
}
