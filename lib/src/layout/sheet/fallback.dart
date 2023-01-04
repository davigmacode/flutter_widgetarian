import 'package:flutter/foundation.dart';
import 'style.dart';
import 'variant.dart';

@immutable
class SheetStyleFallback with Diagnosticable {
  final SheetStyle? base;
  final SheetStyle? text;
  final SheetStyle? tonal;
  final SheetStyle? filled;
  final SheetStyle? elevated;
  final SheetStyle? outlined;

  const SheetStyleFallback({
    this.base,
    this.text,
    this.tonal,
    this.filled,
    this.elevated,
    this.outlined,
  });

  /// Creates a copy of this [SheetStyleFallback] but with
  /// the given fields replaced with the new values.
  SheetStyleFallback copyWith({
    SheetStyle? base,
    SheetStyle? text,
    SheetStyle? tonal,
    SheetStyle? filled,
    SheetStyle? elevated,
    SheetStyle? outlined,
  }) {
    return SheetStyleFallback(
      base: this.base?.merge(base) ?? base,
      text: this.text?.merge(text) ?? text,
      tonal: this.tonal?.merge(tonal) ?? tonal,
      filled: this.filled?.merge(filled) ?? filled,
      elevated: this.elevated?.merge(elevated) ?? elevated,
      outlined: this.outlined?.merge(outlined) ?? outlined,
    );
  }

  /// Creates a copy of this [SheetStyleFallback] but with
  /// the given fields replaced with the new values.
  SheetStyleFallback merge(covariant SheetStyleFallback? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      base: other.base,
      text: other.text,
      tonal: other.tonal,
      filled: other.filled,
      elevated: other.elevated,
      outlined: other.outlined,
    );
  }

  SheetStyle resolve(SheetVariant? variant) {
    final style = SheetStyle.from(base);
    switch (variant) {
      case SheetVariant.text:
        return style.merge(text);
      case SheetVariant.tonal:
        return style.merge(tonal);
      case SheetVariant.filled:
        return style.merge(filled);
      case SheetVariant.elevated:
        return style.merge(elevated);
      case SheetVariant.outlined:
        return style.merge(outlined);
      default:
        return style;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SheetStyle?>('base', base));
    properties.add(DiagnosticsProperty<SheetStyle?>('text', text));
    properties.add(DiagnosticsProperty<SheetStyle?>('tonal', tonal));
    properties.add(DiagnosticsProperty<SheetStyle?>('filled', filled));
    properties.add(DiagnosticsProperty<SheetStyle?>('elevated', elevated));
    properties.add(DiagnosticsProperty<SheetStyle?>('outlined', outlined));
  }
}
