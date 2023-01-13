import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/extension/severity.dart';
import 'types.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
abstract class SheetThemePreset extends SheetThemeData {
  @protected
  const SheetThemePreset(this.context)
      : super(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 200),
          style: const SheetStyle(),
        );

  @protected
  final BuildContext context;

  @protected
  get appTheme => Theme.of(context);

  @protected
  get severityTheme => SeverityTheme.of(context);

  /// An [SheetThemeData] with some severities default values.
  static SheetThemeData severity(BuildContext context) =>
      _SheetPresetSeverity(context);

  /// An [SheetThemeData] with material 2 default values.
  static SheetThemeData m2(BuildContext context) => _SheetPresetM2(context);

  /// An [SheetThemeData] with material 3 default values.
  static SheetThemeData m3(BuildContext context) => _SheetPresetM3(context);
}

@immutable
class _SheetPresetSeverity extends SheetThemePreset {
  const _SheetPresetSeverity(super.context);

  @override
  get severities => {
        SheetSeverity.danger: SheetStyle(
          borderColor: severityTheme.danger,
          backgroundColor: severityTheme.danger,
          foregroundColor: severityTheme.danger,
        ),
        SheetSeverity.warning: SheetStyle(
          borderColor: severityTheme.warning,
          backgroundColor: severityTheme.warning,
          foregroundColor: severityTheme.warning,
        ),
        SheetSeverity.success: SheetStyle(
          borderColor: severityTheme.success,
          backgroundColor: severityTheme.success,
          foregroundColor: severityTheme.success,
        ),
        SheetSeverity.info: SheetStyle(
          borderColor: severityTheme.info,
          backgroundColor: severityTheme.info,
          foregroundColor: severityTheme.info,
        ),
      };
}

@immutable
class _SheetPresetM2 extends SheetThemePreset {
  const _SheetPresetM2(super.context);

  @override
  get style => SheetStyle(
        foregroundColor: appTheme.colorScheme.onSurface,
        backgroundColor: appTheme.unselectedWidgetColor,
        borderColor: appTheme.colorScheme.outline,
        shadowColor: appTheme.shadowColor,
      );

  @override
  get variants => {
        SheetVariant.filled: SheetStyle(
          backgroundColor: appTheme.unselectedWidgetColor,
        ),
        SheetVariant.elevated: SheetStyle(
          backgroundColor: appTheme.colorScheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          backgroundColor: appTheme.colorScheme.surface,
        ),
      };
}

@immutable
class _SheetPresetM3 extends SheetThemePreset {
  const _SheetPresetM3(super.context);

  @override
  get style => SheetStyle(
        foregroundColor: appTheme.colorScheme.onSurface,
        backgroundColor: appTheme.unselectedWidgetColor,
        borderColor: appTheme.colorScheme.outline,
        shadowColor: appTheme.colorScheme.shadow,
      );

  @override
  get variants => {
        SheetVariant.filled: SheetStyle(
          backgroundColor: appTheme.colorScheme.surfaceVariant,
        ),
        SheetVariant.elevated: SheetStyle(
          surfaceTint: appTheme.colorScheme.surfaceTint,
          backgroundColor: appTheme.colorScheme.surface,
        ),
        SheetVariant.outlined: SheetStyle(
          backgroundColor: appTheme.colorScheme.surface,
        ),
      };
}
