import 'package:flutter/widgets.dart';
// import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class AlertThemeDefaults extends AlertThemeData with ThemePreset {
  AlertThemeDefaults(this.context, [AlertThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => const AlertStyle(
        variant: AlertVariant.tonal,
        padding: EdgeInsets.all(20),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        foregroundSpacing: 15.0,
        iconSize: 20.0,
      ).merge(super.style);
}
