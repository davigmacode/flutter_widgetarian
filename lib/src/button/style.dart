import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/src/layout/sheet/style.dart';
import 'package:widgetarian/src/layout/sheet/types.dart';
import 'event.dart';

typedef ButtonVariant = SheetVariant;
typedef ButtonSeverity = SheetSeverity;

/// The style to be applied to button widget
@immutable
class ButtonStyle extends SheetStyle {
  /// Create a raw button's style
  const ButtonStyle({
    super.variant,
    super.width,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundColor,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundColor,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderColor,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle,
    super.shape,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
  });

  /// Create a button's style from another style
  ButtonStyle.from(ButtonStyle? other)
      : super(
          variant: other?.variant,
          width: other?.width,
          height: other?.height,
          margin: other?.margin,
          padding: other?.padding,
          clipBehavior: other?.clipBehavior,
          overlayDisabled: other?.overlayDisabled,
          overlayColor: other?.overlayColor,
          shadowColor: other?.shadowColor,
          surfaceTint: other?.surfaceTint,
          elevation: other?.elevation,
          foregroundStyle: other?.foregroundStyle,
          foregroundColor: other?.foregroundColor,
          foregroundOpacity: other?.foregroundOpacity,
          foregroundAlpha: other?.foregroundAlpha,
          foregroundSpacing: other?.foregroundSpacing,
          foregroundLoosen: other?.foregroundLoosen,
          foregroundExpanded: other?.foregroundExpanded,
          foregroundAlign: other?.foregroundAlign,
          foregroundJustify: other?.foregroundJustify,
          backgroundColor: other?.backgroundColor,
          backgroundOpacity: other?.backgroundOpacity,
          backgroundAlpha: other?.backgroundAlpha,
          borderColor: other?.borderColor,
          borderOpacity: other?.borderOpacity,
          borderAlpha: other?.borderAlpha,
          borderWidth: other?.borderWidth,
          borderRadius: other?.borderRadius,
          borderStyle: other?.borderStyle,
          shape: other?.shape,
          iconColor: other?.iconColor,
          iconOpacity: other?.iconOpacity,
          iconSize: other?.iconSize,
        );

  /// An [ButtonStyle] with some reasonable default values.
  static const defaults = ButtonStyle(
    // clipBehavior: Clip.antiAlias,
    // borderRadius: BorderRadius.all(Radius.circular(25)),
    // margin: EdgeInsets.zero,
    padding: EdgeInsets.symmetric(horizontal: 16),
    // height: 40.0,
    // iconSize: 18.0,
    // foregroundSpacing: 8.0,
    // foregroundLoosen: true,
    // foregroundJustify: MainAxisAlignment.center,
    // foregroundStyle: TextStyle(height: 1),
  );

  static const disabledForegroundAlpha = 0x61; // 38%
  static const disabledBackgroundAlpha = 0x0c; // 38% * 12% = 5%
  static const disabledBorderAlpha = 0x0c; // 38% * 12% = 5%

  /// Creates a copy of this [ButtonStyle] but with
  /// [padding] is [EdgeInsets.zero] and squared size.
  ButtonStyle icon({
    BoxShape shape = BoxShape.circle,
    double? size,
  }) {
    return copyWith(
      shape: shape,
      width: size ?? defaults.height,
      height: size ?? defaults.height,
      padding: EdgeInsets.zero,
    );
  }

  /// Creates a copy of this [ButtonStyle] but with
  /// the [width] replaced with [double.infinity].
  ButtonStyle block({
    bool? expanded,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
  }) {
    return copyWith(
      width: double.infinity,
      foregroundExpanded: expanded,
      foregroundAlign: alignChildren,
      foregroundJustify: justifyChildren,
    );
  }

