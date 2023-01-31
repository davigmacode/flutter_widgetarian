import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
// import 'package:widgetarian/src/input/foundation.dart';
// import 'package:widgetarian/src/input/switch/style.dart';
import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

@immutable
class SwitchTileThemeDefaults extends SwitchTileThemeData with ThemePreset {
  SwitchTileThemeDefaults(this.context, [SwitchTileThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;
}

@immutable
class SwitchTileThemeM2 extends SwitchTileThemeData with ThemePreset {
  SwitchTileThemeM2(this.context, [SwitchTileThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;
}

@immutable
class SwitchTileThemeM3 extends SwitchTileThemeData with ThemePreset {
  SwitchTileThemeM3(this.context, [SwitchTileThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  get buttonStyle => const ButtonStyle(overlayDisabled: true);
}

@immutable
class SwitchTileThemeIos extends SwitchTileThemeData with ThemePreset {
  SwitchTileThemeIos(this.context, [SwitchTileThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  get buttonStyle => const ButtonStyle(overlayDisabled: true);
}
