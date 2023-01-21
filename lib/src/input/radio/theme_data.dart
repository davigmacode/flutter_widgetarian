import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'style.dart';

/// Defines the visual properties of [Radio].
///
/// Descendant widgets obtain the current [RadioThemeData] object using
/// `RadioTheme.of(context)`. Instances of [RadioThemeData]
/// can be customized with [RadioThemeData.copyWith] or [RadioThemeData.merge].
@immutable
class RadioThemeData extends ThemeExtension<RadioThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of radio widget.
  final Curve curve;

  /// The duration over which to animate the parameters of radio widget.
  final Duration duration;

  /// The [RadioStyle] to be applied to the radio widget
  final RadioStyle style;

  /// Creates a theme data that can be used for [RadioTheme].
  const RadioThemeData({
    required this.curve,
    required this.duration,
    required this.style,
  });

  /// An [RadioThemeData] with some reasonable default values.
  const RadioThemeData.defaults()
      : curve = Curves.linear,
        duration = const Duration(milliseconds: 200),
        style = RadioStyle.defaults;

  /// Creates a copy of this [RadioThemeData] but with
  /// the given fields replaced with the new values.
  @override
  RadioThemeData copyWith({
    Curve? curve,
    Duration? duration,
    RadioStyle? style,
  }) {
    return RadioThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [RadioThemeData] but with
  /// the given fields replaced with the new values.
  RadioThemeData merge(RadioThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      style: other.style,
    );
  }

  @override
  RadioThemeData lerp(ThemeExtension<RadioThemeData>? other, double t) {
    if (other is! RadioThemeData) return this;
    return RadioThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      style: RadioStyle.lerp(style, other.style, t) ?? style,
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
    return other is RadioThemeData && mapEquals(other.toMap(), toMap());
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
