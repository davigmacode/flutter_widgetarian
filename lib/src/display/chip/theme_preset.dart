import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'package:widgetarian/src/display/avatar/style.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class ChipThemeDefaults extends ChipThemeData with ThemePreset {
  ChipThemeDefaults(this.context, [ChipThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  ChipStyle get style => const ChipStyle(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        foregroundLoosen: true,
        foregroundJustify: MainAxisAlignment.center,
      ).merge(super.style);

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
      }.merge(super.variantStyle);

  @override
  get dangerStyle => {
        ChipVariant.text: ChipStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
        ),
        ChipVariant.tonal: ChipStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.danger,
        ),
        ChipVariant.filled: ChipStyle(
          backgroundColor: colorTheme.danger,
          borderColor: colorTheme.danger,
        ),
        ChipVariant.elevated: ChipStyle(
          shadowColor: colorTheme.danger,
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
        ),
        ChipVariant.outlined: ChipStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.danger,
        ),
      }.merge(super.dangerStyle);

  @override
  get warningStyle => {
        ChipVariant.text: ChipStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
        ),
        ChipVariant.tonal: ChipStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.warning,
        ),
        ChipVariant.filled: ChipStyle(
          backgroundColor: colorTheme.warning,
          borderColor: colorTheme.warning,
        ),
        ChipVariant.elevated: ChipStyle(
          shadowColor: colorTheme.warning,
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
        ),
        ChipVariant.outlined: ChipStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.warning,
        ),
      }.merge(super.warningStyle);

  @override
  get successStyle => {
        ChipVariant.text: ChipStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
        ),
        ChipVariant.tonal: ChipStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.success,
        ),
        ChipVariant.filled: ChipStyle(
          backgroundColor: colorTheme.success,
          borderColor: colorTheme.success,
        ),
        ChipVariant.elevated: ChipStyle(
          shadowColor: colorTheme.success,
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
        ),
        ChipVariant.outlined: ChipStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.success,
        ),
      }.merge(super.successStyle);

  @override
  get infoStyle => {
        ChipVariant.text: ChipStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
        ),
        ChipVariant.tonal: ChipStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.info,
        ),
        ChipVariant.filled: ChipStyle(
          backgroundColor: colorTheme.info,
          borderColor: colorTheme.info,
        ),
        ChipVariant.elevated: ChipStyle(
          shadowColor: colorTheme.info,
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
        ),
        ChipVariant.outlined: ChipStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.info,
        ),
      }.merge(super.infoStyle);
}

@immutable
class ChipThemeM2 extends ChipThemeData with ThemePreset {
  ChipThemeM2(this.context, [ChipThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => ChipStyle(
        height: 32.0,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        foregroundSpacing: 8.0,
        foregroundStyle: textTheme.labelLarge?.copyWith(height: 1),
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
      ).merge(super.style);

  @override
  get variantStyle => {
        ChipVariant.text: DrivenChipStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
          overlayColor: colorTheme.onSurface,
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.primary,
            backgroundColor: colorTheme.primary,
          ),
        ),
        ChipVariant.tonal: DrivenChipStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: appTheme.unselectedWidgetColor,
          overlayColor: colorTheme.onSurface,
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.primary,
            backgroundColor: colorTheme.primary,
          ),
        ),
        ChipVariant.elevated: DrivenChipStyle(
          backgroundColor: colorTheme.surface,
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.primary,
            backgroundColor: colorTheme.surface,
          ),
        ),
        ChipVariant.filled: DrivenChipStyle(
          backgroundColor: appTheme.unselectedWidgetColor,
          selectedStyle: ChipStyle(
            backgroundColor: colorTheme.primary,
          ),
        ),
        ChipVariant.outlined: DrivenChipStyle(
          backgroundColor: Colors.transparent,
          foregroundColor: colorTheme.onSurface,
          borderColor: colorTheme.outline,
          overlayColor: colorTheme.onSurface,
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.primary,
            borderColor: colorTheme.primary,
            overlayColor: colorTheme.primary,
          ),
        ),
      }.merge(super.variantStyle);
}

@immutable
class ChipThemeM3 extends ChipThemeData with ThemePreset {
  ChipThemeM3(this.context, [ChipThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => ChipStyle(
        height: 32.0,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        foregroundSpacing: 8.0,
        foregroundStyle: textTheme.labelLarge?.copyWith(height: 1),
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
      ).merge(super.style);

  @override
  get variantStyle => {
        ChipVariant.text: ChipStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
          overlayColor: colorTheme.onSurface,
        ),
        ChipVariant.tonal: ChipStyle(
          backgroundOpacity: .3,
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surfaceVariant,
          overlayColor: colorTheme.onSurface,
        ),
        ChipVariant.filled: ChipStyle(
          backgroundColor: colorTheme.surfaceVariant,
        ),
        ChipVariant.elevated: ChipStyle(
          surfaceTint: colorTheme.surfaceTint,
          backgroundColor: colorTheme.surface,
        ),
        ChipVariant.outlined: ChipStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
          overlayColor: colorTheme.onSurface,
        ),
      }.merge(super.variantStyle);
}
