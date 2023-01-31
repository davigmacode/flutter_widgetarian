import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class CheckboxThemeDefaults extends CheckboxThemeData with ThemePreset {
  CheckboxThemeDefaults(this.context, [CheckboxThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => const DrivenCheckboxStyle(
        size: 18.0,
        padding: EdgeInsets.all(9),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(2)),
        borderStyle: BorderStyle.solid,
        borderWidth: 2.0,
        checkmarkWeight: 2.0,
        selectedStyle: CheckboxStyle(borderStyle: BorderStyle.none),
        indeterminateStyle: CheckboxStyle(borderStyle: BorderStyle.none),
        hoveredStyle: CheckboxStyle(overlayRadius: 20.0),
        pressedStyle: CheckboxStyle(overlayRadius: 10.0),
        disabledStyle: CheckboxStyle(
          checkmarkAlpha: CheckboxStyle.disabledCheckmarkAlpha,
          backgroundAlpha: CheckboxStyle.disabledBackgroundAlpha,
          borderAlpha: CheckboxStyle.disabledBorderAlpha,
        ),
      ).merge(super.style);
}

@immutable
class CheckboxThemeM2 extends CheckboxThemeData with ThemePreset {
  CheckboxThemeM2(this.context, [CheckboxThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => DrivenCheckboxStyle(
        borderColor: colorTheme.outline,
        selectedStyle: CheckboxStyle(
          backgroundColor: colorTheme.primary,
        ),
        indeterminateStyle: CheckboxStyle(
          backgroundColor: colorTheme.primary,
        ),
      ).merge(super.style);
}

@immutable
class CheckboxThemeM3 extends CheckboxThemeData with ThemePreset {
  CheckboxThemeM3(this.context, [CheckboxThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => DrivenCheckboxStyle(
        borderColor: colorTheme.outline,
        selectedStyle: CheckboxStyle(
          backgroundColor: colorTheme.primary,
        ),
        indeterminateStyle: CheckboxStyle(
          backgroundColor: colorTheme.primary,
        ),
      ).merge(super.style);
}

@immutable
class CheckboxThemeIos extends CheckboxThemeData with ThemePreset {
  CheckboxThemeIos(this.context, [CheckboxThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => DrivenCheckboxStyle(
        shape: BoxShape.circle,
        borderColor: colorTheme.outline,
        selectedStyle: CheckboxStyle(
          backgroundColor: colorTheme.primary,
        ),
        indeterminateStyle: CheckboxStyle(
          backgroundColor: colorTheme.primary,
        ),
      ).merge(super.style);
}
