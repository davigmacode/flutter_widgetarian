import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/preset.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';
import 'theme_data.dart';

@immutable
abstract class SwitchThemePreset extends SwitchThemeData with ThemePreset {
  @protected
  const SwitchThemePreset(this.context) : super.defaults();

  @override
  final BuildContext context;

  /// A [SwitchThemeData] with default values.
  static SwitchThemeData defaults(BuildContext context) =>
      SwitchThemeDefaults(context);

  /// A [SwitchThemeData] with material 2 default values.
  static SwitchThemeData m2(BuildContext context) => SwitchThemeM2(context);

  /// A [SwitchThemeData] with material 3 default values.
  static SwitchThemeData m3(BuildContext context) => SwitchThemeM3(context);

  /// A [SwitchThemeData] with ios default values.
  static SwitchThemeData ios(BuildContext context) => SwitchThemeIos(context);
}

@immutable
class SwitchThemeDefaults extends SwitchThemePreset {
  const SwitchThemeDefaults(super.context);
}

@immutable
class SwitchThemeM2 extends SwitchThemePreset {
  const SwitchThemeM2(super.context);

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
      );
}

@immutable
class SwitchThemeM3 extends SwitchThemePreset {
  const SwitchThemeM3(super.context);

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
      );
}

@immutable
class SwitchThemeIos extends SwitchThemePreset {
  const SwitchThemeIos(super.context);

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
      );
}
