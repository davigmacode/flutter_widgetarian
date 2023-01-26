import 'package:flutter/widgets.dart';
// import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class ToggleIconThemeDefaults extends ToggleIconThemeData with ThemePreset {
  ToggleIconThemeDefaults(this.context, [ToggleIconThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => DrivenToggleIconStyle.fade(
        backColor: appTheme.iconTheme.color,
        color: appTheme.colorScheme.primary,
      ).merge(super.style);
}
