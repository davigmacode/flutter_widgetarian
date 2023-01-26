import 'package:flutter/widgets.dart';
// import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class TileThemeDefaults extends TileThemeData with ThemePreset {
  TileThemeDefaults(this.context, [TileThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => const TileStyle(
        direction: Axis.horizontal,
        margin: EdgeInsets.zero,
        spacing: 0.0,
        spacingEnforced: false,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisExpanded: false,
        childExpanded: false,
      ).merge(super.style);
}
