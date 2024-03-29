import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'style.dart';
import 'theme_preset.dart';

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

  /// A [RadioThemeData] with some reasonable default values.
  static const fallback = RadioThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: RadioStyle(),
  );

  /// Creates a [RadioThemeData] from another one that probably null.
  RadioThemeData.from([RadioThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        style = other?.style ?? fallback.style;

  /// A [RadioThemeData] with default values.
  factory RadioThemeData.defaults(BuildContext context) =>
      RadioThemeDefaults(context);

  /// A [RadioThemeData] with material 2 default values.
  factory RadioThemeData.m2(BuildContext context) => RadioThemeM2(context);

  /// A [RadioThemeData] with material 3 default values.
  factory RadioThemeData.m3(BuildContext context) => RadioThemeM3(context);

  /// A [RadioThemeData] with ios default values.
  factory RadioThemeData.ios(BuildContext context) => RadioThemeIos(context);

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
