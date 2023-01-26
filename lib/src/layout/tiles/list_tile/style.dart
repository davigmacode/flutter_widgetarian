import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/src/layout/tiles/text_tile/style.dart';

/// The style to be applied to [ListTile] widget
@immutable
class ListTileStyle with Diagnosticable {
  final EdgeInsetsGeometry? margin;
  final double? spacing;
  final bool? spacingEnforced;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? mainAxisExpanded;
  final bool? childExpanded;
  final TextTileAlign? textAlign;
  final double? textSpacing;
  final EdgeInsetsGeometry? textMargin;

  /// Create a raw [ListTileStyle]
  const ListTileStyle({
    this.margin,
    this.spacing,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisExpanded,
    this.childExpanded,
    this.textAlign,
    this.textSpacing,
    this.textMargin,
  });

  /// An [ListTileStyle] with some reasonable default values.
  static const defaults = ListTileStyle(
    margin: EdgeInsets.zero,
    spacing: 0.0,
    spacingEnforced: true,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisExpanded: true,
    childExpanded: true,
    textAlign: TextTileAlign.left,
    textMargin: EdgeInsets.zero,
    textSpacing: 0.0,
  );

  /// Create a [ListTileStyle] from another style
  ListTileStyle.from(ListTileStyle? other)
      : margin = other?.margin,
        spacing = other?.spacing,
        spacingEnforced = other?.spacingEnforced,
        crossAxisAlignment = other?.crossAxisAlignment,
        mainAxisAlignment = other?.mainAxisAlignment,
        mainAxisExpanded = other?.mainAxisExpanded,
        childExpanded = other?.childExpanded,
        textAlign = other?.textAlign,
        textMargin = other?.textMargin,
        textSpacing = other?.textSpacing;

  /// Creates a copy of this [ListTileStyle] but with
  /// the given fields replaced with the new values.
  ListTileStyle copyWith({
    EdgeInsetsGeometry? margin,
    double? spacing,
    bool? spacingEnforced,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    bool? mainAxisExpanded,
    bool? childExpanded,
    TextTileAlign? textAlign,
    double? textSpacing,
    EdgeInsetsGeometry? textMargin,
  }) {
    return ListTileStyle(
      margin: margin ?? this.margin,
      spacing: spacing ?? this.spacing,
      spacingEnforced: spacingEnforced ?? this.spacingEnforced,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisExpanded: mainAxisExpanded ?? this.mainAxisExpanded,
      childExpanded: childExpanded ?? this.childExpanded,
      textAlign: textAlign ?? this.textAlign,
      textSpacing: textSpacing ?? this.textSpacing,
      textMargin: textMargin ?? this.textMargin,
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
      childExpanded: other.childExpanded,
      textAlign: other.textAlign,
      textMargin: other.textMargin,
      textSpacing: other.textSpacing,
    );
  }

  /// Linearly interpolate between two [ListTileStyle] objects.
  static ListTileStyle? lerp(ListTileStyle? a, ListTileStyle? b, double t) {
    if (a == null && b == null) return null;
    return ListTileStyle(
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      spacingEnforced: lerpBool(a?.spacingEnforced, b?.spacingEnforced, t),
      crossAxisAlignment:
          lerpEnum(a?.crossAxisAlignment, b?.crossAxisAlignment, t),
      mainAxisAlignment:
          lerpEnum(a?.mainAxisAlignment, b?.mainAxisAlignment, t),
      mainAxisExpanded: lerpBool(a?.mainAxisExpanded, b?.mainAxisExpanded, t),
      childExpanded: lerpBool(a?.childExpanded, b?.childExpanded, t),
      textAlign: lerpEnum(a?.textAlign, b?.textAlign, t),
      textMargin: EdgeInsetsGeometry.lerp(a?.textMargin, b?.textMargin, t),
      textSpacing: lerpDouble(a?.textSpacing, b?.textSpacing, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'margin': margin,
        'spacing': spacing,
        'spacingEnforced': spacingEnforced,
        'crossAxisAlignment': crossAxisAlignment,
        'mainAxisAlignment': mainAxisAlignment,
        'mainAxisExpanded': mainAxisExpanded,
        'childExpanded': childExpanded,
        'textAlign': textAlign,
        'textMargin': textMargin,
        'textSpacing': textSpacing,
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
}
