import 'package:flutter/widgets.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/event.dart';
import 'event.dart';

/// Default radio's style.
class RadioStyle {
  const RadioStyle({
    this.size,
    this.padding,
    this.fillColor,
    this.fillOpacity,
    this.fillAlpha,
    this.borderShape,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
    this.thumbColor,
    this.thumbOpacity,
    this.thumbAlpha,
    this.overlayColor,
    this.overlayRadius,
    this.buttonStyle,
  });

  /// Create a checkbox's style from another style
  RadioStyle.from(RadioStyle? other)
      : size = other?.size,
        padding = other?.padding,
        fillColor = other?.fillColor,
        fillOpacity = other?.fillOpacity,
        fillAlpha = other?.fillAlpha,
        borderShape = other?.borderShape,
        borderColor = other?.borderColor,
        borderOpacity = other?.borderOpacity,
        borderAlpha = other?.borderAlpha,
        borderWidth = other?.borderWidth,
        borderRadius = other?.borderRadius,
        borderStyle = other?.borderStyle,
        thumbColor = other?.thumbColor,
        thumbOpacity = other?.thumbOpacity,
        thumbAlpha = other?.thumbAlpha,
        overlayColor = other?.overlayColor,
        overlayRadius = other?.overlayRadius,
        buttonStyle = other?.buttonStyle;

  /// Create an event driven checkbox's style using [callback].
  factory RadioStyle.driven(
    DrivenPropertyResolver<RadioStyle?> callback,
  ) {
    return _RadioStyle(callback);
  }

  /// Create a checkbox's style when some events occurs.
  ///
  /// The [enabled] is base style to be applied to the checkbox.
  /// if `null` will fallback with empty DrivenButtonStyle
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [RadioEvent.disabled].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [RadioEvent.hovered].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [RadioEvent.focused].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [RadioEvent.pressed].
  factory RadioStyle.when({
    RadioStyle? enabled,
    RadioStyle? selected,
    RadioStyle? focused,
    RadioStyle? hovered,
    RadioStyle? pressed,
    RadioStyle? disabled,
  }) {
    return RadioStyle.driven((events) {
      return (enabled ?? const RadioStyle())
          .merge(
              RadioEvent.isSelected(events) ? evaluate(selected, events) : null)
          .merge(
              RadioEvent.isFocused(events) ? evaluate(focused, events) : null)
          .merge(
              RadioEvent.isHovered(events) ? evaluate(hovered, events) : null)
          .merge(
              RadioEvent.isPressed(events) ? evaluate(pressed, events) : null)
          .merge(RadioEvent.isDisabled(events)
              ? evaluate(disabled, events)
              : null);
    });
  }

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [RadioStyle],
  /// otherwise returns the value itself.
  static RadioStyle? evaluate(
    RadioStyle? value,
    Set<WidgetEvent> events,
  ) {
    return value?.merge(DrivenProperty.evaluate<RadioStyle?>(value, events));
  }

  static const defaultSize = 18.0;
  static const defaultStrokeWidth = 2.0;
  static const defaultBorderWidth = 2.0;
  static const defaultBorderStyle = BorderStyle.solid;
  static const defaultBorderRadius = BorderRadius.zero;
  static const defaultBorderShape = BoxShape.rectangle;
  static const disabledStrokeAlpha = 0x61; // 38%
  static const disabledBackgroundAlpha = 0x0c; // 38% * 12% = 5%
  static const disabledBorderAlpha = 0x0c; // 38% * 12% = 5%

  /// Defaults to [ChipStyle.defaultCheckmarkSize].
  final double? size;

  final double? padding;

  /// Color to be used for the checkbox's background.
  final Color? fillColor;

  /// Opacity to be apply to [fillColor].
  final double? fillOpacity;

  /// Alpha to be apply to [fillColor].
  final int? fillAlpha;

  final BoxShape? borderShape;

  /// Color to be used for the checkbox's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the checkbox's border, in logical pixels.
  final double? borderWidth;

