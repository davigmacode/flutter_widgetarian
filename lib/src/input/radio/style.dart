import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'event.dart';

/// The style to be applied to [Radio] widget
@immutable
class RadioStyle with Diagnosticable {
  /// The size of the radio in logical pixels.
  final double? size;

  /// Type of the radio border shape.
  final BoxShape? shape;

  /// Empty space to surround the outside clickable area.
  final EdgeInsetsGeometry? margin;

  /// Empty space to increase the clickable area.
  final EdgeInsetsGeometry? padding;

  /// Color to be used for the radio's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

  /// Color to be used for the radio's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the radio's border, in logical pixels.
  final double? borderWidth;

  /// The radii for each corner of the radio's border.
  final BorderRadiusGeometry? borderRadius;

  /// The style of this side of the radio's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  final double? thumbInset;

  /// The Color to be apply to the radio's thumb.
  final Color? thumbColor;

  /// Opacity to be apply to [thumbColor].
  final double? thumbOpacity;

  /// Alpha to be apply to [thumbColor].
  final int? thumbAlpha;

  /// The overlay color when pressed, hovered over, or focused.
  final Color? overlayColor;

  /// The overlay opacity when pressed, hovered over, or focused.
  final double? overlayOpacity;

  /// Whether the overlay is disabled or not,
  final bool? overlayDisabled;

  /// The radius of the overlay.
  final double? overlayRadius;

  /// An [RadioStyle] with some reasonable default values.
  static const defaults = DrivenRadioStyle(
    size: 18.0,
    shape: BoxShape.circle,
    padding: EdgeInsets.all(9),
    borderStyle: BorderStyle.solid,
    borderRadius: BorderRadius.zero,
    borderWidth: 2.0,
    thumbOpacity: 0,
    thumbInset: 1,
    selectedStyle: RadioStyle(
      thumbInset: .45,
      thumbOpacity: 1,
    ),
    hoveredStyle: RadioStyle(overlayRadius: 20.0),
    pressedStyle: RadioStyle(overlayRadius: 10.0),
    disabledStyle: RadioStyle(
      backgroundAlpha: RadioStyle.disabledBackgroundAlpha,
      borderAlpha: RadioStyle.disabledBorderAlpha,
    ),
  );

  static const disabledBackgroundAlpha = 0x0c; // 38% * 12% = 5%
  static const disabledBorderAlpha = 0x0c; // 38% * 12% = 5%

  /// Create a raw style of radio widget
  const RadioStyle({
    this.size,
    this.shape,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
    this.thumbInset,
    this.thumbColor,
    this.thumbOpacity,
    this.thumbAlpha,
    this.overlayColor,
    this.overlayOpacity,
    this.overlayDisabled,
    this.overlayRadius,
  });

  /// Create a checkbox's style from another style
  RadioStyle.from(RadioStyle? other)
      : size = other?.size,
        shape = other?.shape,
        margin = other?.margin,
        padding = other?.padding,
        backgroundColor = other?.backgroundColor,
        backgroundOpacity = other?.backgroundOpacity,
        backgroundAlpha = other?.backgroundAlpha,
        borderColor = other?.borderColor,
        borderOpacity = other?.borderOpacity,
        borderAlpha = other?.borderAlpha,
        borderWidth = other?.borderWidth,
        borderRadius = other?.borderRadius,
        borderStyle = other?.borderStyle,
        thumbInset = other?.thumbInset,
        thumbColor = other?.thumbColor,
        thumbOpacity = other?.thumbOpacity,
        thumbAlpha = other?.thumbAlpha,
        overlayColor = other?.overlayColor,
        overlayOpacity = other?.overlayOpacity,
        overlayDisabled = other?.overlayDisabled,
        overlayRadius = other?.overlayRadius;

  /// Creates a copy of this [RadioStyle] but with
  /// the given fields replaced with the new values.
  RadioStyle copyWith({
    double? size,
    BoxShape? shape,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle,
    double? thumbInset,
    Color? thumbColor,
    double? thumbOpacity,
    int? thumbAlpha,
    Color? overlayColor,
    double? overlayOpacity,
    bool? overlayDisabled,
    double? overlayRadius,
    bool? mergeResolved,
    RadioStyle? selectedStyle,
    RadioStyle? focusedStyle,
    RadioStyle? hoveredStyle,
    RadioStyle? pressedStyle,
    RadioStyle? disabledStyle,
  }) {
    final style = RadioStyle(
      size: size ?? this.size,
      shape: shape ?? this.shape,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      thumbInset: thumbInset ?? this.thumbInset,
      thumbColor: thumbColor ?? this.thumbColor,
      thumbOpacity: thumbOpacity ?? this.thumbOpacity,
      thumbAlpha: thumbAlpha ?? this.thumbAlpha,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayOpacity: overlayOpacity ?? this.overlayOpacity,
      overlayDisabled: overlayDisabled ?? this.overlayDisabled,
      overlayRadius: overlayRadius ?? this.overlayRadius,
    );

    final hasDrivenStyle = [
      mergeResolved,
      selectedStyle,
      focusedStyle,
      hoveredStyle,
      pressedStyle,
      disabledStyle,
    ].any((el) => el != null);

    if (hasDrivenStyle) {
      return DrivenRadioStyle.from(
        style,
        selectedStyle: selectedStyle,
        focusedStyle: focusedStyle,
        hoveredStyle: hoveredStyle,
        pressedStyle: pressedStyle,
        disabledStyle: disabledStyle,
        mergeResolved: mergeResolved,
      );
    }
    return style;
  }

