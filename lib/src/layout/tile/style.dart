import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:widgetarian/utils.dart';

@immutable
class ListTileStyle with Diagnosticable {
  final EdgeInsetsGeometry? margin;
  final double? spacing;
  final bool? spacingEnforced;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? mainAxisExpanded;

  const ListTileStyle({
    this.margin,
    this.spacing,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisExpanded,
  });

  /// Creates an [ListTileStyle] with some reasonable default values.
  const ListTileStyle.fallback()
      : margin = null,
        spacing = null,
        spacingEnforced = null,
        crossAxisAlignment = CrossAxisAlignment.start,
        mainAxisAlignment = MainAxisAlignment.start,
        mainAxisExpanded = true;

  /// Create a ListTile's style from another style
  ListTileStyle.from(ListTileStyle? other)
      : margin = other?.margin,
        spacing = other?.spacing,
        spacingEnforced = other?.spacingEnforced,
        crossAxisAlignment = other?.crossAxisAlignment,
        mainAxisAlignment = other?.mainAxisAlignment,
        mainAxisExpanded = other?.mainAxisExpanded;

  /// Creates a copy of this [ListTileStyle] but with
  /// the given fields replaced with the new values.
  ListTileStyle copyWith({
    EdgeInsetsGeometry? margin,
    double? spacing,
    bool? spacingEnforced,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    bool? mainAxisExpanded,
  }) {
    return ListTileStyle(
      margin: margin ?? this.margin,
      spacing: spacing ?? this.spacing,
      spacingEnforced: spacingEnforced ?? this.spacingEnforced,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisExpanded: mainAxisExpanded ?? this.mainAxisExpanded,
    );
  }

  /// Creates a copy of this [ListTileStyle] but with
  /// the given fields replaced with the new values.
  ListTileStyle merge(ListTileStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      margin: other.margin,
      spacing: other.spacing,
      spacingEnforced: other.spacingEnforced,
      crossAxisAlignment: other.crossAxisAlignment,
      mainAxisAlignment: other.mainAxisAlignment,
      mainAxisExpanded: other.mainAxisExpanded,
    );
  }

  /// Linearly interpolate between two [ListTileStyle] objects.
  static ListTileStyle lerp(ListTileStyle? a, ListTileStyle? b, double t) {
    return ListTileStyle(
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      spacingEnforced: lerpBool(a?.spacingEnforced, b?.spacingEnforced, t),
      crossAxisAlignment:
          lerpEnum(a?.crossAxisAlignment, b?.crossAxisAlignment, t),
      mainAxisAlignment:
          lerpEnum(a?.mainAxisAlignment, b?.mainAxisAlignment, t),
      mainAxisExpanded: lerpBool(a?.mainAxisExpanded, b?.mainAxisExpanded, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'margin': margin,
        'spacing': spacing,
        'spacingEnforced': spacingEnforced,
        'crossAxisAlignment': crossAxisAlignment,
        'mainAxisAlignment': mainAxisAlignment,
        'mainAxisExpanded': mainAxisExpanded,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ListTileStyle && mapEquals(other.toMap(), toMap());
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

  // @override
  // bool operator ==(Object other) {
  //   if (other.runtimeType != runtimeType) return false;
  //   return other is ListTileStyle &&
  //       other.margin == margin &&
  //       other.spacing == spacing &&
  //       other.spacingEnforced == spacingEnforced &&
  //       other.crossAxisAlignment == crossAxisAlignment &&
  //       other.mainAxisAlignment == mainAxisAlignment &&
  //       other.mainAxisExpanded == mainAxisExpanded;
  // }

  // @override
  // int get hashCode => Object.hash(
  //       margin,
  //       spacing,
  //       spacingEnforced,
  //       crossAxisAlignment,
  //       mainAxisAlignment,
  //       mainAxisExpanded,
  //     );

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin,
  //       defaultValue: null));
  //   properties.add(DoubleProperty('spacing', spacing, defaultValue: null));
  //   properties.add(FlagProperty('spacingEnforced',
  //       value: spacingEnforced, defaultValue: null));
  //   properties.add(DiagnosticsProperty<CrossAxisAlignment>(
  //       'crossAxisAlignment', crossAxisAlignment,
  //       defaultValue: null));
  //   properties.add(DiagnosticsProperty<MainAxisAlignment>(
  //       'mainAxisAlignment', mainAxisAlignment,
  //       defaultValue: null));
  //   properties.add(FlagProperty('mainAxisExpanded',
  //       value: mainAxisExpanded, defaultValue: null));
  // }
}
