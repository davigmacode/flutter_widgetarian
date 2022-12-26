import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/event.dart';
import 'event.dart';

/// The style to be applied to [Switch] widget
@immutable
class SwitchStyle with Diagnosticable {
  /// The size of the [Switch].
  final Size? size;

  /// Empty space to surround the outside clickable area.
  final EdgeInsetsGeometry? margin;

  /// Empty space to increase the clickable area.
  final EdgeInsetsGeometry? padding;

  final ShapeBorder? trackShape;
  final Color? trackColor;
  final double? trackOpacity;
  final int? trackAlpha;
  final double? trackHeight;

  final ShapeBorder? thumbShape;
  final Color? thumbColor;
  final double? thumbOpacity;
  final int? thumbAlpha;
  final double? thumbInset;
  final double? thumbScale;
  final Color? thumbShadow;
  final double? thumbElevation;

  /// The overlay color when pressed, hovered over, or focused.
  final Color? overlayColor;

  /// The overlay opacity when pressed, hovered over, or focused.
  final double? overlayOpacity;

  /// Whether the overlay is disabled or not,
  final bool? overlayDisabled;

  /// The radius of the overlay.
  final double? overlayRadius;

  static const defaults = DrivenSwitchStyle(
    size: Size(40, 14),
    padding: EdgeInsets.all(9),
    thumbInset: -3,
    trackOpacity: .5,
    thumbColor: Colors.white,
    thumbScale: 1.3,
    thumbElevation: 2,
    hoveredStyle: SwitchStyle(overlayRadius: 20.0),
    pressedStyle: SwitchStyle(overlayRadius: 10.0),
    disabledStyle: SwitchStyle(
      trackAlpha: SwitchStyle.disabledTrackAlpha,
      thumbAlpha: SwitchStyle.disabledThumbAlpha,
    ),
  );

  static const disabledTrackAlpha = 0x0c; // 38% * 12% = 5%
  static const disabledThumbAlpha = 0x0c; // 38% * 12% = 5%

  /// Create a raw style of switch widget
  const SwitchStyle({
    this.size,
    this.margin,
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
    this.thumbInset,
    this.thumbScale,
    this.thumbShadow,
    this.thumbElevation,
    this.overlayColor,
    this.overlayOpacity,
    this.overlayDisabled,
    this.overlayRadius,
  });

  /// Create a switch's style from another style
  SwitchStyle.from(SwitchStyle? other)
      : size = other?.size,
        margin = other?.margin,
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
        thumbInset = other?.thumbInset,
        thumbScale = other?.thumbScale,
        thumbShadow = other?.thumbShadow,
        thumbElevation = other?.thumbElevation,
        overlayColor = other?.overlayColor,
        overlayOpacity = other?.overlayOpacity,
        overlayDisabled = other?.overlayDisabled,
        overlayRadius = other?.overlayRadius;

