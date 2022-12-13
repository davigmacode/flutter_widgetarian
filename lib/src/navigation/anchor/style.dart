import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';

@immutable
class AnchorStyle with Diagnosticable {
  /// Empty space to surround the outside anchor.
  final EdgeInsetsGeometry? margin;

  /// The padding between the contents of the anchor and the outside anchor.
  ///
  /// defaults to [AnchorStyle.defaultPadding].
  final EdgeInsetsGeometry? padding;

  /// The shape (e.g., circle, rectangle) to use for the overlay drawn around
  /// this part of the anchor when pressed, hovered over, or focused.
  final BoxShape? shape;

  /// The radius of the overlay. If the [shape] is [BoxShape.circle].
  final double? radius;

  /// The clipping radius of the containing rect. This is effective only if
  /// the [shape] is [BoxShape.circle].
  ///
  /// If this is null, it is interpreted as [BorderRadius.zero].
  final BorderRadius? borderRadius;

  /// The overlay color of the anchor when pressed, hovered over, or focused.
  final Color? overlayColor;

  /// The overlay opacity of the anchor when pressed, hovered over, or focused.
  final double? overlayOpacity;

  /// Default [AnchorStyle] constructor.
  const AnchorStyle({
    this.margin,
    this.padding,
    this.shape,
    this.radius,
    this.borderRadius,
    this.overlayColor,
    this.overlayOpacity,
  });

  /// Create a anchor's style from another style
  AnchorStyle.from(AnchorStyle? other)
      : margin = other?.margin,
        padding = other?.padding,
        shape = other?.shape,
        radius = other?.radius,
        borderRadius = other?.borderRadius,
        overlayColor = other?.overlayColor,
        overlayOpacity = other?.overlayOpacity;

  /// An [AnchorStyle] with some reasonable default values.
  static final defaults = AnchorStyle.when(
    enabled: const AnchorStyle(overlayOpacity: 0),
    hovered: const AnchorStyle(overlayOpacity: 0.05),
    pressed: const AnchorStyle(overlayOpacity: 0.1),
  );

  /// Create an event driven [AnchorStyle] using [callback].
  factory AnchorStyle.driven(
    DrivenPropertyResolver<AnchorStyle?> callback,
  ) {
    return _DrivenAnchorStyle.by(callback);
  }

  /// Create a [AnchorStyle] when some events occurs.
  ///
  /// The [enabled] is base style to be applied to the anchor.
  /// if `null` will fallback with empty [AnchorStyle]
  ///
  /// The [selected] style to be merged with [enabled],
  /// when events includes [WidgetEvent.selected].
  ///
  /// The [indeterminate] style to be merged with [enabled],
  /// when events includes [WidgetEvent.indeterminate].
  ///
  /// The [error] style to be merged with [enabled],
  /// when events includes [WidgetEvent.error].
  ///
  /// The [loading] style to be merged with [enabled],
  /// when events includes [WidgetEvent.loading].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [WidgetEvent.focused].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [WidgetEvent.hovered].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [WidgetEvent.pressed].
  ///
  /// The [dragged] style to be merged with [enabled],
  /// when events includes [WidgetEvent.dragged].
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [WidgetEvent.disabled].
  factory AnchorStyle.when({
    AnchorStyle? enabled,
    AnchorStyle? selected,
    AnchorStyle? indeterminate,
    AnchorStyle? error,
    AnchorStyle? loading,
    AnchorStyle? focused,
    AnchorStyle? hovered,
    AnchorStyle? pressed,
    AnchorStyle? dragged,
    AnchorStyle? disabled,
  }) {
    return _DrivenAnchorStyle.when(
      enabled: enabled,
      selected: selected,
      indeterminate: indeterminate,
      error: error,
      loading: loading,
      focused: focused,
      hovered: hovered,
      pressed: pressed,
      dragged: dragged,
      disabled: disabled,
    );
  }

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [AnchorStyle],
  /// otherwise returns the value itself.
  static AnchorStyle? evaluate(
    AnchorStyle? value,
    Set<WidgetEvent> events, {
    bool merged = true,
  }) {
    return DrivenProperty.evaluate<AnchorStyle?>(value, events);
    // return merged ? value?.merge(evaluated) : evaluated;
  }

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
    AnchorStyle? selectedStyle,
    AnchorStyle? indeterminateStyle,
    AnchorStyle? errorStyle,
    AnchorStyle? loadingStyle,
    AnchorStyle? focusedStyle,
    AnchorStyle? hoveredStyle,
    AnchorStyle? pressedStyle,
    AnchorStyle? draggedStyle,
    AnchorStyle? disabledStyle,
    DrivenPropertyResolver<AnchorStyle?>? resolverStyle,
  }) {
    final style = AnchorStyle(
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      shape: shape ?? this.shape,
      radius: radius ?? this.radius,
      borderRadius: borderRadius ?? this.borderRadius,
      overlayColor: overlayColor ?? this.overlayColor,
      overlayOpacity: overlayOpacity ?? this.overlayOpacity,
    );

    final hasEventStyle = [
      selectedStyle,
      indeterminateStyle,
      errorStyle,
      loadingStyle,
      focusedStyle,
      hoveredStyle,
      pressedStyle,
      draggedStyle,
      disabledStyle,
      resolverStyle,
    ].any((el) => el != null);

    if (hasEventStyle || this is _DrivenAnchorStyle) {
      if (this is _DrivenAnchorStyle) {
        final that = this as _DrivenAnchorStyle;
        return _DrivenAnchorStyle(
          enabled: that.enabled?.merge(style) ?? style,
          selected: that.selected?.merge(selectedStyle) ?? selectedStyle,
          indeterminate: that.indeterminate?.merge(indeterminateStyle) ??
              indeterminateStyle,
          error: that.error?.merge(errorStyle) ?? errorStyle,
          loading: that.loading?.merge(loadingStyle) ?? loadingStyle,
          focused: that.focused?.merge(focusedStyle) ?? focusedStyle,
          hovered: that.hovered?.merge(hoveredStyle) ?? hoveredStyle,
          pressed: that.pressed?.merge(pressedStyle) ?? pressedStyle,
          dragged: that.dragged?.merge(draggedStyle) ?? draggedStyle,
          disabled: that.disabled?.merge(disabledStyle) ?? disabledStyle,
          resolver: resolverStyle ?? that.resolver,
        );
      } else {
        return _DrivenAnchorStyle(
          enabled: style,
          selected: selectedStyle,
          indeterminate: indeterminateStyle,
          error: errorStyle,
          loading: loadingStyle,
          focused: focusedStyle,
          hovered: hoveredStyle,
          pressed: pressedStyle,
          dragged: draggedStyle,
          disabled: disabledStyle,
          resolver: resolverStyle,
        );
      }
    }
    return style;
  }

  /// Creates a copy of this [AnchorStyle] but with
  /// the given fields replaced with the new values.
  AnchorStyle merge(AnchorStyle? other) {
    // if null return current object
    if (other == null) return this;

    final style = copyWith(
      margin: other.margin,
      padding: other.padding,
      shape: other.shape,
      radius: other.radius,
      borderRadius: other.borderRadius,
      overlayColor: other.overlayColor,
      overlayOpacity: other.overlayOpacity,
    );

    if (other is _DrivenAnchorStyle) {
      style.copyWith(
        selectedStyle: other.selected,
        indeterminateStyle: other.indeterminate,
        errorStyle: other.error,
        loadingStyle: other.loading,
        focusedStyle: other.focused,
        hoveredStyle: other.hovered,
        pressedStyle: other.pressed,
        draggedStyle: other.dragged,
        disabledStyle: other.disabled,
        resolverStyle: other.resolver,
      );
    }

    return style;
  }

  /// Linearly interpolate between two [AnchorStyle] objects.
  static AnchorStyle lerp(AnchorStyle? a, AnchorStyle? b, double t) {
    return AnchorStyle(
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      shape: lerpEnum(a?.shape, b?.shape, t),
      radius: lerpDouble(a?.radius, b?.radius, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      overlayColor: Color.lerp(a?.overlayColor, b?.overlayColor, t),
      overlayOpacity: lerpDouble(a?.overlayOpacity, b?.overlayOpacity, t),
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
      properties.add(DiagnosticsProperty(el.key, el.value, defaultValue: null));
    });
  }
}