  /// Creates a copy of this [ButtonStyle] but with
  /// the given fields replaced with the new values.
  @override
  ButtonStyle copyWith({
    ButtonVariant? variant,
    SheetSeverity? severity,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Alignment? alignment,
    Clip? clipBehavior,
    bool? overlayDisabled,
    Color? overlayColor,
    Color? shadowColor,
    Color? surfaceTint,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    bool? foregroundLoosen,
    bool? foregroundExpanded,
    CrossAxisAlignment? foregroundAlign,
    MainAxisAlignment? foregroundJustify,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadius? borderRadius,
    BorderStyle? borderStyle,
    BoxShape? shape,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    bool? mergeResolved,
    ButtonStyle? selectedStyle,
    ButtonStyle? disabledStyle,
    ButtonStyle? hoveredStyle,
    ButtonStyle? focusedStyle,
    ButtonStyle? pressedStyle,
  }) {
    final style = ButtonStyle(
      variant: variant ?? this.variant,
      width: width ?? this.width,
      height: height ?? this.height,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      overlayDisabled: overlayDisabled ?? this.overlayDisabled,
      overlayColor: overlayColor ?? this.overlayColor,
      shadowColor: shadowColor ?? this.shadowColor,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      elevation: elevation ?? this.elevation,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      foregroundSpacing: foregroundSpacing ?? this.foregroundSpacing,
      foregroundLoosen: foregroundLoosen ?? this.foregroundLoosen,
      foregroundExpanded: foregroundExpanded ?? this.foregroundExpanded,
      foregroundAlign: foregroundAlign ?? this.foregroundAlign,
      foregroundJustify: foregroundJustify ?? this.foregroundJustify,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      shape: shape ?? this.shape,
      iconColor: iconColor ?? this.iconColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconSize: iconSize ?? this.iconSize,
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
      return DrivenButtonStyle.from(
        style,
        selectedStyle: selectedStyle,
        disabledStyle: disabledStyle,
        hoveredStyle: hoveredStyle,
        focusedStyle: focusedStyle,
        pressedStyle: pressedStyle,
        mergeResolved: mergeResolved,
      );
    }
    return style;
  }

  /// Creates a copy of this [ButtonStyle] but with
  /// the given fields replaced with the new values.
  @override
  ButtonStyle merge(covariant ButtonStyle? other) {
    // if null return current object
    if (other == null) return this;

    var style = copyWith(
      variant: other.variant,
      width: other.width,
      height: other.height,
      margin: other.margin,
      padding: other.padding,
      clipBehavior: other.clipBehavior,
      overlayDisabled: other.overlayDisabled,
      overlayColor: other.overlayColor,
      shadowColor: other.shadowColor,
      surfaceTint: other.surfaceTint,
      elevation: other.elevation,
      foregroundStyle: other.foregroundStyle,
      foregroundColor: other.foregroundColor,
      foregroundOpacity: other.foregroundOpacity,
      foregroundAlpha: other.foregroundAlpha,
      foregroundSpacing: other.foregroundSpacing,
      foregroundLoosen: other.foregroundLoosen,
      foregroundExpanded: other.foregroundExpanded,
      foregroundAlign: other.foregroundAlign,
      foregroundJustify: other.foregroundJustify,
      backgroundColor: other.backgroundColor,
      backgroundOpacity: other.backgroundOpacity,
      backgroundAlpha: other.backgroundAlpha,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderRadius: other.borderRadius,
      borderStyle: other.borderStyle,
      shape: other.shape,
      iconColor: other.iconColor,
      iconOpacity: other.iconOpacity,
      iconSize: other.iconSize,
    );

    if (other is DrivenButtonStyle) {
      style = style.copyWith(
        mergeResolved: other.mergeResolved,
        selectedStyle: other.selectedStyle,
        focusedStyle: other.focusedStyle,
        hoveredStyle: other.hoveredStyle,
        pressedStyle: other.pressedStyle,
        disabledStyle: other.disabledStyle,
      );
    }

    return style;
  }

