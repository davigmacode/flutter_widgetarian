import 'package:flutter/widgets.dart';
// import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'theme_data.dart';

@immutable
class AvatarThemeDefaults extends AvatarThemeData with ThemePreset {
  AvatarThemeDefaults(this.context, [AvatarThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;
}
