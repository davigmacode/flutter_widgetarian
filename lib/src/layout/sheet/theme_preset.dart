import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'types.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class SheetThemeDefaults extends SheetThemeData with ThemePreset {
  @protected
  SheetThemeDefaults(this.context, [SheetThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get variantStyle => {
        SheetVariant.text: const SheetStyle(
          backgroundOpacity: 0,
          borderStyle: BorderStyle.none,
        ),
        SheetVariant.tonal: const SheetStyle(
          backgroundOpacity: .12,
          borderStyle: BorderStyle.none,
        ),
        SheetVariant.filled: const SheetStyle(
          backgroundOpacity: 1,
          borderStyle: BorderStyle.none,
        ),
        SheetVariant.elevated: const SheetStyle(
          elevation: 1,
          backgroundOpacity: 1,
          borderStyle: BorderStyle.none,
        ),
        SheetVariant.outlined: const SheetStyle(
          backgroundOpacity: 0,
          borderOpacity: 1,
          borderWidth: 1,
          borderStyle: BorderStyle.solid,
        ),
      }.merge(super.variantStyle);
}

@immutable
class SheetThemeM2 extends SheetThemeData with ThemePreset {
  SheetThemeM2(this.context, [SheetThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => SheetStyle(
        borderColor: colorTheme.outline,
        shadowColor: appTheme.shadowColor,
      ).merge(super.style);

  @override
  get variantStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: appTheme.unselectedWidgetColor,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: appTheme.unselectedWidgetColor,
        ),
        SheetVariant.elevated: SheetStyle(
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
        ),
      }.merge(super.variantStyle);

  @override
  get dangerStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.danger,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: colorTheme.danger,
          borderColor: colorTheme.danger,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: colorTheme.danger,
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.danger,
        ),
      }.merge(super.dangerStyle);

  @override
  get warningStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.warning,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: colorTheme.warning,
          borderColor: colorTheme.warning,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: colorTheme.warning,
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.warning,
        ),
      }.merge(super.warningStyle);

  @override
  get successStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.success,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: colorTheme.success,
          borderColor: colorTheme.success,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: colorTheme.success,
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.success,
        ),
      }.merge(super.successStyle);

  @override
  get infoStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.info,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: colorTheme.info,
          borderColor: colorTheme.info,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: colorTheme.info,
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.info,
        ),
      }.merge(super.infoStyle);
}

@immutable
class SheetThemeM3 extends SheetThemeData with ThemePreset {
  SheetThemeM3(this.context, [SheetThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => SheetStyle(
        borderColor: colorTheme.outline,
        shadowColor: colorTheme.shadow,
      ).merge(super.style);

  @override
  get variantStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          backgroundOpacity: .3,
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surfaceVariant,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: colorTheme.surfaceVariant,
        ),
        SheetVariant.elevated: SheetStyle(
          surfaceTint: colorTheme.surfaceTint,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
        ),
      }.merge(super.variantStyle);

  @override
  get dangerStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.danger,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.danger,
        ),
        SheetVariant.filled: SheetStyle(
          foregroundColor: colorTheme.danger,
        ),
        SheetVariant.elevated: SheetStyle(
          foregroundColor: colorTheme.danger,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.danger,
          borderColor: colorTheme.danger,
        ),
      }.merge(super.dangerStyle);

  @override
  get warningStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.warning,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.warning,
        ),
        SheetVariant.filled: SheetStyle(
          foregroundColor: colorTheme.warning,
        ),
        SheetVariant.elevated: SheetStyle(
          foregroundColor: colorTheme.warning,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.warning,
          borderColor: colorTheme.warning,
        ),
      }.merge(super.warningStyle);

  @override
  get successStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.success,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.success,
        ),
        SheetVariant.filled: SheetStyle(
          foregroundColor: colorTheme.success,
        ),
        SheetVariant.elevated: SheetStyle(
          foregroundColor: colorTheme.success,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.success,
          borderColor: colorTheme.success,
        ),
      }.merge(super.successStyle);

  @override
  get infoStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.info,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.info,
        ),
        SheetVariant.filled: SheetStyle(
          foregroundColor: colorTheme.info,
        ),
        SheetVariant.elevated: SheetStyle(
          foregroundColor: colorTheme.info,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.info,
          borderColor: colorTheme.info,
        ),
      }.merge(super.infoStyle);
}

@immutable
class SheetThemeIos extends SheetThemeData with ThemePreset {
  SheetThemeIos(this.context, [SheetThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => SheetStyle(
        borderColor: colorTheme.outline,
        shadowColor: appTheme.shadowColor,
      ).merge(super.style);

  @override
  get variantStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: appTheme.unselectedWidgetColor,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: appTheme.unselectedWidgetColor,
        ),
        SheetVariant.elevated: SheetStyle(
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.onSurface,
          backgroundColor: colorTheme.surface,
        ),
      }.merge(super.variantStyle);

  @override
  get dangerStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.danger,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: colorTheme.danger,
          borderColor: colorTheme.danger,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: colorTheme.danger,
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.danger,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.danger,
        ),
      }.merge(super.dangerStyle);

  @override
  get warningStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.warning,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: colorTheme.warning,
          borderColor: colorTheme.warning,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: colorTheme.warning,
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.warning,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.warning,
        ),
      }.merge(super.warningStyle);

  @override
  get successStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.success,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: colorTheme.success,
          borderColor: colorTheme.success,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: colorTheme.success,
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.success,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.success,
        ),
      }.merge(super.successStyle);

  @override
  get infoStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.info,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: colorTheme.info,
          borderColor: colorTheme.info,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: colorTheme.info,
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorTheme.info,
          backgroundColor: colorTheme.surface,
          borderColor: colorTheme.info,
        ),
      }.merge(super.infoStyle);
}
