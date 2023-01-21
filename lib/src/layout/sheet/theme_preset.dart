import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'types.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
abstract class SheetThemePreset extends SheetThemeData with ThemePreset {
  @protected
  const SheetThemePreset(this.context) : super.defaults();

  @override
  final BuildContext context;

  /// A [SheetThemeData] with some default values.
  static SheetThemeData defaults(BuildContext context) =>
      SheetThemeDefaults(context);

  /// A [SheetThemeData] with material 2 default values.
  static SheetThemeData m2(BuildContext context) => SheetThemeM2(context);

  /// A [SheetThemeData] with material 3 default values.
  static SheetThemeData m3(BuildContext context) => SheetThemeM3(context);
}

@immutable
class SheetThemeDefaults extends SheetThemePreset {
  const SheetThemeDefaults(super.context);

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
      };

  @override
  get dangerStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: severityTheme.danger,
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: severityTheme.danger,
          backgroundColor: severityTheme.danger,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: severityTheme.danger,
          borderColor: severityTheme.danger,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: severityTheme.danger,
          foregroundColor: severityTheme.danger,
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: severityTheme.danger,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.danger,
        ),
      };

  @override
  get warningStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: severityTheme.warning,
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: severityTheme.warning,
          backgroundColor: severityTheme.warning,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: severityTheme.warning,
          borderColor: severityTheme.warning,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: severityTheme.warning,
          foregroundColor: severityTheme.warning,
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: severityTheme.warning,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.warning,
        ),
      };

  @override
  get successStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: severityTheme.success,
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: severityTheme.success,
          backgroundColor: severityTheme.success,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: severityTheme.success,
          borderColor: severityTheme.success,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: severityTheme.success,
          foregroundColor: severityTheme.success,
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: severityTheme.success,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.success,
        ),
      };

  @override
  get infoStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: severityTheme.info,
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: severityTheme.info,
          backgroundColor: severityTheme.info,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: severityTheme.info,
          borderColor: severityTheme.info,
        ),
        SheetVariant.elevated: SheetStyle(
          shadowColor: severityTheme.info,
          foregroundColor: severityTheme.info,
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: severityTheme.info,
          backgroundColor: colorScheme.surface,
          borderColor: severityTheme.info,
        ),
      };
}

@immutable
class SheetThemeM2 extends SheetThemePreset {
  const SheetThemeM2(super.context);

  @override
  get style => SheetStyle(
        borderColor: colorScheme.outline,
        shadowColor: appTheme.shadowColor,
      );

  @override
  get variantStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: colorScheme.onSurface,
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          foregroundColor: colorScheme.onSurface,
          backgroundColor: appTheme.unselectedWidgetColor,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: appTheme.unselectedWidgetColor,
        ),
        SheetVariant.elevated: SheetStyle(
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: colorScheme.onSurface,
          backgroundColor: colorScheme.surface,
        ),
      };
}

@immutable
class SheetThemeM3 extends SheetThemePreset {
  const SheetThemeM3(super.context);

  @override
  get style => SheetStyle(
        borderColor: colorScheme.outline,
        shadowColor: colorScheme.shadow,
      );

  @override
  get variantStyle => {
        SheetVariant.text: SheetStyle(
          foregroundColor: appTheme.colorScheme.onSurface,
          backgroundColor: colorScheme.surface,
        ),
        SheetVariant.tonal: SheetStyle(
          backgroundOpacity: .3,
          foregroundColor: appTheme.colorScheme.onSurface,
          backgroundColor: appTheme.colorScheme.surfaceVariant,
        ),
        SheetVariant.filled: SheetStyle(
          backgroundColor: appTheme.colorScheme.surfaceVariant,
        ),
        SheetVariant.elevated: SheetStyle(
          surfaceTint: appTheme.colorScheme.surfaceTint,
          backgroundColor: appTheme.colorScheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          foregroundColor: appTheme.colorScheme.onSurface,
          backgroundColor: appTheme.colorScheme.surface,
        ),
      };
}
