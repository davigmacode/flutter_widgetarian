import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'event.dart';

/// The style to be applied to checkbox widget
@immutable
class CheckboxStyle with Diagnosticable {
  /// The size of the checkmark in logical pixels.
  final double? size;

  /// Type of the checkbox shape.
  final BoxShape? shape;

  /// Empty space to surround the outside clickable area.
  final EdgeInsetsGeometry? margin;

  /// Empty space to increase the clickable area.
  final EdgeInsetsGeometry? padding;

  /// Color to be used for the checkbox's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

  /// Color to be used for the checkbox's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the checkbox's border, in logical pixels.
  final double? borderWidth;

  /// The radii for each corner of the checkbox's border.
  final BorderRadius? borderRadius;

  /// The style of this side of the checkbox's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  /// The space between the border or the edge of background
  /// and the checkmark in logical pixels.
  final double? checkmarkInset;

  /// The Color to be apply to the checkmark.
  final Color? checkmarkColor;

  /// Opacity to be apply to [checkmarkColor].
  final double? checkmarkOpacity;

  /// Alpha to be apply to [checkmarkColor].
  final int? checkmarkAlpha;

  /// Stroke width of the checkmark.
  final double? checkmarkWeight;

  /// The type of stroke style
  ///
  /// Defaults to [StrokeStyle.sharp].
  final StrokeStyle? checkmarkStyle;

  /// The overlay color when pressed, hovered over, or focused.
  final Color? overlayColor;

  /// The overlay opacity when pressed, hovered over, or focused.
  final double? overlayOpacity;

  /// Whether the overlay is disabled or not,
  /// when the checkbox has a label.
  final bool? overlayDisabled;

  /// The radius of the overlay.
  /// If the checkbox doesn't have a label.
  final double? overlayRadius;

  static const disabledCheckmarkAlpha = 0x61; // 38%
  static const disabledBackgroundAlpha = 0x0c; // 38% * 12% = 5%
  static const disabledBorderAlpha = 0x0c; // 38% * 12% = 5%

  /// Create a raw style of checkbox widget
  const CheckboxStyle({
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
    this.checkmarkInset,
    this.checkmarkColor,
    this.checkmarkOpacity,
    this.checkmarkAlpha,
    this.checkmarkWeight,
    this.checkmarkStyle,
    this.overlayColor,
    this.overlayOpacity,
    this.overlayDisabled,
    this.overlayRadius,
  });

  /// Create a checkbox's style from another style
  CheckboxStyle.from(CheckboxStyle? other)
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
        checkmarkInset = other?.checkmarkInset,
        checkmarkColor = other?.checkmarkColor,
        checkmarkOpacity = other?.checkmarkOpacity,
        checkmarkAlpha = other?.checkmarkAlpha,
        checkmarkWeight = other?.checkmarkWeight,
        checkmarkStyle = other?.checkmarkStyle,
        overlayColor = other?.overlayColor,
        overlayOpacity = other?.overlayOpacity,
        overlayDisabled = other?.overlayDisabled,
        overlayRadius = other?.overlayRadius;

  /// Creates a copy of this [CheckboxStyle] but with
  /// the given fields replaced with the new values.
  CheckboxStyle copyWith({
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
    BorderRadius? borderRadius,
    BorderStyle? borderStyle,
    double? checkmarkInset,
    Color? checkmarkColor,
    double? checkmarkOpacity,
    int? checkmarkAlpha,
    double? checkmarkWeight,
    StrokeStyle? checkmarkStyle,
    Color? overlayColor,
    double? overlayOpacity,
    bool? overlayDisabled,
    double? overlayRadius,
    bool? mergeResolved,
    CheckboxStyle? selectedStyle,
    CheckboxStyle? indeterminateStyle,
    CheckboxStyle? focusedStyle,
    CheckboxStyle? hoveredStyle,
    CheckboxStyle? pressedStyle,
    CheckboxStyle? disabledStyle,
  }) {
    final style = CheckboxStyle(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      shape: shape ?? this.shape,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      size: size ?? this.size,
      checkmarkInset: checkmarkInset ?? this.checkmarkInset,
      checkmarkColor: checkmarkColor ?? this.checkmarkColor,
      checkmarkOpacity: checkmarkOpacity ?? this.checkmarkOpacity,
      checkmarkAlpha: checkmarkAlpha ?? this.checkmarkAlpha,
      checkmarkWeight: checkmarkWeight ?? this.checkmarkWeight,
      checkmarkStyle: checkmarkStyle ?? this.checkmarkStyle,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayOpacity: overlayOpacity ?? this.overlayOpacity,
      overlayDisabled: overlayDisabled ?? this.overlayDisabled,
      overlayRadius: overlayRadius ?? this.overlayRadius,
    );

    final hasDrivenStyle = [
      mergeResolved,
      selectedStyle,
      indeterminateStyle,
      focusedStyle,
      hoveredStyle,
      pressedStyle,
      disabledStyle,
    ].any((el) => el != null);

    if (hasDrivenStyle) {
      return DrivenCheckboxStyle.from(
        style,
        selectedStyle: selectedStyle,
        indeterminateStyle: indeterminateStyle,
        focusedStyle: focusedStyle,
        hoveredStyle: hoveredStyle,
        pressedStyle: pressedStyle,
        disabledStyle: disabledStyle,
        mergeResolved: mergeResolved,
      );
    }
    return style;
  }

