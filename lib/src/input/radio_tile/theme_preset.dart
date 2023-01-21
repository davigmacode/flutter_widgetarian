import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
// import 'package:widgetarian/src/input/foundation.dart';
// import 'package:widgetarian/src/input/radio/style.dart';
// import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

@immutable
class RadioTileThemePreset extends RadioTileThemeData with ThemePreset {
  @protected
  const RadioTileThemePreset(this.context) : super.defaults();

  @override
  final BuildContext context;

  /// A [RadioTileThemeData] with default values.
  static RadioTileThemeData defaults(BuildContext context) =>
      RadioTileThemeDefaults(context);
}

@immutable
class RadioTileThemeDefaults extends RadioTileThemePreset {
  const RadioTileThemeDefaults(super.context);
}
