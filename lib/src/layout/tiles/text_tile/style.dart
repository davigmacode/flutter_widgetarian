import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:widgetarian/utils.dart';

enum TextTileAlign { left, center, right }

/// The style to be applied to [TextTile] widget
@immutable
class TextTileStyle with Diagnosticable {
  final double? spacing;
  final EdgeInsetsGeometry? margin;
  final TextTileAlign? align;

  /// [CrossAxisAlignment] from [align]
  CrossAxisAlignment get crossAxisAlignment {
    switch (align) {
      case TextTileAlign.center:
        return CrossAxisAlignment.center;
      case TextTileAlign.right:
        return CrossAxisAlignment.end;
      case TextTileAlign.left:
      default:
        return CrossAxisAlignment.start;
    }
  }

  /// Create a raw [TextTileStyle]
  const TextTileStyle({
    this.spacing,
    this.margin,
    this.align,
  });

  /// An [TextTileStyle] with some reasonable default values.
  static const defaults = TextTileStyle(
    spacing: 0.0,
    margin: EdgeInsets.zero,
    align: TextTileAlign.left,
  );

  /// Create a [TextTileStyle] from another style
  TextTileStyle.from(TextTileStyle? other)
      : spacing = other?.spacing,
        margin = other?.margin,
        align = other?.align;

  /// Creates a copy of this [TextTileStyle] but with
  /// the given fields replaced with the new values.
  TextTileStyle copyWith({
    double? spacing,
    EdgeInsetsGeometry? margin,
    TextTileAlign? align,
  }) {
    return TextTileStyle(
      spacing: spacing ?? this.spacing,
      margin: margin ?? this.margin,
      align: align ?? this.align,
    );
  }

  /// Creates a copy of this [TextTileStyle] but with
  /// the given fields replaced with the new values.
  TextTileStyle merge(TextTileStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      spacing: other.spacing,
      margin: other.margin,
      align: other.align,
    );
  }

  /// Linearly interpolate between two [TextTileStyle] objects.
  static TextTileStyle? lerp(TextTileStyle? a, TextTileStyle? b, double t) {
    if (a == null && b == null) return null;
    return TextTileStyle(
      spacing: lerpDouble(a?.spacing, b?.spacing, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      align: lerpEnum(a?.align, b?.align, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'spacing': spacing,
        'margin': margin,
        'align': align,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is TextTileStyle && mapEquals(other.toMap(), toMap());
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
