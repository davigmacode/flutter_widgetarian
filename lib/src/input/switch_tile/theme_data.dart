import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/switch/style.dart';
import 'package:widgetarian/src/button/style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [SwitchTile].
///
/// Descendant widgets obtain the current [SwitchTileThemeData] object using
/// `SwitchTheme.of(context)`. Instances of [SwitchTileThemeData]
/// can be customized with [SwitchTileThemeData.copyWith] or [SwitchTileThemeData.merge].
@immutable
class SwitchTileThemeData extends ThemeExtension<SwitchTileThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of switch tile widget.
  final Curve curve;

  /// The duration over which to animate the parameters of switch tile widget.
  final Duration duration;

  /// Where to place the control next to a label.
  final ControlAffinity controlAffinity;

  /// The [SwitchStyle] to be applied to the switch tile widget
  final SwitchStyle switchStyle;

  /// The [ButtonStyle] to be applied to the clickable area.
  final ButtonStyle buttonStyle;

  /// Creates a theme data that can be used for [SwitchTileTheme].
  const SwitchTileThemeData({
    required this.curve,
    required this.duration,
    required this.controlAffinity,
    required this.switchStyle,
    required this.buttonStyle,
  });

  /// A [SwitchTileThemeData] with some reasonable default values.
  static const fallback = SwitchTileThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    controlAffinity: ControlAffinity.leading,
    switchStyle: SwitchStyle(padding: EdgeInsets.zero),
    buttonStyle: ButtonStyle.defaults,
  );

  /// Creates a [SwitchTileThemeData] from another one that probably null.
  SwitchTileThemeData.from([SwitchTileThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        controlAffinity = other?.controlAffinity ?? fallback.controlAffinity,
        switchStyle = other?.switchStyle ?? fallback.switchStyle,
        buttonStyle = other?.buttonStyle ?? fallback.buttonStyle;

  /// A [SwitchTileThemeData] with default values.
  factory SwitchTileThemeData.defaults(BuildContext context) =>
      SwitchTileThemeDefaults(context);

  /// A [SwitchTileThemeData] with material 2 default values.
  factory SwitchTileThemeData.m2(BuildContext context) =>
      SwitchTileThemeM2(context);

  /// A [SwitchTileThemeData] with material 3 default values.
  factory SwitchTileThemeData.m3(BuildContext context) =>
      SwitchTileThemeM3(context);

  /// A [SwitchTileThemeData] with ios default values.
  factory SwitchTileThemeData.ios(BuildContext context) =>
      SwitchTileThemeIos(context);

  /// Creates a copy of this [SwitchTileThemeData] but with
  /// the given fields replaced with the new values.
  @override
  SwitchTileThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    SwitchStyle? switchStyle,
    ButtonStyle? buttonStyle,
  }) {
    return SwitchTileThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      controlAffinity: controlAffinity ?? this.controlAffinity,
      switchStyle: this.switchStyle.merge(switchStyle),
      buttonStyle: this.buttonStyle.merge(buttonStyle),
    );
  }

  /// Creates a copy of this [SwitchTileThemeData] but with
  /// the given fields replaced with the new values.
  SwitchTileThemeData merge(SwitchTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      controlAffinity: other.controlAffinity,
      switchStyle: other.switchStyle,
      buttonStyle: other.buttonStyle,
    );
  }

  @override
  SwitchTileThemeData lerp(
      ThemeExtension<SwitchTileThemeData>? other, double t) {
    if (other is! SwitchTileThemeData) return this;
    return SwitchTileThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      controlAffinity: lerpEnum(controlAffinity, other.controlAffinity, t) ??
          controlAffinity,
      switchStyle:
          SwitchStyle.lerp(switchStyle, other.switchStyle, t) ?? switchStyle,
      buttonStyle:
          ButtonStyle.lerp(buttonStyle, other.buttonStyle, t) ?? buttonStyle,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'controlAffinity': controlAffinity,
        'switchStyle': switchStyle,
        'buttonStyle': buttonStyle,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is SwitchTileThemeData && mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => Object.hashAll(toMap().values);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    toMap().entries.forEach((el) {
      properties.add(DiagnosticsProperty(el.key, el.value, defaultValue: null));
    });
  }
}
