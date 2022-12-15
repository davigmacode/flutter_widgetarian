import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:widgetarian/utils.dart';

@immutable
class TileStyle with Diagnosticable {
  final Axis? direction;
  final EdgeInsetsGeometry? margin;
  final double? spacing;
  final bool? spacingEnforced;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? mainAxisExpanded;
  final bool? childExpanded;

  /// Default [TileStyle] constructor.
  const TileStyle({
    this.direction,
    this.margin,
    this.spacing,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisExpanded,
    this.childExpanded,
  });

  /// An [TileStyle] with some reasonable default values.
  static const defaults = TileStyle(
    direction: Axis.horizontal,
    margin: EdgeInsets.zero,
    spacing: 0.0,
    spacingEnforced: false,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisExpanded: false,
    childExpanded: false,
  );

  /// Create a [TileStyle] from another style
  TileStyle.from(TileStyle? other)
      : direction = other?.direction,
        margin = other?.margin,
        spacing = other?.spacing,
        spacingEnforced = other?.spacingEnforced,
        crossAxisAlignment = other?.crossAxisAlignment,
        mainAxisAlignment = other?.mainAxisAlignment,
        mainAxisExpanded = other?.mainAxisExpanded,
        childExpanded = other?.childExpanded;

  /// Creates a copy of this [TileStyle] but with
  /// the given fields replaced with the new values.
  TileStyle copyWith({
    Axis? direction,
    EdgeInsetsGeometry? margin,
    double? spacing,
    bool? spacingEnforced,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    bool? mainAxisExpanded,
    bool? childExpanded,
  }) {
    return TileStyle(
      direction: direction ?? this.direction,
      margin: margin ?? this.margin,
      spacing: spacing ?? this.spacing,
      spacingEnforced: spacingEnforced ?? this.spacingEnforced,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisExpanded: mainAxisExpanded ?? this.mainAxisExpanded,
      childExpanded: childExpanded ?? this.childExpanded,
    );
  }

  /// Creates a copy of this [TileStyle] but with
  /// the given fields replaced with the new values.
  TileStyle merge(TileStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      direction: other.direction,
      margin: other.margin,
      spacing: other.spacing,
      spacingEnforced: other.spacingEnforced,
      crossAxisAlignment: other.crossAxisAlignment,
      mainAxisAlignment: other.mainAxisAlignment,
      mainAxisExpanded: other.mainAxisExpanded,
      childExpanded: other.childExpanded,
    );
  }

  /// Linearly interpolate between two [TileStyle] objects.
  static TileStyle? lerp(TileStyle? a, TileStyle? b, double t) {
    if (a == null && b == null) return null;
    return TileStyle(
      direction: lerpEnum(a?.direction, b?.direction, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      spacingEnforced: lerpBool(a?.spacingEnforced, b?.spacingEnforced, t),
      crossAxisAlignment:
          lerpEnum(a?.crossAxisAlignment, b?.crossAxisAlignment, t),
      mainAxisAlignment:
          lerpEnum(a?.mainAxisAlignment, b?.mainAxisAlignment, t),
      mainAxisExpanded: lerpBool(a?.mainAxisExpanded, b?.mainAxisExpanded, t),
      childExpanded: lerpBool(a?.childExpanded, b?.childExpanded, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'direction': direction,
        'margin': margin,
        'spacing': spacing,
        'spacingEnforced': spacingEnforced,
        'crossAxisAlignment': crossAxisAlignment,
        'mainAxisAlignment': mainAxisAlignment,
        'mainAxisExpanded': mainAxisExpanded,
        'childExpanded': childExpanded,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is TileStyle && mapEquals(other.toMap(), toMap());
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
