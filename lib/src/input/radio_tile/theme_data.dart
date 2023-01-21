import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/radio/style.dart';
import 'package:widgetarian/src/button/style.dart';

/// Defines the visual properties of [RadioTile].
///
/// Descendant widgets obtain the current [RadioTileThemeData] object using
/// `RadioTheme.of(context)`. Instances of [RadioTileThemeData]
/// can be customized with [RadioTileThemeData.copyWith] or [RadioTileThemeData.merge].
@immutable
class RadioTileThemeData extends ThemeExtension<RadioTileThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of radio tile widget.
  final Curve curve;

  /// The duration over which to animate the parameters of radio tile widget.
  final Duration duration;

  /// Where to place the control next to a label.
  final ControlAffinity controlAffinity;

  /// The [RadioStyle] to be applied to the radio tile widget
  final RadioStyle radioStyle;

  /// The [ButtonStyle] to be applied to the clickable area.
  final ButtonStyle buttonStyle;

  /// Creates a theme data that can be used for [RadioTileTheme].
  const RadioTileThemeData({
    required this.curve,
    required this.duration,
    required this.controlAffinity,
    required this.radioStyle,
    required this.buttonStyle,
  });

  /// An [RadioTileThemeData] with some reasonable default values.
  const RadioTileThemeData.defaults()
      : curve = Curves.linear,
        duration = const Duration(milliseconds: 200),
        controlAffinity = ControlAffinity.leading,
        radioStyle = const DrivenRadioStyle(padding: EdgeInsets.zero),
        buttonStyle = const DrivenButtonStyle.text();

  /// Creates a copy of this [RadioTileThemeData] but with
  /// the given fields replaced with the new values.
  @override
  RadioTileThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    RadioStyle? radioStyle,
    ButtonStyle? buttonStyle,
  }) {
    return RadioTileThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      controlAffinity: controlAffinity ?? this.controlAffinity,
      radioStyle: this.radioStyle.merge(radioStyle),
      buttonStyle: this.buttonStyle.merge(buttonStyle),
    );
  }

  /// Creates a copy of this [RadioTileThemeData] but with
  /// the given fields replaced with the new values.
  RadioTileThemeData merge(RadioTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      controlAffinity: other.controlAffinity,
      radioStyle: other.radioStyle,
      buttonStyle: other.buttonStyle,
    );
  }

  @override
  RadioTileThemeData lerp(ThemeExtension<RadioTileThemeData>? other, double t) {
    if (other is! RadioTileThemeData) return this;
    return RadioTileThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      controlAffinity: lerpEnum(controlAffinity, other.controlAffinity, t) ??
          controlAffinity,
      radioStyle:
          RadioStyle.lerp(radioStyle, other.radioStyle, t) ?? radioStyle,
      buttonStyle:
          ButtonStyle.lerp(buttonStyle, other.buttonStyle, t) ?? buttonStyle,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'controlAffinity': controlAffinity,
        'radioStyle': radioStyle,
        'buttonStyle': buttonStyle,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is RadioTileThemeData && mapEquals(other.toMap(), toMap());
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
