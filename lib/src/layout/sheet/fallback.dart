import 'package:flutter/foundation.dart';
import 'style.dart';
import 'types.dart';

@immutable
class SheetStyleFallback with Diagnosticable {
  final SheetStyle? base;
  final Map<SheetVariant, SheetStyle?> variant;
  final Map<SheetSeverity, SheetStyle?> severity;

  const SheetStyleFallback({
    this.base,
    this.variant = const {},
    this.severity = const {},
  });

  /// Creates a copy of this [SheetStyleFallback] but with
  /// the given fields replaced with the new values.
  SheetStyleFallback copyWith({
    SheetStyle? base,
    Map<SheetVariant, SheetStyle?>? variant,
    Map<SheetSeverity, SheetStyle?>? severity,
  }) {
    return SheetStyleFallback(
      base: this.base?.merge(base) ?? base,
      variant: {...this.variant, ...?variant},
      severity: {...this.severity, ...?severity},
      // variant: this.variant.map((key, value) {
      //   final v = variant?[key];
      //   return MapEntry(key, value?.merge(v) ?? v);
      // }),
      // severity: this.severity.map((key, value) {
      //   final v = severity?[key];
      //   return MapEntry(key, value?.merge(v) ?? v);
      // }),
    );
  }

  /// Creates a copy of this [SheetStyleFallback] but with
  /// the given fields replaced with the new values.
  SheetStyleFallback merge(SheetStyleFallback? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      base: other.base,
      variant: other.variant,
      severity: other.severity,
    );
  }

  SheetStyle resolve({SheetVariant? variant, SheetSeverity? severity}) {
    return SheetStyle.from(base)
        .merge(this.variant[variant])
        .merge(this.severity[severity]);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SheetStyle?>('base', base));
    properties.add(DiagnosticsProperty<Map<SheetVariant, SheetStyle?>>(
        'variant', variant));
    properties.add(DiagnosticsProperty<Map<SheetSeverity, SheetStyle?>>(
        'severity', severity));
  }
}
