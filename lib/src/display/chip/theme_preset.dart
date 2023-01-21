import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'package:widgetarian/src/display/avatar/style.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
abstract class ChipThemePreset extends ChipThemeData with ThemePreset {
  @protected
  const ChipThemePreset(this.context) : super.defaults();

  @override
  final BuildContext context;

  /// A [ChipThemeData] with default values.
  static ChipThemeData defaults(BuildContext context) =>
      ChipThemeDefaults(context);

  /// A [ChipThemeData] with material 2 default values.
  static ChipThemeData m2(BuildContext context) => ChipThemeM2(context);

  /// A [ChipThemeData] with material 3 default values.
  static ChipThemeData m3(BuildContext context) => ChipThemeM3(context);
}

@immutable
class ChipThemeDefaults extends ChipThemePreset {
  const ChipThemeDefaults(super.context);

  @override
  ChipStyle get style => const ChipStyle(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        foregroundLoosen: true,
        foregroundJustify: MainAxisAlignment.center,
      );

  @override
  get variantStyle => {
        ChipVariant.text: const DrivenChipStyle(
          backgroundOpacity: 0,
          borderStyle: BorderStyle.none,
          disabledStyle: ChipStyle(
            foregroundAlpha: ChipStyle.disabledForegroundAlpha,
          ),
        ),
        ChipVariant.tonal: const DrivenChipStyle(
          backgroundOpacity: .12,
          borderStyle: BorderStyle.none,
          disabledStyle: ChipStyle(
            foregroundAlpha: ChipStyle.disabledForegroundAlpha,
            backgroundAlpha: ChipStyle.disabledBackgroundAlpha,
            borderAlpha: ChipStyle.disabledBorderAlpha,
          ),
        ),
        ChipVariant.filled: const DrivenChipStyle(
          backgroundOpacity: 1,
          borderStyle: BorderStyle.none,
          disabledStyle: ChipStyle(
            foregroundAlpha: ChipStyle.disabledForegroundAlpha,
            backgroundAlpha: ChipStyle.disabledBackgroundAlpha,
            borderAlpha: ChipStyle.disabledBorderAlpha,
          ),
          hoveredStyle: ChipStyle(elevation: 1),
          pressedStyle: ChipStyle(elevation: 0),
        ),
        ChipVariant.elevated: const DrivenChipStyle(
          elevation: 1,
          backgroundOpacity: 1,
          borderStyle: BorderStyle.none,
          disabledStyle: ChipStyle(
            foregroundAlpha: ChipStyle.disabledForegroundAlpha,
            backgroundAlpha: ChipStyle.disabledBackgroundAlpha,
            borderAlpha: ChipStyle.disabledBorderAlpha,
          ),
          hoveredStyle: ChipStyle(elevation: 3),
          pressedStyle: ChipStyle(elevation: 1),
        ),
        ChipVariant.outlined: const DrivenChipStyle(
          backgroundOpacity: 0,
          borderOpacity: 1,
          borderWidth: 1,
          borderStyle: BorderStyle.solid,
          disabledStyle: ChipStyle(
            foregroundAlpha: ChipStyle.disabledForegroundAlpha,
            borderAlpha: ChipStyle.disabledBorderAlpha,
          ),
        ),
      };

  @override
  get dangerStyle => {
        ChipVariant.text: ChipStyle(
          foregroundColor: severityTheme.danger,
          backgroundColor: colorScheme.surface,
        ),
        ChipVariant.tonal: ChipStyle(
          foregroundColor: severityTheme.danger,
          backgroundColor: severityTheme.danger,
        ),
        ChipVariant.filled: ChipStyle(
          backgroundColor: severityTheme.danger,
          borderColor: severityTheme.danger,
        ),
        ChipVariant.elevated: ChipStyle(
          shadowColor: severityTheme.danger,
          foregroundColor: severityTheme.danger,
          backgroundColor: colorScheme.surface,
        ),
        ChipVariant.outlined: ChipStyle(
          foregroundColor: severityTheme.danger,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.danger,
        ),
      };

  @override
  get warningStyle => {
        ChipVariant.text: ChipStyle(
          foregroundColor: severityTheme.warning,
          backgroundColor: colorScheme.surface,
        ),
        ChipVariant.tonal: ChipStyle(
          foregroundColor: severityTheme.warning,
          backgroundColor: severityTheme.warning,
        ),
        ChipVariant.filled: ChipStyle(
          backgroundColor: severityTheme.warning,
          borderColor: severityTheme.warning,
        ),
        ChipVariant.elevated: ChipStyle(
          shadowColor: severityTheme.warning,
          foregroundColor: severityTheme.warning,
          backgroundColor: colorScheme.surface,
        ),
        ChipVariant.outlined: ChipStyle(
          foregroundColor: severityTheme.warning,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.warning,
        ),
      };