class _DrivenAnchorStyle extends AnchorStyle
    implements DrivenProperty<AnchorStyle?> {
  _DrivenAnchorStyle({
    this.resolver,
    this.enabled,
    this.selected,
    this.indeterminate,
    this.error,
    this.loading,
    this.focused,
    this.hovered,
    this.pressed,
    this.dragged,
    this.disabled,
  }) : super.from(resolver?.call({})?.merge(enabled) ?? enabled);

  _DrivenAnchorStyle.by(this.resolver)
      : enabled = null,
        selected = null,
        indeterminate = null,
        error = null,
        loading = null,
        focused = null,
        hovered = null,
        pressed = null,
        dragged = null,
        disabled = null,
        super.from(resolver?.call({}));

  _DrivenAnchorStyle.when({
    this.enabled,
    this.selected,
    this.indeterminate,
    this.error,
    this.loading,
    this.focused,
    this.hovered,
    this.pressed,
    this.dragged,
    this.disabled,
  })  : resolver = null,
        super.from(enabled);

  final DrivenPropertyResolver<AnchorStyle?>? resolver;
  final AnchorStyle? enabled;
  final AnchorStyle? selected;
  final AnchorStyle? indeterminate;
  final AnchorStyle? error;
  final AnchorStyle? loading;
  final AnchorStyle? focused;
  final AnchorStyle? hovered;
  final AnchorStyle? pressed;
  final AnchorStyle? dragged;
  final AnchorStyle? disabled;

  /// Map of driven style, order matters
  Map<WidgetEvent, AnchorStyle?> get drivenStyle => {
        WidgetEvent.selected: selected,
        WidgetEvent.indeterminate: indeterminate,
        WidgetEvent.error: error,
        WidgetEvent.loading: loading,
        WidgetEvent.focused: focused,
        WidgetEvent.hovered: hovered,
        WidgetEvent.pressed: pressed,
        WidgetEvent.dragged: dragged,
        WidgetEvent.disabled: disabled,
      };

  @override
  AnchorStyle? resolve(Set<WidgetEvent> events) {
    AnchorStyle style = enabled ?? const AnchorStyle();

    if (resolver != null) {
      style = style.merge(resolver?.call(events));
    }

    for (var e in drivenStyle.entries) {
      if (events.contains(e.key)) {
        final evaluated = AnchorStyle.evaluate(e.value, events);
        style = style.merge(evaluated);
      }
    }

    return style;
  }
}
