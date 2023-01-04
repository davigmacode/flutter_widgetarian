import 'style.dart';

class ButtonStyleFallback {
  final ButtonStyle? base;
  final ButtonStyle? tonal;
  final ButtonStyle? filled;
  final ButtonStyle? elevated;
  final ButtonStyle? outlined;

  const ButtonStyleFallback({
    this.base,
    this.tonal,
    this.filled,
    this.elevated,
    this.outlined,
  });

  /// Creates a copy of this [ButtonStyleFallback] but with
  /// the given fields replaced with the new values.
  ButtonStyleFallback copyWith({
    ButtonStyle? base,
    ButtonStyle? tonal,
    ButtonStyle? filled,
    ButtonStyle? elevated,
    ButtonStyle? outlined,
  }) {
    return ButtonStyleFallback(
      base: this.tonal?.merge(tonal) ?? base,
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
      tonal: other.tonal,
      filled: other.filled,
      elevated: other.elevated,
      outlined: other.outlined,
    );
  }

  ButtonStyle resolve(ButtonVariant? variant) {
    final style = const ButtonStyle().merge(base);
    switch (variant) {
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
}
