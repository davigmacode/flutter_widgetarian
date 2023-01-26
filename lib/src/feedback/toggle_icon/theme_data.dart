import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [ToggleIcon].
///
/// Descendant widgets obtain the current [ToggleIconThemeData] object using
/// `ToggleIconTheme.of(context)`. Instances of [ToggleIconThemeData]
/// can be customized with [ToggleIconThemeData.copyWith] or [ToggleIconThemeData.merge].
@immutable
class ToggleIconThemeData extends ThemeExtension<ToggleIconThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of [ToggleIcon] widget.
  final Curve curve;

  /// The duration over which to animate the parameters of [ToggleIcon] widget.
  final Duration duration;

  /// The [ToggleIconStyle] to be applied to the [ToggleIcon] widget
  final ToggleIconStyle style;

  /// Creates a theme data that can be used for [ToggleIconTheme].
  const ToggleIconThemeData({
    required this.curve,
    required this.duration,
    required this.style,
  });

  /// An [ToggleIconThemeData] with some reasonable default values.
  static const fallback = ToggleIconThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: ToggleIconStyle(),
  );

  /// Creates a [ToggleIconThemeData] from another one that probably null.
  ToggleIconThemeData.from([ToggleIconThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        style = other?.style ?? fallback.style;

  /// A [ToggleIconThemeData] with default values.
  factory ToggleIconThemeData.defaults(BuildContext context) =>
      ToggleIconThemeDefaults(context);

  /// Creates a copy of this [ToggleIconThemeData] but with
  /// the given fields replaced with the new values.
  @override
  ToggleIconThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ToggleIconStyle? style,
  }) {
    return ToggleIconThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [ToggleIconThemeData] but with
  /// the given fields replaced with the new values.
  ToggleIconThemeData merge(ToggleIconThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      style: other.style,
    );
  }

  @override
  ToggleIconThemeData lerp(
      ThemeExtension<ToggleIconThemeData>? other, double t) {
    if (other is! ToggleIconThemeData) return this;
    return ToggleIconThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      style: ToggleIconStyle.lerp(style, other.style, t) ?? style,
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
    return other is ToggleIconThemeData && mapEquals(other.toMap(), toMap());
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
