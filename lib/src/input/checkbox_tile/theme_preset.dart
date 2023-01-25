import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
// import 'package:widgetarian/src/input/foundation.dart';
// import 'package:widgetarian/src/input/checkbox/style.dart';
// import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

@immutable
class CheckboxTileThemeDefaults extends CheckboxTileThemeData with ThemePreset {
  CheckboxTileThemeDefaults(this.context, [CheckboxTileThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;
}
