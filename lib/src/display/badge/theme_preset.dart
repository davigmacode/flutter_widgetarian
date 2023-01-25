import 'package:flutter/widgets.dart';
// import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'theme_data.dart';

@immutable
class BadgeThemeDefaults extends BadgeThemeData with ThemePreset {
  BadgeThemeDefaults(this.context, [BadgeThemeData? other]) : super.from(other);

  @override
  final BuildContext context;
}
