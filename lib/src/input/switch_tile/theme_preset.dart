import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
// import 'package:widgetarian/src/input/foundation.dart';
// import 'package:widgetarian/src/input/switch/style.dart';
// import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

@immutable
class SwitchTileThemePreset extends SwitchTileThemeData with ThemePreset {
  @protected
  const SwitchTileThemePreset(this.context) : super.defaults();

  @override
  final BuildContext context;

  /// A [SwitchTileThemeData] with default values.
  static SwitchTileThemeData defaults(BuildContext context) =>
      SwitchTileThemeDefaults(context);
}

@immutable
class SwitchTileThemeDefaults extends SwitchTileThemePreset {
  const SwitchTileThemeDefaults(super.context);
}