  /// Creates a copy of this [SwitchStyle] but with
  /// the given fields replaced with the new values.
  SwitchStyle copyWith({
    Size? size,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    ShapeBorder? trackShape,
    Color? trackColor,
    double? trackOpacity,
    int? trackAlpha,
    double? trackHeight,
    ShapeBorder? thumbShape,
    Color? thumbColor,
    double? thumbOpacity,
    int? thumbAlpha,
    double? thumbInset,
    double? thumbScale,
    Color? thumbShadow,
    double? thumbElevation,
    Color? overlayColor,
    double? overlayOpacity,
    bool? overlayDisabled,
    double? overlayRadius,
    bool? mergeResolved,
    SwitchStyle? indeterminateStyle,
    SwitchStyle? selectedStyle,
    SwitchStyle? focusedStyle,
    SwitchStyle? hoveredStyle,
    SwitchStyle? pressedStyle,
    SwitchStyle? disabledStyle,
  }) {
    final style = SwitchStyle(
      size: size ?? this.size,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      trackShape: trackShape ?? this.trackShape,
      trackColor: trackColor ?? this.trackColor,
      trackOpacity: trackOpacity ?? this.trackOpacity,
      trackAlpha: trackAlpha ?? this.trackAlpha,
      trackHeight: trackHeight ?? this.trackHeight,
      thumbShape: thumbShape ?? this.thumbShape,
      thumbColor: thumbColor ?? this.thumbColor,
      thumbOpacity: thumbOpacity ?? this.thumbOpacity,
      thumbInset: thumbInset ?? this.thumbInset,
      thumbAlpha: thumbAlpha ?? this.thumbAlpha,
      thumbScale: thumbScale ?? this.thumbScale,
      thumbShadow: thumbShadow ?? this.thumbShadow,
      thumbElevation: thumbElevation ?? this.thumbElevation,
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
      return DrivenSwitchStyle.from(
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

  /// Creates a copy of this [SwitchStyle] but with
  /// the given fields replaced with the new values.
  SwitchStyle merge(SwitchStyle? other) {
    // if null return current object
    if (other == null) return this;

    var style = copyWith(
      size: other.size,
      margin: other.margin,
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
      thumbInset: other.thumbInset,
      thumbScale: other.thumbScale,
      thumbShadow: other.thumbShadow,
      thumbElevation: other.thumbElevation,
      overlayColor: other.overlayColor,
      overlayOpacity: other.overlayOpacity,
      overlayDisabled: other.overlayDisabled,
      overlayRadius: other.overlayRadius,
    );

    if (other is DrivenSwitchStyle) {
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

  /// Linearly interpolate between two [SwitchStyle] objects.
  static SwitchStyle? lerp(SwitchStyle? a, SwitchStyle? b, double t) {
    if (a == null && b == null) return null;
    return SwitchStyle(
      size: Size.lerp(a?.size, b?.size, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      trackShape: lerpEnum(a?.trackShape, b?.trackShape, t),
      trackColor: Color.lerp(a?.trackColor, b?.trackColor, t),
      trackOpacity: lerpDouble(a?.trackOpacity, b?.trackOpacity, t),
      trackAlpha: lerpInt(a?.trackAlpha, b?.trackAlpha, t),
      trackHeight: lerpDouble(a?.trackHeight, b?.trackHeight, t),
      thumbShape: lerpEnum(a?.thumbShape, b?.thumbShape, t),
      thumbColor: Color.lerp(a?.thumbColor, b?.thumbColor, t),
      thumbOpacity: lerpDouble(a?.thumbOpacity, b?.thumbOpacity, t),
      thumbAlpha: lerpInt(a?.thumbAlpha, b?.thumbAlpha, t),
      thumbInset: lerpDouble(a?.thumbInset, b?.thumbInset, t),
      thumbScale: lerpDouble(a?.thumbScale, b?.thumbScale, t),
      thumbShadow: Color.lerp(a?.thumbShadow, b?.thumbShadow, t),
      thumbElevation: lerpDouble(a?.thumbElevation, b?.thumbElevation, t),
      overlayColor: Color.lerp(a?.overlayColor, b?.overlayColor, t),
      overlayOpacity: lerpDouble(a?.overlayOpacity, b?.overlayOpacity, t),
      overlayDisabled: lerpBool(a?.overlayDisabled, b?.overlayDisabled, t),
      overlayRadius: lerpDouble(a?.overlayRadius, b?.overlayRadius, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'size': size,
        'margin': margin,
        'padding': padding,
        'trackShape': trackShape,
        'trackColor': trackColor,
        'trackOpacity': trackOpacity,
        'trackAlpha': trackAlpha,
        'trackHeight': trackHeight,
        'thumbShape': thumbShape,
        'thumbColor': thumbColor,
        'thumbOpacity': thumbOpacity,
        'thumbAlpha': thumbAlpha,
        'thumbInset': thumbInset,
        'thumbScale': thumbScale,
        'thumbShadow': thumbShadow,
        'thumbElevation': thumbElevation,
        'overlayColor': overlayColor,
        'overlayOpacity': overlayOpacity,
        'overlayDisabled': overlayDisabled,
        'overlayRadius': overlayRadius,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is SwitchStyle && mapEquals(other.toMap(), toMap());
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

/// Create a [SwitchStyle] that handle the widget events
class DrivenSwitchStyle extends SwitchStyle
    implements DrivenProperty<SwitchStyle?> {
  /// Whether the resolved style is merged to
  /// the previous resolved style or not
  final bool? mergeResolved;

  /// The style to be resolved when
  /// events includes [SwitchEvent.selected].
  final SwitchStyle? selectedStyle;

  /// The style to be resolved when
  /// events includes [SwitchEvent.indeterminate].
  final SwitchStyle? indeterminateStyle;

  /// The style to be resolved when
  /// events includes [SwitchEvent.focused].
  final SwitchStyle? focusedStyle;

  /// The style to be resolved when
  /// events includes [SwitchEvent.hovered].
  final SwitchStyle? hoveredStyle;

  /// The style to be resolved when
  /// events includes [SwitchEvent.pressed].
  final SwitchStyle? pressedStyle;

  /// The style to be resolved when
  /// events includes [SwitchEvent.disabled].
  final SwitchStyle? disabledStyle;

  /// Map of driven style, order matters
  Map<WidgetEvent, SwitchStyle?> get driven => {
        WidgetEvent.selected: selectedStyle,
        WidgetEvent.indeterminate: indeterminateStyle,
        WidgetEvent.focused: focusedStyle,
        WidgetEvent.hovered: hoveredStyle,
        WidgetEvent.pressed: pressedStyle,
        WidgetEvent.disabled: disabledStyle,
      };

  /// Create a raw of driven switch style
  const DrivenSwitchStyle({
    super.size,
    super.margin,
    super.padding,
    super.trackShape,
    super.trackColor,
    super.trackOpacity,
    super.trackAlpha,
    super.trackHeight,
    super.thumbShape,
    super.thumbColor,
    super.thumbOpacity,
    super.thumbAlpha,
    super.thumbInset,
    super.thumbScale,
    super.thumbShadow,
    super.thumbElevation,
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

  /// Create a [DrivenSwitchStyle] with value
  /// from another [SwitchStyle].
  DrivenSwitchStyle.from(
    SwitchStyle? enabledStyle, {
    this.selectedStyle,
    this.indeterminateStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  }) : super.from(enabledStyle);

  /// Create a [DrivenSwitchStyle] from a resolver callback
  DrivenSwitchStyle.resolver(
    DrivenPropertyResolver<SwitchStyle?> resolver, {
    this.mergeResolved = false,
  })  : selectedStyle = resolver({WidgetEvent.selected}),
        indeterminateStyle = resolver({WidgetEvent.indeterminate}),
        focusedStyle = resolver({WidgetEvent.focused}),
        hoveredStyle = resolver({WidgetEvent.hovered}),
        pressedStyle = resolver({WidgetEvent.pressed}),
        disabledStyle = resolver({WidgetEvent.disabled}),
        super.from(resolver({}));

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [SwitchStyle],
  /// otherwise returns the value itself.
  static SwitchStyle? evaluate(
    SwitchStyle? value,
    Set<WidgetEvent> events,
  ) {
    return DrivenProperty.evaluate<SwitchStyle?>(value, events);
  }

  @override
  SwitchStyle resolve(Set<WidgetEvent> events) {
    SwitchStyle style = this;
    for (var e in driven.entries) {
      if (events.contains(e.key)) {
        final evaluated = evaluate(e.value, events);
        style = mergeResolved != false
            ? style.merge(evaluated)
            : SwitchStyle.from(evaluated);
      }
    }
    return style;
  }

  /// Creates a copy of this [DrivenSwitchStyle] but with
  /// the given fields replaced with the new values.
  @override
  DrivenSwitchStyle copyWith({
    Size? size,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    ShapeBorder? trackShape,
    Color? trackColor,
    double? trackOpacity,
    int? trackAlpha,
    double? trackHeight,
    ShapeBorder? thumbShape,
    Color? thumbColor,
    double? thumbOpacity,
    int? thumbAlpha,
    double? thumbInset,
    double? thumbScale,
    Color? thumbShadow,
    double? thumbElevation,
    Color? overlayColor,
    double? overlayOpacity,
    bool? overlayDisabled,
    double? overlayRadius,
    bool? mergeResolved,
    SwitchStyle? indeterminateStyle,
    SwitchStyle? selectedStyle,
    SwitchStyle? focusedStyle,
    SwitchStyle? hoveredStyle,
    SwitchStyle? pressedStyle,
    SwitchStyle? disabledStyle,
  }) {
    return DrivenSwitchStyle(
      size: size ?? this.size,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      trackShape: trackShape ?? this.trackShape,
      trackColor: trackColor ?? this.trackColor,
      trackOpacity: trackOpacity ?? this.trackOpacity,
      trackAlpha: trackAlpha ?? this.trackAlpha,
      trackHeight: trackHeight ?? this.trackHeight,
      thumbShape: thumbShape ?? this.thumbShape,
      thumbColor: thumbColor ?? this.thumbColor,
      thumbOpacity: thumbOpacity ?? this.thumbOpacity,
      thumbInset: thumbInset ?? this.thumbInset,
      thumbAlpha: thumbAlpha ?? this.thumbAlpha,
      thumbScale: thumbScale ?? this.thumbScale,
      thumbShadow: thumbShadow ?? this.thumbShadow,
      thumbElevation: thumbElevation ?? this.thumbElevation,
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