  /// Creates a copy of this [RadioStyle] but with
  /// the given fields replaced with the new values.
  RadioStyle merge(RadioStyle? other) {
    // if null return current object
    if (other == null) return this;

    var style = copyWith(
      size: other.size,
      shape: other.shape,
      margin: other.margin,
      padding: other.padding,
      backgroundColor: other.backgroundColor,
      backgroundOpacity: other.backgroundOpacity,
      backgroundAlpha: other.backgroundAlpha,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderRadius: other.borderRadius,
      borderStyle: other.borderStyle,
      thumbInset: other.thumbInset,
      thumbColor: other.thumbColor,
      thumbOpacity: other.thumbOpacity,
      thumbAlpha: other.thumbAlpha,
      overlayColor: other.overlayColor,
      overlayOpacity: other.overlayOpacity,
      overlayDisabled: other.overlayDisabled,
      overlayRadius: other.overlayRadius,
    );

    if (other is DrivenRadioStyle) {
      style = style.copyWith(
        selectedStyle: other.selectedStyle,
        focusedStyle: other.focusedStyle,
        hoveredStyle: other.hoveredStyle,
        pressedStyle: other.pressedStyle,
        disabledStyle: other.disabledStyle,
        mergeResolved: other.mergeResolved,
      );
    }

    return style;
  }

