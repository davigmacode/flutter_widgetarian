import 'package:flutter/foundation.dart';
import 'style.dart';

@immutable
class ChipStyleFallback with Diagnosticable {
  final ChipStyle? base;
  final ChipStyle? tonal;
  final ChipStyle? filled;
  final ChipStyle? elevated;
  final ChipStyle? outlined;

  const ChipStyleFallback({
    this.base,
    this.tonal,
    this.filled,
    this.elevated,
    this.outlined,
  });

  /// Creates a copy of this [ChipStyleFallback] but with
  /// the given fields replaced with the new values.
  ChipStyleFallback copyWith({
    ChipStyle? base,
    ChipStyle? tonal,
    ChipStyle? filled,
    ChipStyle? elevated,
    ChipStyle? outlined,
  }) {
    return ChipStyleFallback(
      base: this.tonal?.merge(tonal) ?? base,
      tonal: this.tonal?.merge(tonal) ?? tonal,
      filled: this.filled?.merge(filled) ?? filled,
      elevated: this.elevated?.merge(elevated) ?? elevated,
      outlined: this.outlined?.merge(outlined) ?? outlined,
    );
  }

  /// Creates a copy of this [ChipStyleFallback] but with
  /// the given fields replaced with the new values.
  ChipStyleFallback merge(covariant ChipStyleFallback? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      base: other.base,
      tonal: other.tonal,
      filled: other.filled,
      elevated: other.elevated,
      outlined: other.outlined,
    );
  }

  ChipStyle resolve(ChipVariant? variant) {
    final style = const ChipStyle().merge(base);
    switch (variant) {
      case ChipVariant.tonal:
        return style.merge(tonal);
      case ChipVariant.filled:
        return style.merge(filled);
      case ChipVariant.elevated:
        return style.merge(elevated);
      case ChipVariant.outlined:
        return style.merge(outlined);
      default:
        return style;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ChipStyle?>('base', base));
    properties.add(DiagnosticsProperty<ChipStyle?>('tonal', tonal));
    properties.add(DiagnosticsProperty<ChipStyle?>('filled', filled));
    properties.add(DiagnosticsProperty<ChipStyle?>('elevated', elevated));
    properties.add(DiagnosticsProperty<ChipStyle?>('outlined', outlined));
  }
}