  /// Creates a copy of this [CheckboxStyle] but with
  /// the given fields replaced with the new values.
  CheckboxStyle merge(CheckboxStyle? other) {
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
      checkmarkInset: other.checkmarkInset,
      checkmarkColor: other.checkmarkColor,
      checkmarkOpacity: other.checkmarkOpacity,
      checkmarkAlpha: other.checkmarkAlpha,
      checkmarkWeight: other.checkmarkWeight,
      checkmarkStyle: other.checkmarkStyle,
      overlayColor: other.overlayColor,
      overlayOpacity: other.overlayOpacity,
      overlayDisabled: other.overlayDisabled,
      overlayRadius: other.overlayRadius,
    );

    if (other is DrivenCheckboxStyle) {
      style = style.copyWith(
        selectedStyle: other.selectedStyle,
        indeterminateStyle: other.indeterminateStyle,
        focusedStyle: other.focusedStyle,
        hoveredStyle: other.hoveredStyle,
        pressedStyle: other.pressedStyle,
        disabledStyle: other.disabledStyle,
        mergeResolved: other.mergeResolved,
      );
    }

    return style;
  }

  /// Linearly interpolate between two [CheckboxStyle] objects.
  static CheckboxStyle? lerp(CheckboxStyle? a, CheckboxStyle? b, double t) {
    if (a == null && b == null) return null;
    return CheckboxStyle(
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
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      borderStyle: lerpEnum(a?.borderStyle, b?.borderStyle, t),
      checkmarkInset: lerpDouble(a?.checkmarkInset, b?.checkmarkInset, t),
      checkmarkColor: Color.lerp(a?.checkmarkColor, b?.checkmarkColor, t),
      checkmarkWeight: lerpDouble(a?.checkmarkWeight, b?.checkmarkWeight, t),
      checkmarkStyle: lerpEnum(a?.checkmarkStyle, b?.checkmarkStyle, t),
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
        'checkmarkInset': checkmarkInset,
        'checkmarkColor': checkmarkColor,
        'checkmarkOpacity': checkmarkOpacity,
        'checkmarkAlpha': checkmarkAlpha,
        'checkmarkWeight': checkmarkWeight,
        'checkmarkStyle': checkmarkStyle,
        'overlayColor': overlayColor,
        'overlayOpacity': overlayOpacity,
        'overlayDisabled': overlayDisabled,
        'overlayRadius': overlayRadius,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is CheckboxStyle && mapEquals(other.toMap(), toMap());
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

/// Create a [CheckboxStyle] that handle the widget events
class DrivenCheckboxStyle extends CheckboxStyle
    implements DrivenProperty<CheckboxStyle?> {
  /// Whether the resolved style is merged to
  /// the previous resolved style or not
  final bool? mergeResolved;

  /// The style to be resolved when
  /// events includes [CheckboxEvent.selected].
  final CheckboxStyle? selectedStyle;

  /// The style to be resolved when
  /// events includes [CheckboxEvent.indeterminate].
  final CheckboxStyle? indeterminateStyle;

  /// The style to be resolved when
  /// events includes [CheckboxEvent.focused].
  final CheckboxStyle? focusedStyle;

  /// The style to be resolved when
  /// events includes [CheckboxEvent.hovered].
  final CheckboxStyle? hoveredStyle;

  /// The style to be resolved when
  /// events includes [CheckboxEvent.pressed].
  final CheckboxStyle? pressedStyle;

  /// The style to be resolved when
  /// events includes [CheckboxEvent.disabled].
  final CheckboxStyle? disabledStyle;

  /// Map of driven style, order matters
  Map<WidgetEvent, CheckboxStyle?> get driven => {
        WidgetEvent.selected: selectedStyle,
        WidgetEvent.indeterminate: indeterminateStyle,
        WidgetEvent.focused: focusedStyle,
        WidgetEvent.hovered: hoveredStyle,
        WidgetEvent.pressed: pressedStyle,
        WidgetEvent.disabled: disabledStyle,
      };

  /// Create a raw of driven checkbox style
  const DrivenCheckboxStyle({
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
    super.checkmarkInset,
    super.checkmarkColor,
    super.checkmarkOpacity,
    super.checkmarkAlpha,
    super.checkmarkWeight,
    super.checkmarkStyle,
    super.overlayColor,
    super.overlayOpacity,
    super.overlayDisabled,
    super.overlayRadius,
    this.selectedStyle,
    this.indeterminateStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  });

  /// Create a [DrivenCheckboxStyle] with value
  /// from another [CheckboxStyle].
  DrivenCheckboxStyle.from(
    CheckboxStyle? enabledStyle, {
    this.selectedStyle,
    this.indeterminateStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  }) : super.from(enabledStyle);

  /// Create a [DrivenCheckboxStyle] from a resolver callback
  DrivenCheckboxStyle.resolver(
    DrivenPropertyResolver<CheckboxStyle?> resolver, {
    this.mergeResolved = false,
  })  : selectedStyle = resolver({WidgetEvent.selected}),
        indeterminateStyle = resolver({WidgetEvent.indeterminate}),
        focusedStyle = resolver({WidgetEvent.focused}),
        hoveredStyle = resolver({WidgetEvent.hovered}),
        pressedStyle = resolver({WidgetEvent.pressed}),
        disabledStyle = resolver({WidgetEvent.disabled}),
        super.from(resolver({}));

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [CheckboxStyle],
  /// otherwise returns the value itself.
  static CheckboxStyle? evaluate(
    CheckboxStyle? value,
    Set<WidgetEvent> events,
  ) {
    return DrivenProperty.evaluate<CheckboxStyle?>(value, events);
  }

  @override
  CheckboxStyle resolve(Set<WidgetEvent> events) {
    CheckboxStyle style = this;
    for (var e in driven.entries) {
      if (events.contains(e.key)) {
        final evaluated = evaluate(e.value, events);
        style = mergeResolved != false
            ? style.merge(evaluated)
            : CheckboxStyle.from(evaluated);
      }
    }
    return style;
  }

  /// Creates a copy of this [DrivenCheckboxStyle] but with
  /// the given fields replaced with the new values.
  @override
  DrivenCheckboxStyle copyWith({
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
    BorderRadius? borderRadius,
    BorderStyle? borderStyle,
    double? checkmarkInset,
    Color? checkmarkColor,
    double? checkmarkOpacity,
    int? checkmarkAlpha,
    double? checkmarkWeight,
    StrokeStyle? checkmarkStyle,
    Color? overlayColor,
    double? overlayOpacity,
    bool? overlayDisabled,
    double? overlayRadius,
    bool? mergeResolved,
    CheckboxStyle? selectedStyle,
    CheckboxStyle? indeterminateStyle,
    CheckboxStyle? focusedStyle,
    CheckboxStyle? hoveredStyle,
    CheckboxStyle? pressedStyle,
    CheckboxStyle? disabledStyle,
  }) {
    return DrivenCheckboxStyle(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      shape: shape ?? this.shape,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      size: size ?? this.size,
      checkmarkInset: checkmarkInset ?? this.checkmarkInset,
      checkmarkColor: checkmarkColor ?? this.checkmarkColor,
      checkmarkOpacity: checkmarkOpacity ?? this.checkmarkOpacity,
      checkmarkAlpha: checkmarkAlpha ?? this.checkmarkAlpha,
      checkmarkWeight: checkmarkWeight ?? this.checkmarkWeight,
      checkmarkStyle: checkmarkStyle ?? this.checkmarkStyle,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayOpacity: overlayOpacity ?? this.overlayOpacity,
      overlayDisabled: overlayDisabled ?? this.overlayDisabled,
      overlayRadius: overlayRadius ?? this.overlayRadius,
      mergeResolved: mergeResolved ?? this.mergeResolved,
      selectedStyle: this.selectedStyle?.merge(selectedStyle) ?? selectedStyle,
      indeterminateStyle: this.indeterminateStyle?.merge(indeterminateStyle) ??
          indeterminateStyle,
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
    properties
        .add(DiagnosticsProperty('indeterminateStyle', indeterminateStyle));
    properties.add(DiagnosticsProperty('focusedStyle', focusedStyle));
    properties.add(DiagnosticsProperty('hoveredStyle', hoveredStyle));
    properties.add(DiagnosticsProperty('pressedStyle', pressedStyle));
    properties.add(DiagnosticsProperty('disabledStyle', disabledStyle));
  }
}
