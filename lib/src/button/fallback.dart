import 'package:flutter/foundation.dart';
import 'style.dart';

@immutable
class ButtonStyleFallback with Diagnosticable {
  final ButtonStyle? base;
  final ButtonStyle? text;
  final ButtonStyle? tonal;
  final ButtonStyle? filled;
  final ButtonStyle? elevated;
  final ButtonStyle? outlined;

  const ButtonStyleFallback({
    this.base,
    this.text,
    this.tonal,
    this.filled,
    this.elevated,
    this.outlined,
  });

  /// Creates a copy of this [ButtonStyleFallback] but with
  /// the given fields replaced with the new values.
  ButtonStyleFallback copyWith({
    ButtonStyle? base,
    ButtonStyle? text,
    ButtonStyle? tonal,
    ButtonStyle? filled,
    ButtonStyle? elevated,
    ButtonStyle? outlined,
  }) {
    return ButtonStyleFallback(
      base: this.base?.merge(base) ?? base,
      text: this.text?.merge(text) ?? text,
      tonal: this.tonal?.merge(tonal) ?? tonal,
      filled: this.filled?.merge(filled) ?? filled,
      elevated: this.elevated?.merge(elevated) ?? elevated,
      outlined: this.outlined?.merge(outlined) ?? outlined,
    );
  }

  /// Creates a copy of this [ButtonStyleFallback] but with
  /// the given fields replaced with the new values.
  ButtonStyleFallback merge(covariant ButtonStyleFallback? other) {
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

  ButtonStyle resolve(ButtonVariant? variant) {
    final style = const ButtonStyle().merge(base);
    switch (variant) {
      case ButtonVariant.text:
        return style.merge(text);
      case ButtonVariant.tonal:
        return style.merge(tonal);
      case ButtonVariant.filled:
        return style.merge(filled);
      case ButtonVariant.elevated:
        return style.merge(elevated);
      case ButtonVariant.outlined:
        return style.merge(outlined);
      default:
        return style;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ButtonStyle?>('base', base));
    properties.add(DiagnosticsProperty<ButtonStyle?>('text', text));
    properties.add(DiagnosticsProperty<ButtonStyle?>('tonal', tonal));
    properties.add(DiagnosticsProperty<ButtonStyle?>('filled', filled));
    properties.add(DiagnosticsProperty<ButtonStyle?>('elevated', elevated));
    properties.add(DiagnosticsProperty<ButtonStyle?>('outlined', outlined));
  }
}
