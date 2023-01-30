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
        variant: ChipVariant.tonal,
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
}

@immutable
class ChipThemeM2 extends ChipThemeData with ThemePreset {
  ChipThemeM2(this.context, [ChipThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get deleteIcon => const IconData(0xf616, fontFamily: 'MaterialIcons');

  @override
  get style => ChipStyle(
        height: 32.0,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
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
          backgroundColor: colorTheme.unselectedWidgetColor,
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
          backgroundColor: colorTheme.unselectedWidgetColor,
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

  @override
  get dangerStyle => {
        ChipVariant.text: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.danger,
            backgroundColor: colorTheme.danger,
          ),
        ),
        ChipVariant.tonal: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.danger,
            backgroundColor: colorTheme.danger,
          ),
        ),
        ChipVariant.elevated: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.danger,
          ),
        ),
        ChipVariant.filled: DrivenChipStyle(
          selectedStyle: ChipStyle(
            backgroundColor: colorTheme.danger,
          ),
        ),
        ChipVariant.outlined: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.danger,
            borderColor: colorTheme.danger,
            overlayColor: colorTheme.danger,
          ),
        ),
      }.merge(super.dangerStyle);

  @override
  get warningStyle => {
        ChipVariant.text: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.warning,
            backgroundColor: colorTheme.warning,
          ),
        ),
        ChipVariant.tonal: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.warning,
            backgroundColor: colorTheme.warning,
          ),
        ),
        ChipVariant.elevated: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.warning,
          ),
        ),
        ChipVariant.filled: DrivenChipStyle(
          selectedStyle: ChipStyle(
            backgroundColor: colorTheme.warning,
          ),
        ),
        ChipVariant.outlined: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.warning,
            borderColor: colorTheme.warning,
            overlayColor: colorTheme.warning,
          ),
        ),
      }.merge(super.warningStyle);

  @override
  get successStyle => {
        ChipVariant.text: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.success,
            backgroundColor: colorTheme.success,
          ),
        ),
        ChipVariant.tonal: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.success,
            backgroundColor: colorTheme.success,
          ),
        ),
        ChipVariant.elevated: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.success,
          ),
        ),
        ChipVariant.filled: DrivenChipStyle(
          selectedStyle: ChipStyle(
            backgroundColor: colorTheme.success,
          ),
        ),
        ChipVariant.outlined: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.success,
            borderColor: colorTheme.success,
            overlayColor: colorTheme.success,
          ),
        ),
      }.merge(super.successStyle);

  @override
  get infoStyle => {
        ChipVariant.text: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.info,
            backgroundColor: colorTheme.info,
          ),
        ),
        ChipVariant.tonal: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.info,
            backgroundColor: colorTheme.info,
          ),
        ),
        ChipVariant.elevated: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.info,
          ),
        ),
        ChipVariant.filled: DrivenChipStyle(
          selectedStyle: ChipStyle(
            backgroundColor: colorTheme.info,
          ),
        ),
        ChipVariant.outlined: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.info,
            borderColor: colorTheme.info,
            overlayColor: colorTheme.info,
          ),
        ),
      }.merge(super.infoStyle);
}

@immutable
class ChipThemeM3 extends ChipThemeData with ThemePreset {
  ChipThemeM3(this.context, [ChipThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => ChipStyle(
        height: 32.0,
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
          backgroundColor: colorTheme.unselectedWidgetColor,
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
          backgroundColor: colorTheme.surfaceVariant,
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

  @override
  get dangerStyle => {
        ChipVariant.text: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.danger,
            backgroundColor: colorTheme.danger,
          ),
        ),
        ChipVariant.tonal: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.danger,
            backgroundColor: colorTheme.danger,
          ),
        ),
        ChipVariant.elevated: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.danger,
          ),
        ),
        ChipVariant.filled: DrivenChipStyle(
          selectedStyle: ChipStyle(
            backgroundColor: colorTheme.danger,
          ),
        ),
        ChipVariant.outlined: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.danger,
            borderColor: colorTheme.danger,
            overlayColor: colorTheme.danger,
          ),
        ),
      }.merge(super.dangerStyle);

  @override
  get warningStyle => {
        ChipVariant.text: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.warning,
            backgroundColor: colorTheme.warning,
          ),
        ),
        ChipVariant.tonal: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.warning,
            backgroundColor: colorTheme.warning,
          ),
        ),
        ChipVariant.elevated: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.warning,
          ),
        ),
        ChipVariant.filled: DrivenChipStyle(
          selectedStyle: ChipStyle(
            backgroundColor: colorTheme.warning,
          ),
        ),
        ChipVariant.outlined: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.warning,
            borderColor: colorTheme.warning,
            overlayColor: colorTheme.warning,
          ),
        ),
      }.merge(super.warningStyle);

  @override
  get successStyle => {
        ChipVariant.text: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.success,
            backgroundColor: colorTheme.success,
          ),
        ),
        ChipVariant.tonal: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.success,
            backgroundColor: colorTheme.success,
          ),
        ),
        ChipVariant.elevated: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.success,
          ),
        ),
        ChipVariant.filled: DrivenChipStyle(
          selectedStyle: ChipStyle(
            backgroundColor: colorTheme.success,
          ),
        ),
        ChipVariant.outlined: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.success,
            borderColor: colorTheme.success,
            overlayColor: colorTheme.success,
          ),
        ),
      }.merge(super.successStyle);

  @override
  get infoStyle => {
        ChipVariant.text: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.info,
            backgroundColor: colorTheme.info,
          ),
        ),
        ChipVariant.tonal: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.info,
            backgroundColor: colorTheme.info,
          ),
        ),
        ChipVariant.elevated: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.info,
          ),
        ),
        ChipVariant.filled: DrivenChipStyle(
          selectedStyle: ChipStyle(
            backgroundColor: colorTheme.info,
          ),
        ),
        ChipVariant.outlined: DrivenChipStyle(
          selectedStyle: ChipStyle(
            foregroundColor: colorTheme.info,
            borderColor: colorTheme.info,
            overlayColor: colorTheme.info,
          ),
        ),
      }.merge(super.infoStyle);
}
