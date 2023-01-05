import 'package:flutter/foundation.dart';
import 'style.dart';
import 'variant.dart';

@immutable
class SwitchStyleFallback with Diagnosticable {
  final SwitchStyle? base;
  final SwitchStyle? m2;
  final SwitchStyle? m3;
  final SwitchStyle? ios;

  const SwitchStyleFallback({
    this.base,
    this.m2,
    this.m3,
    this.ios,
  });

  /// Creates a copy of this [SwitchStyleFallback] but with
  /// the given fields replaced with the new values.
  SwitchStyleFallback copyWith({
    SwitchStyle? base,
    SwitchStyle? m2,
    SwitchStyle? m3,
    SwitchStyle? ios,
  }) {
    return SwitchStyleFallback(
      base: this.m2?.merge(m2) ?? base,
      m2: this.m2?.merge(m2) ?? m2,
      m3: this.m3?.merge(m3) ?? m3,
      ios: this.ios?.merge(ios) ?? ios,
    );
  }

  /// Creates a copy of this [SwitchStyleFallback] but with
  /// the given fields replaced with the new values.
  SwitchStyleFallback merge(covariant SwitchStyleFallback? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      base: other.base,
      m2: other.m2,
      m3: other.m3,
      ios: other.ios,
    );
  }

  SwitchStyle resolve(SwitchVariant? variant) {
    final style = const SwitchStyle().merge(base);
    switch (variant) {
      case SwitchVariant.m2:
        return style.merge(m2);
      case SwitchVariant.m3:
        return style.merge(m3);
      case SwitchVariant.ios:
        return style.merge(ios);
      default:
        return style;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SwitchStyle?>('base', base));
    properties.add(DiagnosticsProperty<SwitchStyle?>('m2', m2));
    properties.add(DiagnosticsProperty<SwitchStyle?>('m3', m3));
    properties.add(DiagnosticsProperty<SwitchStyle?>('ios', ios));
  }
}