  /// Linearly interpolate between two [ButtonStyle] objects.
  static ButtonStyle? lerp(ButtonStyle? a, ButtonStyle? b, double t) {
    if (a == null && b == null) return null;
    return ButtonStyle(
      variant: lerpEnum(a?.variant, b?.variant, t),
      shape: lerpEnum(a?.shape, b?.shape, t),
      width: lerpDouble(a?.width, b?.width, t),
      height: lerpDouble(a?.height, b?.height, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      clipBehavior: lerpEnum(a?.clipBehavior, b?.clipBehavior, t),
      overlayDisabled: lerpBool(a?.overlayDisabled, b?.overlayDisabled, t),
      overlayColor: Color.lerp(a?.overlayColor, b?.overlayColor, t),
      shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
      surfaceTint: Color.lerp(a?.surfaceTint, b?.surfaceTint, t),
      elevation: lerpDouble(a?.elevation, b?.elevation, t),
      foregroundStyle:
          TextStyle.lerp(a?.foregroundStyle, b?.foregroundStyle, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      foregroundOpacity:
          lerpDouble(a?.foregroundOpacity, b?.foregroundOpacity, t),
      foregroundAlpha: lerpInt(a?.foregroundAlpha, b?.foregroundAlpha, t),
      foregroundSpacing:
          lerpDouble(a?.foregroundSpacing, b?.foregroundSpacing, t),
      foregroundLoosen: lerpBool(a?.foregroundLoosen, b?.foregroundLoosen, t),
      foregroundExpanded:
          lerpBool(a?.foregroundExpanded, b?.foregroundExpanded, t),
      foregroundAlign: lerpEnum(a?.foregroundAlign, b?.foregroundAlign, t),
      foregroundJustify:
          lerpEnum(a?.foregroundJustify, b?.foregroundJustify, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      backgroundOpacity:
          lerpDouble(a?.backgroundOpacity, b?.backgroundOpacity, t),
      backgroundAlpha: lerpInt(a?.backgroundAlpha, b?.backgroundAlpha, t),
      borderColor: Color.lerp(a?.borderColor, b?.backgroundColor, t),
      borderOpacity: lerpDouble(a?.borderOpacity, b?.borderOpacity, t),
      borderAlpha: lerpInt(a?.borderAlpha, b?.borderAlpha, t),
      borderWidth: lerpDouble(a?.borderWidth, b?.borderWidth, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      borderStyle: lerpEnum(a?.borderStyle, b?.borderStyle, t),
      iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
      iconOpacity: lerpDouble(a?.iconOpacity, b?.iconOpacity, t),
      iconSize: lerpDouble(a?.iconSize, b?.iconSize, t),
    );
  }
}

/// Create a [ButtonStyle] when some events occurs
class DrivenButtonStyle extends ButtonStyle
    implements DrivenProperty<ButtonStyle?> {
  /// Whether the resolved style is merged to
  /// the previous resolved style or not
  final bool? mergeResolved;

  /// The style to be resolved when
  /// events includes [ButtonEvent.selected].
  final ButtonStyle? selectedStyle;

  /// The style to be resolved when
  /// events includes [ButtonEvent.focused].
  final ButtonStyle? focusedStyle;

  /// The style to be resolved when
  /// events includes [ButtonEvent.hovered].
  final ButtonStyle? hoveredStyle;

  /// The style to be resolved when
  /// events includes [ButtonEvent.pressed].
  final ButtonStyle? pressedStyle;

  /// The style to be resolved when
  /// events includes [ButtonEvent.disabled].
  final ButtonStyle? disabledStyle;

  /// Map of driven style, order matters
  Map<WidgetEvent, ButtonStyle?> get driven => {
        WidgetEvent.selected: selectedStyle,
        WidgetEvent.focused: focusedStyle,
        WidgetEvent.hovered: hoveredStyle,
        WidgetEvent.pressed: pressedStyle,
        WidgetEvent.disabled: disabledStyle,
      };

  /// Create a raw [DrivenButtonStyle].
  const DrivenButtonStyle({
    super.variant,
    super.width,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundColor,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundColor,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderColor,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle,
    super.shape,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    this.selectedStyle,
    this.disabledStyle,
    this.hoveredStyle,
    this.focusedStyle,
    this.pressedStyle,
    this.mergeResolved,
  });

  /// Create a [DrivenButtonStyle] with value
  /// from another [ButtonStyle].
  DrivenButtonStyle.from(
    ButtonStyle? enabled, {
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  }) : super.from(enabled);

  /// Create a [DrivenButtonStyle] with default value for text style.
  const DrivenButtonStyle.text({
    Color? color,
    super.width,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundColor,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderColor,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle = BorderStyle.none,
    super.shape,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    this.selectedStyle,
    this.disabledStyle,
    this.hoveredStyle,
    this.focusedStyle,
    this.pressedStyle,
    this.mergeResolved,
  }) : super(
          variant: SheetVariant.text,
          foregroundColor: color,
        );

  /// Create a [DrivenButtonStyle] with default value for tonal style.
  const DrivenButtonStyle.tonal({
    Color? color,
    super.width,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderColor,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle = BorderStyle.none,
    super.shape,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    this.selectedStyle,
    this.disabledStyle,
    this.hoveredStyle,
    this.focusedStyle,
    this.pressedStyle,
    this.mergeResolved,
  }) : super(
          variant: SheetVariant.tonal,
          foregroundColor: color,
          backgroundColor: color,
        );

  /// Create a [DrivenButtonStyle] with default value for filled style.
  const DrivenButtonStyle.filled({
    Color? color,
    super.width,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundColor,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle = BorderStyle.none,
    super.shape,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    this.selectedStyle,
    this.disabledStyle,
    this.hoveredStyle,
    this.focusedStyle,
    this.pressedStyle,
    this.mergeResolved,
  }) : super(
          backgroundColor: color,
          borderColor: color,
          variant: SheetVariant.filled,
        );

  /// Create a [DrivenButtonStyle] with default value for elevated style.
  const DrivenButtonStyle.elevated({
    Color? color,
    super.width,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundColor,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle = BorderStyle.none,
    super.shape,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    this.selectedStyle,
    this.disabledStyle,
    this.hoveredStyle,
    this.focusedStyle,
    this.pressedStyle,
    this.mergeResolved,
  }) : super(
          backgroundColor: color,
          borderColor: color,
          variant: SheetVariant.elevated,
        );

  /// Create a [DrivenButtonStyle] with default value for outlined style.
  const DrivenButtonStyle.outlined({
    Color? color,
    super.width,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundColor,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle = BorderStyle.solid,
    super.shape,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    this.selectedStyle,
    this.disabledStyle,
    this.hoveredStyle,
    this.focusedStyle,
    this.pressedStyle,
    this.mergeResolved,
  }) : super(
          foregroundColor: color,
          borderColor: color,
          variant: SheetVariant.outlined,
        );

  /// Create a [DrivenButtonStyle] from a resolver callback
  DrivenButtonStyle.resolver(
    DrivenPropertyResolver<ButtonStyle?> resolver, {
    this.mergeResolved = false,
  })  : selectedStyle = resolver({WidgetEvent.selected}),
        focusedStyle = resolver({WidgetEvent.focused}),
        hoveredStyle = resolver({WidgetEvent.hovered}),
        pressedStyle = resolver({WidgetEvent.pressed}),
        disabledStyle = resolver({WidgetEvent.disabled}),
        super.from(resolver({}));

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [ButtonStyle],
  /// otherwise returns the value itself.
  static ButtonStyle? evaluate(ButtonStyle? value, Set<WidgetEvent> events) {
    return DrivenProperty.evaluate<ButtonStyle?>(value, events);
  }

  @override
  ButtonStyle resolve(Set<WidgetEvent> events) {
    ButtonStyle style = this;
    for (var e in driven.entries) {
      if (events.contains(e.key)) {
        final evaluated = evaluate(e.value, events);
        style = mergeResolved != false
            ? style.merge(evaluated)
            : ButtonStyle.from(evaluated);
      }
    }
    return style;
  }

  /// Creates a copy of this [DrivenButtonStyle] but with
  /// the given fields replaced with the new values.
  @override
  DrivenButtonStyle copyWith({
    ButtonVariant? variant,
    SheetSeverity? severity,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Alignment? alignment,
    Clip? clipBehavior,
    bool? overlayDisabled,
    Color? overlayColor,
    Color? shadowColor,
    Color? surfaceTint,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    bool? foregroundLoosen,
    bool? foregroundExpanded,
    CrossAxisAlignment? foregroundAlign,
    MainAxisAlignment? foregroundJustify,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadius? borderRadius,
    BorderStyle? borderStyle,
    BoxShape? shape,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    bool? mergeResolved,
    ButtonStyle? selectedStyle,
    ButtonStyle? disabledStyle,
    ButtonStyle? hoveredStyle,
    ButtonStyle? focusedStyle,
    ButtonStyle? pressedStyle,
  }) {
    return DrivenButtonStyle(
      variant: variant ?? this.variant,
      width: width ?? this.width,
      height: height ?? this.height,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      overlayDisabled: overlayDisabled ?? this.overlayDisabled,
      overlayColor: overlayColor ?? this.overlayColor,
      shadowColor: shadowColor ?? this.shadowColor,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      elevation: elevation ?? this.elevation,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      foregroundSpacing: foregroundSpacing ?? this.foregroundSpacing,
      foregroundLoosen: foregroundLoosen ?? this.foregroundLoosen,
      foregroundExpanded: foregroundExpanded ?? this.foregroundExpanded,
      foregroundAlign: foregroundAlign ?? this.foregroundAlign,
      foregroundJustify: foregroundJustify ?? this.foregroundJustify,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      shape: shape ?? this.shape,
      iconColor: iconColor ?? this.iconColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconSize: iconSize ?? this.iconSize,
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
