import 'package:flutter/widgets.dart';
// import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class TextTileThemeDefaults extends TextTileThemeData with ThemePreset {
  TextTileThemeDefaults(this.context, [TextTileThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => const TextTileStyle(
        spacing: 0.0,
        margin: EdgeInsets.zero,
        align: TextTileAlign.left,
      ).merge(super.style);
}