  /// Linearly interpolate between two [RadioStyle] objects.
  static RadioStyle? lerp(RadioStyle? a, RadioStyle? b, double t) {
    if (a == null && b == null) return null;
    return RadioStyle(
      size: lerpDouble(a?.size, b?.size, t),
      shape: lerpEnum(a?.shape, b?.shape, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      backgroundOpacity:
          lerpDouble(a?.backgroundOpacity, b?.backgroundOpacity, t),
      backgroundAlpha: lerpInt(a?.backgroundAlpha, b?.backgroundAlpha, t),
      borderColor: Color.lerp(a?.borderColor, b?.borderColor, t),
      borderOpacity: lerpDouble(a?.borderOpacity, b?.borderOpacity, t),
      borderAlpha: lerpInt(a?.borderAlpha, b?.borderAlpha, t),
      borderWidth: lerpDouble(a?.borderWidth, b?.borderWidth, t),
      borderRadius:
          BorderRadiusGeometry.lerp(a?.borderRadius, b?.borderRadius, t),
      borderStyle: lerpEnum(a?.borderStyle, b?.borderStyle, t),
      thumbInset: lerpDouble(a?.thumbInset, b?.thumbInset, t),
      thumbColor: Color.lerp(a?.thumbColor, b?.thumbColor, t),
      thumbOpacity: lerpDouble(a?.thumbOpacity, b?.thumbOpacity, t),
      thumbAlpha: lerpInt(a?.thumbAlpha, b?.thumbAlpha, t),
      overlayColor: Color.lerp(a?.overlayColor, b?.overlayColor, t),
      overlayOpacity: lerpDouble(a?.overlayOpacity, b?.overlayOpacity, t),
      overlayDisabled: lerpBool(a?.overlayDisabled, b?.overlayDisabled, t),
      overlayRadius: lerpDouble(a?.overlayRadius, b?.overlayRadius, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'size': size,
        'shape': shape,
        'margin': margin,
        'padding': padding,
        'backgroundColor': backgroundColor,
        'backgroundOpacity': backgroundOpacity,
        'backgroundAlpha': backgroundAlpha,
        'borderColor': borderColor,
        'borderOpacity': borderOpacity,
        'borderAlpha': borderAlpha,
        'borderWidth': borderWidth,
        'borderRadius': borderRadius,
        'borderStyle': borderStyle,
        'thumbInset': thumbInset,
        'thumbColor': thumbColor,
        'thumbOpacity': thumbOpacity,
        'thumbAlpha': thumbAlpha,
        'overlayColor': overlayColor,
        'overlayOpacity': overlayOpacity,
        'overlayDisabled': overlayDisabled,
        'overlayRadius': overlayRadius,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is RadioStyle && mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => Object.hashAll(toMap().values);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    toMap().entries.forEach((el) {
      properties.add(DiagnosticsProperty(el.key, el.value));
    });
  }
}

/// Create a [RadioStyle] that handle the widget events
class DrivenRadioStyle extends RadioStyle
    implements DrivenProperty<RadioStyle?> {
  /// Whether the resolved style is merged to
  /// the previous resolved style or not
  final bool? mergeResolved;

  /// The style to be resolved when
  /// events includes [RadioEvent.selected].
  final RadioStyle? selectedStyle;

  /// The style to be resolved when
  /// events includes [RadioEvent.focused].
  final RadioStyle? focusedStyle;

  /// The style to be resolved when
  /// events includes [RadioEvent.hovered].
  final RadioStyle? hoveredStyle;

  /// The style to be resolved when
  /// events includes [RadioEvent.pressed].
  final RadioStyle? pressedStyle;

  /// The style to be resolved when
  /// events includes [RadioEvent.disabled].
  final RadioStyle? disabledStyle;

  /// Map of driven style, order matters
  Map<WidgetEvent, RadioStyle?> get driven => {
        WidgetEvent.selected: selectedStyle,
        WidgetEvent.focused: focusedStyle,
        WidgetEvent.hovered: hoveredStyle,
        WidgetEvent.pressed: pressedStyle,
        WidgetEvent.disabled: disabledStyle,
      };

  const DrivenRadioStyle({
    super.size,
    super.shape,
    super.margin,
    super.padding,
    super.backgroundColor,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderColor,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle,
    super.thumbInset,
    super.thumbColor,
    super.thumbOpacity,
    super.thumbAlpha,
    super.overlayColor,
    super.overlayOpacity,
    super.overlayDisabled,
    super.overlayRadius,
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  });

  /// Create a [DrivenRadioStyle] with value
  /// from another [RadioStyle].
  DrivenRadioStyle.from(
    RadioStyle? enabledStyle, {
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  }) : super.from(enabledStyle);

  /// Create a [DrivenRadioStyle] from a resolver callback
  DrivenRadioStyle.resolver(
    DrivenPropertyResolver<RadioStyle?> resolver, {
    this.mergeResolved = false,
  })  : selectedStyle = resolver({WidgetEvent.selected}),
        focusedStyle = resolver({WidgetEvent.focused}),
        hoveredStyle = resolver({WidgetEvent.hovered}),
        pressedStyle = resolver({WidgetEvent.pressed}),
        disabledStyle = resolver({WidgetEvent.disabled}),
        super.from(resolver({}));

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [RadioStyle],
  /// otherwise returns the value itself.
  static RadioStyle? evaluate(
    RadioStyle? value,
    Set<WidgetEvent> events,
  ) {
    return DrivenProperty.evaluate<RadioStyle?>(value, events);
  }

  @override
  RadioStyle resolve(Set<WidgetEvent> events) {
    RadioStyle style = this;
    for (var e in driven.entries) {
      if (events.contains(e.key)) {
        final evaluated = evaluate(e.value, events);
        style = mergeResolved != false
            ? style.merge(evaluated)
            : RadioStyle.from(evaluated);
      }
    }
    return style;
  }

  /// Creates a copy of this [DrivenRadioStyle] but with
  /// the given fields replaced with the new values.
  @override
  DrivenRadioStyle copyWith({
    double? size,
    BoxShape? shape,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle,
    double? thumbInset,
    Color? thumbColor,
    double? thumbOpacity,
    int? thumbAlpha,
    Color? overlayColor,
    double? overlayOpacity,
    bool? overlayDisabled,
    double? overlayRadius,
    bool? mergeResolved,
    RadioStyle? selectedStyle,
    RadioStyle? focusedStyle,
    RadioStyle? hoveredStyle,
    RadioStyle? pressedStyle,
    RadioStyle? disabledStyle,
  }) {
    return DrivenRadioStyle(
      size: size ?? this.size,
      shape: shape ?? this.shape,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      thumbInset: thumbInset ?? this.thumbInset,
      thumbColor: thumbColor ?? this.thumbColor,
      thumbOpacity: thumbOpacity ?? this.thumbOpacity,
      thumbAlpha: thumbAlpha ?? this.thumbAlpha,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayOpacity: overlayOpacity ?? this.overlayOpacity,
      overlayDisabled: overlayDisabled ?? this.overlayDisabled,
      overlayRadius: overlayRadius ?? this.overlayRadius,
      mergeResolved: mergeResolved ?? this.mergeResolved,
      selectedStyle: this.selectedStyle?.merge(selectedStyle) ?? selectedStyle,
      focusedStyle: this.focusedStyle?.merge(focusedStyle) ?? focusedStyle,
      hoveredStyle: this.hoveredStyle?.merge(hoveredStyle) ?? hoveredStyle,
      pressedStyle: this.pressedStyle?.merge(pressedStyle) ?? pressedStyle,
      disabledStyle: this.disabledStyle?.merge(disabledStyle) ?? disabledStyle,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('mergeResolved', mergeResolved));
    properties.add(DiagnosticsProperty('selectedStyle', selectedStyle));
    properties.add(DiagnosticsProperty('focusedStyle', focusedStyle));
    properties.add(DiagnosticsProperty('hoveredStyle', hoveredStyle));
    properties.add(DiagnosticsProperty('pressedStyle', pressedStyle));
    properties.add(DiagnosticsProperty('disabledStyle', disabledStyle));
  }
}
