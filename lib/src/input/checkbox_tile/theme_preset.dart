import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
// import 'package:widgetarian/src/input/foundation.dart';
// import 'package:widgetarian/src/input/checkbox/style.dart';
// import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

@immutable
class CheckboxTileThemePreset extends CheckboxTileThemeData with ThemePreset {
  @protected
  const CheckboxTileThemePreset(this.context) : super.defaults();

  @override
  final BuildContext context;

  /// A [CheckboxTileThemeData] with default values.
  static CheckboxTileThemeData defaults(BuildContext context) =>
      CheckboxTileThemeDefaults(context);
}

@immutable
class CheckboxTileThemeDefaults extends CheckboxTileThemePreset {
  const CheckboxTileThemeDefaults(super.context);
}