  /// The radii for each corner of the checkbox's border.
  final BorderRadiusGeometry? borderRadius;

  /// The style of this side of the checkbox's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  /// The Color to be apply to the checkmark.
  ///
  /// If null fallback to [avatarForegroundColor] or [foregroundColor].
  final Color? thumbColor;

  /// Opacity to be apply to [fillColor].
  final double? thumbOpacity;

  /// Alpha to be apply to [fillColor].
  final int? thumbAlpha;

  final Color? overlayColor;

  final double? overlayRadius;

  final ButtonStyle? buttonStyle;

  /// Creates a copy of this [RadioStyle] but with
  /// the given fields replaced with the new values.
  RadioStyle copyWith({
    double? size,
    double? padding,
    Color? fillColor,
    double? fillOpacity,
    int? fillAlpha,
    BoxShape? borderShape,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle,
    Color? thumbColor,
    double? thumbOpacity,
    int? thumbAlpha,
    Color? overlayColor,
    double? overlayRadius,
    ButtonStyle? buttonStyle,
    RadioStyle? selectedStyle,
    RadioStyle? focusedStyle,
    RadioStyle? hoveredStyle,
    RadioStyle? pressedStyle,
    RadioStyle? disabledStyle,
  }) {
    final hasEvent = selectedStyle != null ||
        focusedStyle != null ||
        hoveredStyle != null ||
        pressedStyle != null ||
        disabledStyle != null;
    final style = RadioStyle(
      size: size ?? this.size,
      padding: padding ?? this.padding,
      fillColor: fillColor ?? this.fillColor,
      fillOpacity: fillOpacity ?? this.fillOpacity,
      fillAlpha: fillAlpha ?? this.fillAlpha,
      borderShape: borderShape ?? this.borderShape,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      thumbColor: thumbColor ?? this.thumbColor,
      thumbOpacity: thumbOpacity ?? this.thumbOpacity,
      thumbAlpha: thumbAlpha ?? this.thumbAlpha,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayRadius: overlayRadius ?? this.overlayRadius,
      buttonStyle: buttonStyle ?? this.buttonStyle,
    );
    return hasEvent
        ? RadioStyle.when(
            enabled: style,
            selected: selectedStyle,
            focused: focusedStyle,
            hovered: hoveredStyle,
            pressed: pressedStyle,
            disabled: disabledStyle,
          )
        : style;
  }

  /// Creates a copy of this [RadioStyle] but with
  /// the given fields replaced with the new values.
  RadioStyle merge(RadioStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      size: other.size,
      padding: other.padding,
      fillColor: other.fillColor,
      fillOpacity: other.fillOpacity,
      fillAlpha: other.fillAlpha,
      borderShape: other.borderShape,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderRadius: other.borderRadius,
      borderStyle: other.borderStyle,
      thumbColor: other.thumbColor,
      thumbOpacity: other.thumbOpacity,
      thumbAlpha: other.thumbAlpha,
      overlayColor: other.overlayColor,
      overlayRadius: other.overlayRadius,
      buttonStyle: other.buttonStyle,
      selectedStyle:
          other is _RadioStyle ? evaluate(other, {RadioEvent.selected}) : null,
      focusedStyle:
          other is _RadioStyle ? evaluate(other, {RadioEvent.focused}) : null,
      hoveredStyle:
          other is _RadioStyle ? evaluate(other, {RadioEvent.hovered}) : null,
      pressedStyle:
          other is _RadioStyle ? evaluate(other, {RadioEvent.pressed}) : null,
      disabledStyle:
          other is _RadioStyle ? evaluate(other, {RadioEvent.disabled}) : null,
    );
  }
}

class _RadioStyle extends RadioStyle implements DrivenProperty<RadioStyle?> {
  _RadioStyle(this._resolver) : super.from(_resolver({}));

  final DrivenPropertyResolver<RadioStyle?> _resolver;

  @override
  RadioStyle? resolve(Set<WidgetEvent> events) => _resolver(events);
}
