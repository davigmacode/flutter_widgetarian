import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class RadioThemeDefaults extends RadioThemeData with ThemePreset {
  RadioThemeDefaults(this.context, [RadioThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => const DrivenRadioStyle(
        size: 18.0,
        shape: BoxShape.circle,
        padding: EdgeInsets.all(9),
        borderStyle: BorderStyle.solid,
        borderRadius: BorderRadius.zero,
        borderWidth: 2.0,
        thumbOpacity: 0,
        thumbInset: 1,
        selectedStyle: RadioStyle(
          thumbInset: .45,
          thumbOpacity: 1,
        ),
        hoveredStyle: RadioStyle(overlayRadius: 20.0),
        pressedStyle: RadioStyle(overlayRadius: 10.0),
        disabledStyle: RadioStyle(
          backgroundAlpha: RadioStyle.disabledBackgroundAlpha,
          borderAlpha: RadioStyle.disabledBorderAlpha,
        ),
      ).merge(super.style);
}

@immutable
class RadioThemeM2 extends RadioThemeData with ThemePreset {
  RadioThemeM2(this.context, [RadioThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

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
      ).merge(super.style);
}

@immutable
class RadioThemeM3 extends RadioThemeData with ThemePreset {
  RadioThemeM3(this.context, [RadioThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

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
      ).merge(super.style);
}
