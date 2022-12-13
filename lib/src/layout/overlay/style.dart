import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:widgetarian/utils.dart';

@immutable
class OverlayStyle with Diagnosticable {
  final Color? color;
  final double? opacity;
  final double? radius;
  final BorderRadius? borderRadius;
  final BoxShape? shape;

  /// Default constructor
  const OverlayStyle({
    this.color,
    this.opacity,
    this.radius,
    this.borderRadius,
    this.shape,
  });

  /// Create a [OverlayStyle] from another style
  OverlayStyle.from(OverlayStyle? other)
      : color = other?.color,
        opacity = other?.opacity,
        radius = other?.radius,
        borderRadius = other?.borderRadius,
        shape = other?.shape;

  /// An [OverlayStyle] with some reasonable default values.
  const OverlayStyle.fallback()
      : color = Colors.black,
        opacity = 0.0,
        radius = 0.0,
        borderRadius = BorderRadius.zero,
        shape = BoxShape.circle;

  /// Creates a copy of this [OverlayStyle] but with
  /// the given fields replaced with the new values.
  OverlayStyle copyWith({
    Color? color,
    double? opacity,
    double? radius,
    BorderRadius? borderRadius,
    BoxShape? shape,
  }) {
    return OverlayStyle(
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
      radius: radius ?? this.radius,
      borderRadius: borderRadius ?? this.borderRadius,
      shape: shape ?? this.shape,
    );
  }

  /// Creates a copy of this [OverlayStyle] but with
  /// the given fields replaced with the new values.
  OverlayStyle merge(OverlayStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      color: other.color,
      opacity: other.opacity,
      radius: other.radius,
      borderRadius: other.borderRadius,
      shape: other.shape,
    );
  }

  /// Linearly interpolate between two [OverlayStyle] objects.
  static OverlayStyle lerp(OverlayStyle? a, OverlayStyle? b, double t) {
    return OverlayStyle(
      color: Color.lerp(a?.color, b?.color, t),
      opacity: lerpDouble(a?.opacity, b?.opacity, t),
      radius: lerpDouble(a?.radius, b?.radius, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      shape: lerpEnum(a?.shape, b?.shape, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'color': color,
        'opacity': opacity,
        'radius': radius,
        'borderRadius': borderRadius,
        'shape': shape,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is OverlayStyle && mapEquals(other.toMap(), toMap());
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
