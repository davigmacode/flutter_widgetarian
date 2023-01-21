import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
abstract class RadioThemePreset extends RadioThemeData with ThemePreset {
  @protected
  const RadioThemePreset(this.context) : super.defaults();

  @override
  final BuildContext context;

  /// A [RadioThemeData] with material 2 default values.
  static RadioThemeData m2(BuildContext context) => RadioThemeM2(context);

  /// A [RadioThemeData] with material 3 default values.
  static RadioThemeData m3(BuildContext context) => RadioThemeM3(context);
}

@immutable
class RadioThemeM2 extends RadioThemePreset {
  const RadioThemeM2(super.context);

  @override
  get style => DrivenRadioStyle(
        borderColor: appTheme.colorScheme.outline,
        thumbColor: Colors.transparent,
        selectedStyle: RadioStyle(
          borderColor: isLight
              ? appTheme.colorScheme.primary
              : appTheme.colorScheme.inversePrimary,
          thumbColor: isLight
              ? appTheme.colorScheme.primary
              : appTheme.colorScheme.inversePrimary,
        ),
      );
}

@immutable
class RadioThemeM3 extends RadioThemePreset {
  const RadioThemeM3(super.context);

  @override
  get style => DrivenRadioStyle(
        borderColor: appTheme.colorScheme.outline,
        thumbColor: Colors.transparent,
        selectedStyle: RadioStyle(
          borderColor: isLight
              ? appTheme.colorScheme.primary
              : appTheme.colorScheme.inversePrimary,
          thumbColor: isLight
              ? appTheme.colorScheme.primary
              : appTheme.colorScheme.inversePrimary,
        ),
      );
}
