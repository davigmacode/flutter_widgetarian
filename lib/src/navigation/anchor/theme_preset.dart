import 'package:flutter/widgets.dart';
// import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class AnchorThemeDefaults extends AnchorThemeData with ThemePreset {
  AnchorThemeDefaults(this.context, [AnchorThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => const DrivenAnchorStyle(
        shape: BoxShape.rectangle,
        overlayDisabled: false,
        overlayOpacity: 0,
        focusedStyle: AnchorStyle(overlayOpacity: 0.15),
        hoveredStyle: AnchorStyle(overlayOpacity: 0.05),
        pressedStyle: AnchorStyle(overlayOpacity: 0.1),
      ).merge(super.style);
}
