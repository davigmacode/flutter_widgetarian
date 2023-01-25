import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [Badge].
///
/// Descendant widgets obtain the current [BadgeThemeData] object using
/// `BadgeTheme.of(context)`. Instances of [BadgeThemeData]
/// can be customized with [BadgeThemeData.copyWith] or [BadgeThemeData.merge].
@immutable
class BadgeThemeData extends ThemeExtension<BadgeThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of badge widget.
  final Curve curve;

  /// The duration over which to animate the parameters of badge widget.
  final Duration duration;

  /// Align the badge content within the child.
  final AlignmentGeometry alignment;

  /// Offset of the badge content
  final Offset offset;

  /// The [BadgeStyle] to be applied to the badge widget
  final BadgeStyle style;

  /// Creates a theme data that can be used for [BadgeTheme].
  const BadgeThemeData({
    required this.curve,
    required this.duration,
    required this.alignment,
    required this.offset,
    required this.style,
  });

  /// An [BadgeThemeData] with some reasonable default values.
  static const fallback = BadgeThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    alignment: Alignment.topRight,
    offset: Offset.zero,
    style: BadgeStyle.defaults,
  );

  /// Creates a [BadgeThemeData] from another one that probably null.
  BadgeThemeData.from([BadgeThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        alignment = other?.alignment ?? fallback.alignment,
        offset = other?.offset ?? fallback.offset,
        style = other?.style ?? fallback.style;

  /// A [BadgeThemeData] with default values.
  factory BadgeThemeData.defaults(BuildContext context) =>
      BadgeThemeDefaults(context);

  /// Creates a copy of this [BadgeThemeData] but with
  /// the given fields replaced with the new values.
  @override
  BadgeThemeData copyWith({
    Curve? curve,
    Duration? duration,
    AlignmentGeometry? alignment,
    Offset? offset,
    BadgeStyle? style,
  }) {
    return BadgeThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      alignment: alignment ?? this.alignment,
      offset: offset ?? this.offset,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [BadgeThemeData] but with
  /// the given fields replaced with the new values.
  BadgeThemeData merge(BadgeThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      alignment: other.alignment,
      offset: other.offset,
      style: other.style,
    );
  }

  @override
  BadgeThemeData lerp(ThemeExtension<BadgeThemeData>? other, double t) {
    if (other is! BadgeThemeData) return this;
    return BadgeThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      alignment:
          AlignmentGeometry.lerp(alignment, other.alignment, t) ?? alignment,
      offset: Offset.lerp(offset, other.offset, t) ?? offset,
      style: BadgeStyle.lerp(style, other.style, t) ?? style,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'alignment': alignment,
        'offset': offset,
        'style': style,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is BadgeThemeData && mapEquals(other.toMap(), toMap());
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
