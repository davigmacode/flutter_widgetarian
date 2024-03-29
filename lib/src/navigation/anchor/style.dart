import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';
import 'event.dart';

/// The style to be applied to anchor widget
@immutable
class AnchorStyle with Diagnosticable {
  /// {@template widgetarian.anchor.style.margin}
  /// Empty space to surround the outside anchor.
  /// {@endtemplate}
  final EdgeInsetsGeometry? margin;

  /// {@template widgetarian.anchor.style.padding}
  /// The padding between the contents of the anchor and the outside anchor.
  ///
  /// defaults to [AnchorStyle.defaultPadding].
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template widgetarian.anchor.style.shape}
  /// The shape (e.g., circle, rectangle) to use for the overlay drawn around
  /// this part of the anchor when pressed, hovered over, or focused.
  /// {@endtemplate}
  final BoxShape? shape;

  /// {@template widgetarian.anchor.style.radius}
  /// The radius of the overlay. If the [shape] is [BoxShape.circle].
  /// {@endtemplate}
  final double? radius;

  /// {@template widgetarian.anchor.style.borderRadius}
  /// The clipping radius of the containing rect. This is effective only if
  /// the [shape] is [BoxShape.circle].
  ///
  /// If this is null, it is interpreted as [BorderRadius.zero].
  /// {@endtemplate}
  final BorderRadius? borderRadius;

  /// {@template widgetarian.anchor.style.overlayColor}
  /// The overlay color of the anchor when pressed, hovered over, or focused.
  /// {@endtemplate}
  final Color? overlayColor;

  /// {@template widgetarian.anchor.style.overlayOpacity}
  /// The overlay opacity of the anchor when pressed, hovered over, or focused.
  /// {@endtemplate}
  final double? overlayOpacity;

  /// {@template widgetarian.anchor.style.overlayDisabled}
  /// Whether the overlay is disabled or not
  /// {@endtemplate}
  final bool? overlayDisabled;

  /// {@template widgetarian.anchor.style.overlayEnabled}
  /// Whether the overlay is enabled or not
  /// {@endtemplate}
  bool get overlayEnabled => overlayDisabled != true;

  /// Default [AnchorStyle] constructor.
  const AnchorStyle({
    this.margin,
    this.padding,
    this.shape,
    this.radius,
    this.borderRadius,
    this.overlayColor,
    this.overlayOpacity,
    this.overlayDisabled,
  });

  /// Create an [AnchorStyle] from another style
  AnchorStyle.from(AnchorStyle? other)
      : margin = other?.margin,
        padding = other?.padding,
        shape = other?.shape,
        radius = other?.radius,
        borderRadius = other?.borderRadius,
        overlayColor = other?.overlayColor,
        overlayOpacity = other?.overlayOpacity,
        overlayDisabled = other?.overlayDisabled;

  /// Creates a copy of this [AnchorStyle] but with
  /// the given fields replaced with the new values.
  AnchorStyle copyWith({
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BoxShape? shape,
    double? radius,
    BorderRadius? borderRadius,
    Color? overlayColor,
    double? overlayOpacity,
    bool? overlayDisabled,
    bool? mergeResolved,
    AnchorStyle? focusedStyle,
    AnchorStyle? hoveredStyle,
    AnchorStyle? pressedStyle,
    AnchorStyle? disabledStyle,
  }) {
    final style = AnchorStyle(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      shape: shape ?? this.shape,
      radius: radius ?? this.radius,
      borderRadius: borderRadius ?? this.borderRadius,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayOpacity: overlayOpacity ?? this.overlayOpacity,
      overlayDisabled: overlayDisabled ?? this.overlayDisabled,
    );

    final hasDrivenStyle = [
      mergeResolved,
      focusedStyle,
      hoveredStyle,
      pressedStyle,
      disabledStyle,
    ].any((el) => el != null);

    if (hasDrivenStyle) {
      return DrivenAnchorStyle.from(
        style,
        focusedStyle: focusedStyle,
        hoveredStyle: hoveredStyle,
        pressedStyle: pressedStyle,
        disabledStyle: disabledStyle,
        mergeResolved: mergeResolved,
      );
    }

    return style;
  }

  /// Creates a copy of this [AnchorStyle] but with
  /// the given fields replaced with the new values.
  AnchorStyle merge(AnchorStyle? other) {
    // if null return current object
    if (other == null) return this;

    var style = copyWith(
      margin: other.margin,
      padding: other.padding,
      shape: other.shape,
      radius: other.radius,
      borderRadius: other.borderRadius,
      overlayColor: other.overlayColor,
      overlayOpacity: other.overlayOpacity,
      overlayDisabled: other.overlayDisabled,
    );

    if (other is DrivenAnchorStyle) {
      style = style.copyWith(
        focusedStyle: other.focusedStyle,
        hoveredStyle: other.hoveredStyle,
        pressedStyle: other.pressedStyle,
        disabledStyle: other.disabledStyle,
        mergeResolved: other.mergeResolved,
      );
    }

    return style;
  }

  /// Linearly interpolate between two [AnchorStyle] objects.
  static AnchorStyle? lerp(AnchorStyle? a, AnchorStyle? b, double t) {
    if (a == null && b == null) return null;
    return AnchorStyle(
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      shape: lerpEnum(a?.shape, b?.shape, t),
      radius: lerpDouble(a?.radius, b?.radius, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      overlayColor: Color.lerp(a?.overlayColor, b?.overlayColor, t),
      overlayOpacity: lerpDouble(a?.overlayOpacity, b?.overlayOpacity, t),
      overlayDisabled: lerpBool(a?.overlayDisabled, b?.overlayDisabled, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'margin': margin,
        'padding': padding,
        'shape': shape,
        'radius': radius,
        'borderRadius': borderRadius,
        'overlayColor': overlayColor,
        'overlayOpacity': overlayOpacity,
        'overlayDisabled': overlayDisabled,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is AnchorStyle && mapEquals(other.toMap(), toMap());
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

/// Create a [AnchorStyle] that can handle widget event.
class DrivenAnchorStyle extends AnchorStyle
    implements DrivenProperty<AnchorStyle> {
  /// Whether the resolved style is merged to
  /// the previous resolved style or not
  final bool? mergeResolved;

  /// The style to be resolved when
  /// events includes [AnchorEvent.focused].
  final AnchorStyle? focusedStyle;

  /// The style to be resolved when
  /// events includes [AnchorEvent.hovered].
  final AnchorStyle? hoveredStyle;

  /// The style to be resolved when
  /// events includes [AnchorEvent.pressed].
  final AnchorStyle? pressedStyle;

  /// The style to be resolved when
  /// events includes [AnchorEvent.disabled].
  final AnchorStyle? disabledStyle;

  /// Map of driven style, order matters
  Map<WidgetEvent, AnchorStyle?> get driven => {
        WidgetEvent.focused: focusedStyle,
        WidgetEvent.hovered: hoveredStyle,
        WidgetEvent.pressed: pressedStyle,
        WidgetEvent.disabled: disabledStyle,
      };

  /// Default constructor for a driven [AnchorStyle].
  const DrivenAnchorStyle({
    super.margin,
    super.padding,
    super.shape,
    super.radius,
    super.borderRadius,
    super.overlayColor,
    super.overlayOpacity,
    super.overlayDisabled,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  });

  /// Create a [DrivenAnchorStyle] with value
  /// from another [AnchorStyle].
  DrivenAnchorStyle.from(
    AnchorStyle? enabled, {
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  }) : super.from(enabled);

  /// Create a [DrivenAnchorStyle] from a resolver callback
  DrivenAnchorStyle.resolver(
    DrivenPropertyResolver<AnchorStyle?> resolver, {
    this.mergeResolved = false,
  })  : focusedStyle = resolver({WidgetEvent.focused}),
        hoveredStyle = resolver({WidgetEvent.hovered}),
        pressedStyle = resolver({WidgetEvent.pressed}),
        disabledStyle = resolver({WidgetEvent.disabled}),
        super.from(resolver({}));

  /// Create a rectangle shaped [DrivenAnchorStyle].
  const DrivenAnchorStyle.rectangle({
    super.margin,
    super.padding,
    super.borderRadius,
    super.overlayColor,
    super.overlayOpacity,
    super.overlayDisabled,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  }) : super(shape: BoxShape.rectangle, radius: null);

  /// Create a circle shaped [DrivenAnchorStyle].
  const DrivenAnchorStyle.circle({
    super.margin,
    super.padding,
    super.radius,
    super.overlayColor,
    super.overlayOpacity,
    super.overlayDisabled,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  }) : super(shape: BoxShape.circle, borderRadius: null);

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [AnchorStyle],
  /// otherwise returns the value itself.
  static AnchorStyle? evaluate(AnchorStyle? value, Set<WidgetEvent> events) {
    return DrivenProperty.evaluate<AnchorStyle?>(value, events);
  }

  @override
  AnchorStyle resolve(Set<WidgetEvent> events) {
    AnchorStyle style = this;
    for (var e in driven.entries) {
      if (events.contains(e.key)) {
        final evaluated = evaluate(e.value, events);
        style = style.merge(evaluated);
      }
    }
    return style;
  }

  /// Creates a copy of this [AnchorStyle] but with
  /// the given fields replaced with the new values.
  @override
  DrivenAnchorStyle copyWith({
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BoxShape? shape,
    double? radius,
    BorderRadius? borderRadius,
    Color? overlayColor,
    double? overlayOpacity,
    bool? overlayDisabled,
    bool? mergeResolved,
    AnchorStyle? focusedStyle,
    AnchorStyle? hoveredStyle,
    AnchorStyle? pressedStyle,
    AnchorStyle? disabledStyle,
  }) {
    return DrivenAnchorStyle(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      shape: shape ?? this.shape,
      radius: radius ?? this.radius,
      borderRadius: borderRadius ?? this.borderRadius,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayOpacity: overlayOpacity ?? this.overlayOpacity,
      overlayDisabled: overlayDisabled ?? this.overlayDisabled,
      mergeResolved: mergeResolved ?? this.mergeResolved,
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
    properties.add(DiagnosticsProperty('focusedStyle', focusedStyle));
    properties.add(DiagnosticsProperty('hoveredStyle', hoveredStyle));
    properties.add(DiagnosticsProperty('pressedStyle', pressedStyle));
    properties.add(DiagnosticsProperty('disabledStyle', disabledStyle));
  }
}
