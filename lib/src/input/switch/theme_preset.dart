import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
class SwitchThemeDefaults extends SwitchThemeData with ThemePreset {
  SwitchThemeDefaults(this.context, [SwitchThemeData? other])
      : super.from(other);

  @override
  final BuildContext context;
}

@immutable
class SwitchThemeM2 extends SwitchThemeData with ThemePreset {
  SwitchThemeM2(this.context, [SwitchThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => DrivenSwitchStyle(
        size: const Size(36, 20),
        padding: const EdgeInsets.all(9),
        trackBorderWidth: 0,
        trackHeight: 14,
        thumbSize: 20,
        thumbElevation: 2,
        trackColor: appTheme.unselectedWidgetColor,
        thumbColor: Colors.white,
        selectedStyle: SwitchStyle(
          thumbSize: 20,
          trackColor: isLight
              ? appTheme.colorScheme.primary
              : appTheme.colorScheme.inversePrimary,
        ),
        hoveredStyle: const SwitchStyle(overlayRadius: 20.0),
        pressedStyle: const SwitchStyle(overlayRadius: 10.0),
        disabledStyle: const SwitchStyle(
          trackAlpha: SwitchStyle.disabledTrackAlpha,
          thumbAlpha: SwitchStyle.disabledThumbAlpha,
        ),
      ).merge(super.style);
}

@immutable
class SwitchThemeM3 extends SwitchThemeData with ThemePreset {
  SwitchThemeM3(this.context, [SwitchThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => DrivenSwitchStyle(
        size: const Size(52, 32),
        padding: const EdgeInsets.all(9),
        trackBorderWidth: 2,
        trackHeight: 32,
        thumbSize: 16,
        thumbElevation: 2,
        trackBorderColor: appTheme.colorScheme.outline,
        trackColor: appTheme.colorScheme.surfaceVariant,
        thumbColor: appTheme.colorScheme.onSurfaceVariant,
        selectedStyle: SwitchStyle(
          thumbSize: 24,
          trackBorderWidth: 0,
          trackColor: appTheme.colorScheme.primary,
          thumbColor: appTheme.colorScheme.onPrimary,
        ),
        hoveredStyle: const SwitchStyle(
          overlayRadius: 20.0,
        ),
        pressedStyle: const SwitchStyle(
          overlayRadius: 10.0,
          thumbSize: 30,
        ),
        disabledStyle: const SwitchStyle(
          trackBorderAlpha: SwitchStyle.disabledTrackBorderAlpha,
          trackAlpha: SwitchStyle.disabledTrackAlpha,
          thumbAlpha: SwitchStyle.disabledThumbAlpha,
        ),
      ).merge(super.style);
}

@immutable
class SwitchThemeIos extends SwitchThemeData with ThemePreset {
  SwitchThemeIos(this.context, [SwitchThemeData? other]) : super.from(other);

  @override
  final BuildContext context;

  @override
  get style => DrivenSwitchStyle(
        size: const Size(52, 32),
        padding: const EdgeInsets.all(9),
        trackBorderWidth: 0,
        trackHeight: 32,
        thumbSize: 26,
        thumbElevation: 2,
        trackColor: appTheme.colorScheme.surfaceVariant,
        thumbColor:
            isLight ? Colors.white : appTheme.colorScheme.onSurfaceVariant,
        selectedStyle: SwitchStyle(
          thumbSize: 26,
          trackColor: appTheme.colorScheme.primary,
          thumbColor: appTheme.colorScheme.onPrimary,
        ),
        hoveredStyle: const SwitchStyle(
          overlayRadius: 20.0,
        ),
        pressedStyle: const SwitchStyle(
          overlayRadius: 10.0,
          thumbSize: 26,
        ),
        disabledStyle: const SwitchStyle(
          trackAlpha: SwitchStyle.disabledTrackAlpha,
          thumbAlpha: SwitchStyle.disabledThumbAlpha,
        ),
      ).merge(super.style);
}
