import 'package:flutter/widgets.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'event.dart';

/// Default checkbox's style.
class CheckboxStyle {
  const CheckboxStyle({
    this.size,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderShape,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
    this.strokeColor,
    this.strokeWidth,
    this.strokeStyle,
    this.overlayColor,
    this.overlayRadius,
    this.buttonStyle,
  });

  /// Create a checkbox's style from another style
  CheckboxStyle.from(CheckboxStyle? other)
      : size = other?.size,
        backgroundColor = other?.backgroundColor,
        backgroundOpacity = other?.backgroundOpacity,
        backgroundAlpha = other?.backgroundAlpha,
        borderShape = other?.borderShape,
        borderColor = other?.borderColor,
        borderOpacity = other?.borderOpacity,
        borderAlpha = other?.borderAlpha,
        borderWidth = other?.borderWidth,
        borderRadius = other?.borderRadius,
        borderStyle = other?.borderStyle,
        strokeColor = other?.strokeColor,
        strokeWidth = other?.strokeWidth,
        strokeStyle = other?.strokeStyle,
        overlayColor = other?.overlayColor,
        overlayRadius = other?.overlayRadius,
        buttonStyle = other?.buttonStyle;

  /// Create an event driven checkbox's style using [callback].
  factory CheckboxStyle.driven(
    DrivenPropertyResolver<CheckboxStyle?> callback,
  ) {
    return _CheckboxStyle(callback);
  }

  /// Create a checkbox's style when some events occurs.
  ///
  /// The [enabled] is base style to be applied to the checkbox.
  /// if `null` will fallback with empty DrivenButtonStyle
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [CheckboxEvent.disabled].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [CheckboxEvent.hovered].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [CheckboxEvent.focused].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [CheckboxEvent.pressed].
  factory CheckboxStyle.when({
    CheckboxStyle? enabled,
    CheckboxStyle? selected,
    CheckboxStyle? indeterminate,
    CheckboxStyle? focused,
    CheckboxStyle? hovered,
    CheckboxStyle? pressed,
    CheckboxStyle? disabled,
  }) {
    return CheckboxStyle.driven((events) {
      return (enabled ?? const CheckboxStyle())
          .merge(CheckboxEvent.isSelected(events)
              ? evaluate(selected, events)
              : null)
          .merge(CheckboxEvent.isIndeterminate(events)
              ? evaluate(indeterminate, events)
              : null)
          .merge(CheckboxEvent.isFocused(events)
              ? evaluate(focused, events)
              : null)
          .merge(CheckboxEvent.isHovered(events)
              ? evaluate(hovered, events)
              : null)
          .merge(CheckboxEvent.isPressed(events)
              ? evaluate(pressed, events)
              : null)
          .merge(CheckboxEvent.isDisabled(events)
              ? evaluate(disabled, events)
              : null);
    });
  }

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [CheckboxStyle],
  /// otherwise returns the value itself.
  static CheckboxStyle? evaluate(
    CheckboxStyle? value,
    Set<WidgetEvent> events,
  ) {
    return value?.merge(DrivenProperty.evaluate<CheckboxStyle?>(value, events));
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

  /// Color to be used for the checkbox's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

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
  final Color? strokeColor;

  /// Stroke width of the checkmark.
  ///
  /// Defaults to [ChipStyle.defaultCheckmarkWeight].
  final double? strokeWidth;

  /// Defaults to [ChipCheckmarkStyle.sharp].
  final StrokeStyle? strokeStyle;

  final Color? overlayColor;

  final double? overlayRadius;

  final ButtonStyle? buttonStyle;

  /// Creates a copy of this [CheckboxStyle] but with
  /// the given fields replaced with the new values.
  CheckboxStyle copyWith({
    double? size,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    BoxShape? borderShape,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle,
    Color? strokeColor,
    double? strokeWidth,
    StrokeStyle? strokeStyle,
    Color? overlayColor,
    double? overlayRadius,
    ButtonStyle? buttonStyle,
    CheckboxStyle? selectedStyle,
    CheckboxStyle? indeterminateStyle,
    CheckboxStyle? focusedStyle,
    CheckboxStyle? hoveredStyle,
    CheckboxStyle? pressedStyle,
    CheckboxStyle? disabledStyle,
  }) {
    final hasEvent = selectedStyle != null ||
        indeterminateStyle != null ||
        focusedStyle != null ||
        hoveredStyle != null ||
        pressedStyle != null ||
        disabledStyle != null;
    final style = CheckboxStyle(
      size: size ?? this.size,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderShape: borderShape ?? this.borderShape,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      strokeColor: strokeColor ?? this.strokeColor,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      strokeStyle: strokeStyle ?? this.strokeStyle,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayRadius: overlayRadius ?? this.overlayRadius,
      buttonStyle: buttonStyle ?? this.buttonStyle,
    );
    return hasEvent
        ? CheckboxStyle.when(
            enabled: style,
            selected: selectedStyle,
            indeterminate: indeterminateStyle,
            focused: focusedStyle,
            hovered: hoveredStyle,
            pressed: pressedStyle,
            disabled: disabledStyle,
          )
        : style;
  }

  /// Creates a copy of this [CheckboxStyle] but with
  /// the given fields replaced with the new values.
  CheckboxStyle merge(CheckboxStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      size: other.size,
      backgroundColor: other.backgroundColor,
      backgroundOpacity: other.backgroundOpacity,
      backgroundAlpha: other.backgroundAlpha,
      borderShape: other.borderShape,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderRadius: other.borderRadius,
      borderStyle: other.borderStyle,
      strokeColor: other.strokeColor,
      strokeWidth: other.strokeWidth,
      strokeStyle: other.strokeStyle,
      overlayColor: other.overlayColor,
      overlayRadius: other.overlayRadius,
      buttonStyle: other.buttonStyle,
      selectedStyle: other is _CheckboxStyle
          ? evaluate(other, {CheckboxEvent.selected})
          : null,
      indeterminateStyle: other is _CheckboxStyle
          ? evaluate(other, {CheckboxEvent.indeterminate})
          : null,
      focusedStyle: other is _CheckboxStyle
          ? evaluate(other, {CheckboxEvent.focused})
          : null,
      hoveredStyle: other is _CheckboxStyle
          ? evaluate(other, {CheckboxEvent.hovered})
          : null,
      pressedStyle: other is _CheckboxStyle
          ? evaluate(other, {CheckboxEvent.pressed})
          : null,
      disabledStyle: other is _CheckboxStyle
          ? evaluate(other, {CheckboxEvent.disabled})
          : null,
    );
  }
}

class _CheckboxStyle extends CheckboxStyle
    implements DrivenProperty<CheckboxStyle?> {
  _CheckboxStyle(this._resolver) : super.from(_resolver({}));

  final DrivenPropertyResolver<CheckboxStyle?> _resolver;

  @override
  CheckboxStyle? resolve(Set<WidgetEvent> events) => _resolver(events);
}
