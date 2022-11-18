import 'package:flutter/widgets.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'event.dart';

/// Default checkbox's style.
class SwitchStyle {
  const SwitchStyle({
    this.size,
    this.padding,
    this.trackShape,
    this.trackColor,
    this.trackOpacity,
    this.trackAlpha,
    this.trackHeight,
    this.thumbShape,
    this.thumbColor,
    this.thumbOpacity,
    this.thumbAlpha,
    this.thumbScale,
    this.thumbShadow,
    this.thumbElevation,
    this.overlayColor,
    this.overlayOpacity,
    this.overlayRadius,
    this.buttonStyle,
  });

  /// Create a checkbox's style from another style
  SwitchStyle.from(SwitchStyle? other)
      : size = other?.size,
        padding = other?.padding,
        trackShape = other?.trackShape,
        trackColor = other?.trackColor,
        trackOpacity = other?.trackOpacity,
        trackAlpha = other?.trackAlpha,
        trackHeight = other?.trackHeight,
        thumbShape = other?.thumbShape,
        thumbColor = other?.thumbColor,
        thumbOpacity = other?.thumbOpacity,
        thumbAlpha = other?.thumbAlpha,
        thumbScale = other?.thumbScale,
        thumbShadow = other?.thumbShadow,
        thumbElevation = other?.thumbElevation,
        overlayColor = other?.overlayColor,
        overlayOpacity = other?.overlayOpacity,
        overlayRadius = other?.overlayRadius,
        buttonStyle = other?.buttonStyle;

  /// Create an event driven checkbox's style using [callback].
  factory SwitchStyle.driven(
    DrivenPropertyResolver<SwitchStyle?> callback,
  ) {
    return _SwitchStyle(callback);
  }

