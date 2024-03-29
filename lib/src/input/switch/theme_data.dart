import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [Switch].
///
/// Descendant widgets obtain the current [SwitchThemeData] object using
/// `SwitchTheme.of(context)`. Instances of [SwitchThemeData]
/// can be customized with [SwitchThemeData.copyWith] or [SwitchThemeData.merge].
@immutable
class SwitchThemeData extends ThemeExtension<SwitchThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of [Switch] widget.
  final Curve curve;

  /// The duration over which to animate the parameters of [Switch] widget.
  final Duration duration;

  /// The [SwitchStyle] to be applied to the [Switch] widget
  final SwitchStyle style;

  /// Creates a theme data that can be used for [SwitchTheme].
  const SwitchThemeData({
    required this.curve,
    required this.duration,
    required this.style,
  });

  /// A [SwitchThemeData] with some reasonable default values.
  static const fallback = SwitchThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: SwitchStyle(),
  );

  /// Creates a [SwitchThemeData] from another one that probably null.
  SwitchThemeData.from([SwitchThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        style = other?.style ?? fallback.style;

  /// A [SwitchThemeData] with default values.
  factory SwitchThemeData.defaults(BuildContext context) =>
      SwitchThemeDefaults(context);

  /// A [SwitchThemeData] with material 2 default values.
  factory SwitchThemeData.m2(BuildContext context) => SwitchThemeM2(context);

  /// A [SwitchThemeData] with material 3 default values.
  factory SwitchThemeData.m3(BuildContext context) => SwitchThemeM3(context);

  /// A [SwitchThemeData] with ios default values.
  factory SwitchThemeData.ios(BuildContext context) => SwitchThemeIos(context);

  /// Creates a copy of this [SwitchThemeData] but with
  /// the given fields replaced with the new values.
  @override
  SwitchThemeData copyWith({
    Curve? curve,
    Duration? duration,
    SwitchStyle? style,
  }) {
    return SwitchThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [SwitchThemeData] but with
  /// the given fields replaced with the new values.
  SwitchThemeData merge(SwitchThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      style: other.style,
    );
  }

  @override
  SwitchThemeData lerp(ThemeExtension<SwitchThemeData>? other, double t) {
    if (other is! SwitchThemeData) return this;
    return SwitchThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      style: SwitchStyle.lerp(style, other.style, t) ?? style,
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
    return other is SwitchThemeData && mapEquals(other.toMap(), toMap());
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
