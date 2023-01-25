import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
// import 'package:widgetarian/src/input/foundation.dart';
// import 'package:widgetarian/src/input/radio/style.dart';
// import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

@immutable
class RadioTileThemeDefaults extends RadioTileThemeData with ThemePreset {
  RadioTileThemeDefaults(this.context, [RadioTileThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;
}