  @override
  get successStyle => {
        ChipVariant.text: ChipStyle(
          foregroundColor: severityTheme.success,
          backgroundColor: colorScheme.surface,
        ),
        ChipVariant.tonal: ChipStyle(
          foregroundColor: severityTheme.success,
          backgroundColor: severityTheme.success,
        ),
        ChipVariant.filled: ChipStyle(
          backgroundColor: severityTheme.success,
          borderColor: severityTheme.success,
        ),
        ChipVariant.elevated: ChipStyle(
          shadowColor: severityTheme.success,
          foregroundColor: severityTheme.success,
          backgroundColor: colorScheme.surface,
        ),
        ChipVariant.outlined: ChipStyle(
          foregroundColor: severityTheme.success,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.success,
        ),
      };

  @override
  get infoStyle => {
        ChipVariant.text: ChipStyle(
          foregroundColor: severityTheme.info,
          backgroundColor: colorScheme.surface,
        ),
        ChipVariant.tonal: ChipStyle(
          foregroundColor: severityTheme.info,
          backgroundColor: severityTheme.info,
        ),
        ChipVariant.filled: ChipStyle(
          backgroundColor: severityTheme.info,
          borderColor: severityTheme.info,
        ),
        ChipVariant.elevated: ChipStyle(
          shadowColor: severityTheme.info,
          foregroundColor: severityTheme.info,
          backgroundColor: colorScheme.surface,
        ),
        ChipVariant.outlined: ChipStyle(
          foregroundColor: severityTheme.info,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.info,
        ),
      };
}

@immutable
class ChipThemeM2 extends ChipThemePreset {
  const ChipThemeM2(super.context);

  @override
  get style => ChipStyle(
        height: 32.0,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        foregroundSpacing: 8.0,
        foregroundStyle: appTheme.textTheme.labelLarge?.copyWith(height: 1),
        checkmarkWeight: 2.0,
        checkmarkSize: 18.0,
        iconSize: 18.0,
        avatarStyle: const AvatarStyle(
          size: 24.0,
          foregroundStyle: TextStyle(
            height: 1,
            fontSize: 12,
          ),
        ),
      );

  @override
  get variantStyle => {
        ChipVariant.text: DrivenChipStyle(
          foregroundColor: colorScheme.onSurface,
          backgroundColor: colorScheme.surface,
          overlayColor: colorScheme.onSurface,
          selectedStyle: ChipStyle(
            foregroundColor: colorScheme.primary,
            backgroundColor: colorScheme.primary,
          ),
        ),
        ChipVariant.tonal: DrivenChipStyle(
          foregroundColor: colorScheme.onSurface,
          backgroundColor: appTheme.unselectedWidgetColor,
          overlayColor: colorScheme.onSurface,
          selectedStyle: ChipStyle(
            foregroundColor: colorScheme.primary,
            backgroundColor: colorScheme.primary,
          ),
        ),
        ChipVariant.elevated: DrivenChipStyle(
          backgroundColor: colorScheme.surface,
          selectedStyle: ChipStyle(
            foregroundColor: colorScheme.primary,
            backgroundColor: colorScheme.surface,
          ),
        ),
        ChipVariant.filled: DrivenChipStyle(
          backgroundColor: appTheme.unselectedWidgetColor,
          selectedStyle: ChipStyle(
            backgroundColor: colorScheme.primary,
          ),
        ),
        ChipVariant.outlined: DrivenChipStyle(
          backgroundColor: Colors.transparent,
          foregroundColor: colorScheme.onSurface,
          borderColor: colorScheme.outline,
          overlayColor: colorScheme.onSurface,
          selectedStyle: ChipStyle(
            foregroundColor: colorScheme.primary,
            borderColor: colorScheme.primary,
            overlayColor: colorScheme.primary,
          ),
        ),
      };
}

@immutable
class ChipThemeM3 extends ChipThemePreset {
  const ChipThemeM3(super.context);

  @override
  get style => ChipStyle(
        height: 32.0,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        foregroundSpacing: 8.0,
        foregroundStyle: appTheme.textTheme.labelLarge?.copyWith(height: 1),
        checkmarkWeight: 2.0,
        checkmarkSize: 18.0,
        iconSize: 18.0,
        avatarStyle: const AvatarStyle(
          size: 24.0,
          foregroundStyle: TextStyle(
            height: 1,
            fontSize: 12,
          ),
        ),
      );

  @override
  get variantStyle => {
        ChipVariant.text: ChipStyle(
          foregroundColor: appTheme.colorScheme.onSurface,
          backgroundColor: colorScheme.surface,
          overlayColor: colorScheme.onSurface,
        ),
        ChipVariant.tonal: ChipStyle(
          backgroundOpacity: .3,
          foregroundColor: appTheme.colorScheme.onSurface,
          backgroundColor: appTheme.colorScheme.surfaceVariant,
          overlayColor: colorScheme.onSurface,
        ),
        ChipVariant.filled: ChipStyle(
          backgroundColor: appTheme.colorScheme.surfaceVariant,
        ),
        ChipVariant.elevated: ChipStyle(
          surfaceTint: appTheme.colorScheme.surfaceTint,
          backgroundColor: appTheme.colorScheme.surface,
        ),
        ChipVariant.outlined: ChipStyle(
          foregroundColor: appTheme.colorScheme.onSurface,
          backgroundColor: appTheme.colorScheme.surface,
          overlayColor: colorScheme.onSurface,
        ),
      };
}
