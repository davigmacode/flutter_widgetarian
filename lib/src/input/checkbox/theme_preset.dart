import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
abstract class CheckboxThemePreset extends CheckboxThemeData with ThemePreset {
  @protected
  const CheckboxThemePreset(this.context) : super.defaults();

  @override
  final BuildContext context;

  /// A [CheckboxThemeData] with material 2 default values.
  static CheckboxThemeData m2(BuildContext context) => CheckboxThemeM2(context);

  /// A [CheckboxThemeData] with material 3 default values.
  static CheckboxThemeData m3(BuildContext context) => CheckboxThemeM3(context);
}

@immutable
class CheckboxThemeM2 extends CheckboxThemePreset {
  const CheckboxThemeM2(super.context);

  @override
  get style => DrivenCheckboxStyle(
        borderColor: appTheme.colorScheme.outline,
        selectedStyle: CheckboxStyle(
          backgroundColor: isLight
              ? appTheme.colorScheme.primary
              : appTheme.colorScheme.inversePrimary,
        ),
        indeterminateStyle: CheckboxStyle(
          backgroundColor: isLight
              ? appTheme.colorScheme.primary
              : appTheme.colorScheme.inversePrimary,
        ),
      );
}

@immutable
class CheckboxThemeM3 extends CheckboxThemePreset {
  const CheckboxThemeM3(super.context);

  @override
  get style => DrivenCheckboxStyle(
        borderColor: appTheme.colorScheme.outline,
        selectedStyle: CheckboxStyle(
          backgroundColor: isLight
              ? appTheme.colorScheme.primary
              : appTheme.colorScheme.inversePrimary,
        ),
        indeterminateStyle: CheckboxStyle(
          backgroundColor: isLight
              ? appTheme.colorScheme.primary
              : appTheme.colorScheme.inversePrimary,
        ),
      );
}
