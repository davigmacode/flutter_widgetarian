import 'package:flutter/widgets.dart';
// import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'package:widgetarian/src/layout/tiles/text_tile/style.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class ListTileThemeDefaults extends ListTileThemeData with ThemePreset {
  ListTileThemeDefaults(this.context, [ListTileThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => const ListTileStyle(
        margin: EdgeInsets.zero,
        spacing: 0.0,
        spacingEnforced: true,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisExpanded: true,
        childExpanded: true,
        textAlign: TextTileAlign.left,
        textMargin: EdgeInsets.zero,
        textSpacing: 0.0,
      ).merge(super.style);
}
