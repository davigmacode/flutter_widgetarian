import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:widgetarian/utils.dart';
import '../../layout/sheet/style.dart';

@immutable
class BadgeStyle with Diagnosticable {
  final Alignment? alignment;
  final Offset? offset;
  final SheetStyle? sheetStyle;

  /// Default [BadgeStyle] constructor
  const BadgeStyle({
    this.alignment,
    this.offset,
    this.sheetStyle,
  });

  /// An [BadgeStyle] with some reasonable default values.
  static const defaults = BadgeStyle(
    alignment: Alignment.topRight,
    offset: Offset.zero,
  );

  /// Create a [BadgeStyle] from another style
  BadgeStyle.from(BadgeStyle? other)
      : alignment = other?.alignment,
        offset = other?.offset,
        sheetStyle = other?.sheetStyle;

  /// Creates a copy of this [BadgeStyle] but with
  /// the given fields replaced with the new values.
  BadgeStyle copyWith({
    Alignment? alignment,
    Offset? offset,
    SheetStyle? sheetStyle,
  }) {
    return BadgeStyle(
      alignment: alignment,
      offset: offset,
      sheetStyle: sheetStyle,
    );
  }

  /// Creates a copy of this [SheetStyle] but with
  /// the given fields replaced with the new values.
  BadgeStyle merge(BadgeStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      alignment: other.alignment,
      offset: other.offset,
      sheetStyle: other.sheetStyle,
    );
  }

  /// Linearly interpolate between two [BadgeStyle] objects.
  static BadgeStyle lerp(BadgeStyle? a, BadgeStyle? b, double t) {
    return BadgeStyle(
      alignment: lerpEnum(a?.alignment, b?.alignment, t),
      offset: Offset.lerp(a?.offset, b?.offset, t),
      sheetStyle: SheetStyle.lerp(a?.sheetStyle, b?.sheetStyle, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'alignment': alignment,
        'offset': offset,
        'sheetStyle': sheetStyle,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is BadgeStyle && mapEquals(other.toMap(), toMap());
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