  /// Create a checkbox's style when some events occurs.
  ///
  /// The [enabled] is base style to be applied to the checkbox.
  /// if `null` will fallback with empty DrivenButtonStyle
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [SwitchEvent.disabled].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [SwitchEvent.hovered].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [SwitchEvent.focused].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [SwitchEvent.pressed].
  factory SwitchStyle.when({
    SwitchStyle? enabled,
    SwitchStyle? selected,
    SwitchStyle? indeterminate,
    SwitchStyle? focused,
    SwitchStyle? hovered,
    SwitchStyle? pressed,
    SwitchStyle? disabled,
  }) {
    return SwitchStyle.driven((events) {
      return (enabled ?? const SwitchStyle())
          .merge(SwitchEvent.isSelected(events)
              ? evaluate(selected, events)
              : null)
          .merge(SwitchEvent.isIndeterminate(events)
              ? evaluate(indeterminate, events)
              : null)
          .merge(
              SwitchEvent.isFocused(events) ? evaluate(focused, events) : null)
          .merge(
              SwitchEvent.isHovered(events) ? evaluate(hovered, events) : null)
          .merge(
              SwitchEvent.isPressed(events) ? evaluate(pressed, events) : null)
          .merge(SwitchEvent.isDisabled(events)
              ? evaluate(disabled, events)
              : null);
    });
  }

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [SwitchStyle],
  /// otherwise returns the value itself.
  static SwitchStyle? evaluate(
    SwitchStyle? value,
    Set<WidgetEvent> events,
  ) {
    return value?.merge(DrivenProperty.evaluate<SwitchStyle?>(value, events));
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
  final Size? size;

  final double? padding;

  final ShapeBorder? trackShape;
  final Color? trackColor;
  final double? trackOpacity;
  final int? trackAlpha;
  final double? trackHeight;

  final ShapeBorder? thumbShape;
  final Color? thumbColor;
  final double? thumbOpacity;
  final int? thumbAlpha;
  final double? thumbScale;
  final Color? thumbShadow;
  final double? thumbElevation;

  final Color? overlayColor;
  final double? overlayOpacity;
  final double? overlayRadius;

  final ButtonStyle? buttonStyle;

  /// Creates a copy of this [SwitchStyle] but with
  /// the given fields replaced with the new values.
  SwitchStyle copyWith({
    Size? size,
    double? padding,
    ShapeBorder? trackShape,
    Color? trackColor,
    double? trackOpacity,
    int? trackAlpha,
    double? trackHeight,
    ShapeBorder? thumbShape,
    Color? thumbColor,
    double? thumbOpacity,
    int? thumbAlpha,
    double? thumbScale,
    Color? thumbShadow,
    double? thumbElevation,
    Color? overlayColor,
    double? overlayOpacity,
    double? overlayRadius,
    ButtonStyle? buttonStyle,
    SwitchStyle? indeterminateStyle,
    SwitchStyle? selectedStyle,
    SwitchStyle? focusedStyle,
    SwitchStyle? hoveredStyle,
    SwitchStyle? pressedStyle,
    SwitchStyle? disabledStyle,
  }) {
    final hasEvent = selectedStyle != null ||
        indeterminateStyle != null ||
        focusedStyle != null ||
        hoveredStyle != null ||
        pressedStyle != null ||
        disabledStyle != null;
    final style = SwitchStyle(
      size: size ?? this.size,
      padding: padding ?? this.padding,
      trackShape: trackShape ?? this.trackShape,
      trackColor: trackColor ?? this.trackColor,
      trackOpacity: trackOpacity ?? this.trackOpacity,
      trackAlpha: trackAlpha ?? this.trackAlpha,
      trackHeight: trackHeight ?? this.trackHeight,
      thumbShape: thumbShape ?? this.thumbShape,
      thumbColor: thumbColor ?? this.thumbColor,
      thumbOpacity: thumbOpacity ?? this.thumbOpacity,
      thumbAlpha: thumbAlpha ?? this.thumbAlpha,
      thumbScale: thumbScale ?? this.thumbScale,
      thumbShadow: thumbShadow ?? this.thumbShadow,
      thumbElevation: thumbElevation ?? this.thumbElevation,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayOpacity: overlayOpacity ?? this.overlayOpacity,
      overlayRadius: overlayRadius ?? this.overlayRadius,
      buttonStyle: buttonStyle ?? this.buttonStyle,
    );
    return hasEvent
        ? SwitchStyle.when(
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

  /// Creates a copy of this [SwitchStyle] but with
  /// the given fields replaced with the new values.
  SwitchStyle merge(SwitchStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      size: other.size,
      padding: other.padding,
      trackShape: other.trackShape,
      trackColor: other.trackColor,
      trackOpacity: other.trackOpacity,
      trackAlpha: other.trackAlpha,
      trackHeight: other.trackHeight,
      thumbShape: other.thumbShape,
      thumbColor: other.thumbColor,
      thumbOpacity: other.thumbOpacity,
      thumbAlpha: other.thumbAlpha,
      thumbScale: other.thumbScale,
      thumbShadow: other.thumbShadow,
      thumbElevation: other.thumbElevation,
      overlayColor: other.overlayColor,
      overlayOpacity: other.overlayOpacity,
      overlayRadius: other.overlayRadius,
      buttonStyle: other.buttonStyle,
      selectedStyle: other is _SwitchStyle
          ? evaluate(other, {SwitchEvent.selected})
          : null,
      indeterminateStyle: other is _SwitchStyle
          ? evaluate(other, {SwitchEvent.indeterminate})
          : null,
      focusedStyle:
          other is _SwitchStyle ? evaluate(other, {SwitchEvent.focused}) : null,
      hoveredStyle:
          other is _SwitchStyle ? evaluate(other, {SwitchEvent.hovered}) : null,
      pressedStyle:
          other is _SwitchStyle ? evaluate(other, {SwitchEvent.pressed}) : null,
      disabledStyle: other is _SwitchStyle
          ? evaluate(other, {SwitchEvent.disabled})
          : null,
    );
  }
}

class _SwitchStyle extends SwitchStyle implements DrivenProperty<SwitchStyle?> {
  _SwitchStyle(this._resolver) : super.from(_resolver({}));

  final DrivenPropertyResolver<SwitchStyle?> _resolver;

  @override
  SwitchStyle? resolve(Set<WidgetEvent> events) => _resolver(events);
}
