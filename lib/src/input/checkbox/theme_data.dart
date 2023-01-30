import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [Checkbox].
///
/// Descendant widgets obtain the current [CheckboxThemeData] object using
/// `CheckboxTheme.of(context)`. Instances of [CheckboxThemeData]
/// can be customized with [CheckboxThemeData.copyWith] or [CheckboxThemeData.merge].
@immutable
class CheckboxThemeData extends ThemeExtension<CheckboxThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of checkbox widget.
  final Curve curve;

  /// The duration over which to animate the parameters of checkbox widget.
  final Duration duration;

  /// The [CheckboxStyle] to be applied to the checkbox widget
  final CheckboxStyle style;

  /// Creates a theme data that can be used for [CheckboxTheme].
  const CheckboxThemeData({
    required this.curve,
    required this.duration,
    required this.style,
  });

  /// A [CheckboxThemeData] with some reasonable default values.
  static const fallback = CheckboxThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: CheckboxStyle(),
  );

  /// Creates a [CheckboxThemeData] from another one that probably null.
  CheckboxThemeData.from([CheckboxThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        style = other?.style ?? fallback.style;

  /// A [CheckboxThemeData] with default values.
  factory CheckboxThemeData.defaults(BuildContext context) =>
      CheckboxThemeDefaults(context);

  /// A [CheckboxThemeData] with material 2 default values.
  factory CheckboxThemeData.m2(BuildContext context) =>
      CheckboxThemeM2(context);

  /// A [CheckboxThemeData] with material 3 default values.
  factory CheckboxThemeData.m3(BuildContext context) =>
      CheckboxThemeM3(context);

  /// A [CheckboxThemeData] with ios default values.
  factory CheckboxThemeData.ios(BuildContext context) =>
      CheckboxThemeIos(context);

  /// Creates a copy of this [CheckboxThemeData] but with
  /// the given fields replaced with the new values.
  @override
  CheckboxThemeData copyWith({
    Curve? curve,
    Duration? duration,
    CheckboxStyle? style,
  }) {
    return CheckboxThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [CheckboxThemeData] but with
  /// the given fields replaced with the new values.
  CheckboxThemeData merge(CheckboxThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      style: other.style,
    );
  }

  @override
  CheckboxThemeData lerp(ThemeExtension<CheckboxThemeData>? other, double t) {
    if (other is! CheckboxThemeData) return this;
    return CheckboxThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      style: CheckboxStyle.lerp(style, other.style, t) ?? style,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'style': style,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is CheckboxThemeData && mapEquals(other.toMap(), toMap());
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
