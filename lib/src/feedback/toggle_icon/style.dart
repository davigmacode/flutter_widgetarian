import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';

class ToggleIconStyle {
  final double? size;
  final Color? overlayColor;
  final double? overlayRadius;
  final Color? outerColor;
  final double? outerOpacity;
  final Color? innerColor;
  final double? innerOpacity;
  final double? innerScale;

  const ToggleIconStyle({
    this.size,
    this.overlayColor,
    this.overlayRadius,
    this.outerColor,
    this.outerOpacity,
    this.innerColor,
    this.innerOpacity,
    this.innerScale,
  });

  ToggleIconStyle.from(ToggleIconStyle? other)
      : size = other?.size,
        overlayColor = other?.overlayColor,
        overlayRadius = other?.overlayRadius,
        outerColor = other?.outerColor,
        outerOpacity = other?.outerOpacity,
        innerColor = other?.innerColor,
        innerOpacity = other?.innerOpacity,
        innerScale = other?.innerScale;

  /// Create an event driven chip's style using [callback].
  factory ToggleIconStyle.driven(
    DrivenPropertyResolver<ToggleIconStyle?> callback,
  ) {
    return _ToggleIconStyle(callback);
  }

  /// Create a chip's style when some events occurs.
  ///
  /// The [enabled] is base style to be applied to the chip.
  /// if `null` will fallback with empty ChipStyle
  ///
  /// The [selected] is style to be merged with [enabled],
  /// when events includes [ChipEvent.selected].
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [ChipEvent.disabled].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [ChipEvent.hovered].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [ChipEvent.focused].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [ChipEvent.pressed].
  factory ToggleIconStyle.when({
    ToggleIconStyle? enabled,
    ToggleIconStyle? selected,
    ToggleIconStyle? focused,
    ToggleIconStyle? hovered,
    ToggleIconStyle? pressed,
    ToggleIconStyle? disabled,
  }) {
    return ToggleIconStyle.driven((events) {
      return (enabled ?? const ToggleIconStyle())
          .merge(WidgetEvent.isSelected(events)
              ? ToggleIconStyle.evaluate(selected, events)
              : null)
          .merge(WidgetEvent.isFocused(events)
              ? ToggleIconStyle.evaluate(focused, events)
              : null)
          .merge(WidgetEvent.isHovered(events)
              ? ToggleIconStyle.evaluate(hovered, events)
              : null)
          .merge(WidgetEvent.isPressed(events)
              ? ToggleIconStyle.evaluate(pressed, events)
              : null)
          .merge(WidgetEvent.isDisabled(events)
              ? ToggleIconStyle.evaluate(disabled, events)
              : null);
    });
  }

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [ToggleIconStyle],
  /// otherwise returns the value itself.
  static ToggleIconStyle? evaluate(
    ToggleIconStyle? value,
    Set<WidgetEvent> events,
  ) {
    return value
        ?.merge(DrivenProperty.evaluate<ToggleIconStyle?>(value, events));
  }

  /// Creates a copy of this [ChipStyle] but with
  /// the given fields replaced with the new values.
  ToggleIconStyle copyWith({
    double? size,
    Color? overlayColor,
    double? overlayRadius,
    Color? outerColor,
    double? outerOpacity,
    Color? innerColor,
    double? innerOpacity,
    double? innerScale,
    ToggleIconStyle? selectedStyle,
    ToggleIconStyle? disabledStyle,
    ToggleIconStyle? hoveredStyle,
    ToggleIconStyle? focusedStyle,
    ToggleIconStyle? pressedStyle,
  }) {
    final hasEvent = selectedStyle != null ||
        focusedStyle != null ||
        hoveredStyle != null ||
        pressedStyle != null ||
        disabledStyle != null;
    final style = ToggleIconStyle(
      size: size ?? this.size,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayRadius: overlayRadius ?? this.overlayRadius,
      outerColor: outerColor ?? this.outerColor,
      outerOpacity: outerOpacity ?? this.outerOpacity,
      innerColor: innerColor ?? this.innerColor,
      innerOpacity: innerOpacity ?? this.innerOpacity,
      innerScale: innerScale ?? this.innerScale,
    );
    return hasEvent
        ? ToggleIconStyle.when(
            enabled: style,
            selected: selectedStyle,
            disabled: disabledStyle,
            hovered: hoveredStyle,
            focused: focusedStyle,
            pressed: pressedStyle,
          )
        : style;
  }

  /// Creates a copy of this [ToggleIconStyle] but with
  /// the given fields replaced with the new values.
  ToggleIconStyle merge(ToggleIconStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      size: other.size,
      overlayColor: other.overlayColor,
      overlayRadius: other.overlayRadius,
      outerColor: other.outerColor,
      outerOpacity: other.outerOpacity,
      innerColor: other.innerColor,
      innerOpacity: other.innerOpacity,
      innerScale: other.innerScale,
      selectedStyle: other is _ToggleIconStyle
          ? evaluate(other, {WidgetEvent.selected})
          : null,
      focusedStyle: other is _ToggleIconStyle
          ? evaluate(other, {WidgetEvent.focused})
          : null,
      hoveredStyle: other is _ToggleIconStyle
          ? evaluate(other, {WidgetEvent.hovered})
          : null,
      pressedStyle: other is _ToggleIconStyle
          ? evaluate(other, {WidgetEvent.pressed})
          : null,
      disabledStyle: other is _ToggleIconStyle
          ? evaluate(other, {WidgetEvent.disabled})
          : null,
    );
  }
}

class _ToggleIconStyle extends ToggleIconStyle
    implements DrivenProperty<ToggleIconStyle?> {
  _ToggleIconStyle(this._resolver) : super.from(_resolver({}));

  final DrivenPropertyResolver<ToggleIconStyle?> _resolver;

  @override
  ToggleIconStyle? resolve(Set<WidgetEvent> events) => _resolver(events);
}
