import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/checkbox/style.dart';
import 'package:widgetarian/src/button/style.dart';

/// Defines the visual properties of [CheckboxTile].
///
/// Descendant widgets obtain the current [CheckboxTileThemeData] object using
/// `CheckboxTheme.of(context)`. Instances of [CheckboxTileThemeData]
/// can be customized with [CheckboxTileThemeData.copyWith] or [CheckboxTileThemeData.merge].
@immutable
class CheckboxTileThemeData extends ThemeExtension<CheckboxTileThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of checkbox tile widget.
  final Curve curve;

  /// The duration over which to animate the parameters of checkbox tile widget.
  final Duration duration;

  /// Where to place the control next to a label.
  final ControlAffinity controlAffinity;

  /// The [CheckboxStyle] to be applied to the checkbox tile widget
  final CheckboxStyle checkboxStyle;

  /// The [ButtonStyle] to be applied to the clickable area.
  final ButtonStyle buttonStyle;

  /// Creates a theme data that can be used for [CheckboxTileTheme].
  const CheckboxTileThemeData({
    required this.curve,
    required this.duration,
    required this.controlAffinity,
    required this.checkboxStyle,
    required this.buttonStyle,
  });

  /// A [CheckboxTileThemeData] with some reasonable default values.
  const CheckboxTileThemeData.defaults()
      : curve = Curves.linear,
        duration = const Duration(milliseconds: 200),
        controlAffinity = ControlAffinity.leading,
        checkboxStyle = const DrivenCheckboxStyle(padding: EdgeInsets.zero),
        buttonStyle = const DrivenButtonStyle.text();

  /// Creates a copy of this [CheckboxTileThemeData] but with
  /// the given fields replaced with the new values.
  @override
  CheckboxTileThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    CheckboxStyle? checkboxStyle,
    ButtonStyle? buttonStyle,
  }) {
    return CheckboxTileThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      controlAffinity: controlAffinity ?? this.controlAffinity,
      checkboxStyle: this.checkboxStyle.merge(checkboxStyle),
      buttonStyle: this.buttonStyle.merge(buttonStyle),
    );
  }

  /// Creates a copy of this [CheckboxTileThemeData] but with
  /// the given fields replaced with the new values.
  CheckboxTileThemeData merge(CheckboxTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      controlAffinity: other.controlAffinity,
      checkboxStyle: other.checkboxStyle,
      buttonStyle: other.buttonStyle,
    );
  }

  @override
  CheckboxTileThemeData lerp(
      ThemeExtension<CheckboxTileThemeData>? other, double t) {
    if (other is! CheckboxTileThemeData) return this;
    return CheckboxTileThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      controlAffinity: lerpEnum(controlAffinity, other.controlAffinity, t) ??
          controlAffinity,
      checkboxStyle:
          CheckboxStyle.lerp(checkboxStyle, other.checkboxStyle, t) ??
              checkboxStyle,
      buttonStyle:
          ButtonStyle.lerp(buttonStyle, other.buttonStyle, t) ?? buttonStyle,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'controlAffinity': controlAffinity,
        'checkboxStyle': checkboxStyle,
        'buttonStyle': buttonStyle,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is CheckboxTileThemeData && mapEquals(other.toMap(), toMap());
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
