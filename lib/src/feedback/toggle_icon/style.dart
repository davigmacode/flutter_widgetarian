import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';

/// The style to be applied to [ToggleIcon] widget
@immutable
class ToggleIconStyle with Diagnosticable {
  /// The size of the icon in logical pixels.
  ///
  /// Icons occupy a square with width and height equal to size.
  final double? size;

  /// The color to use when drawing the icon.
  final Color? color;

  /// Opacity to be apply to [color].
  final double? opacity;

  /// Scale the size of the icon.
  final double? scale;

  /// The color to use when drawing the back icon.
  final Color? backColor;

  /// Opacity to be apply to [backColor].
  final double? backOpacity;

  /// Create a style to be applied to [ToggleIcon] widget
  const ToggleIconStyle({
    this.size,
    this.backColor,
    this.backOpacity,
    this.color,
    this.opacity,
    this.scale,
  });

  /// Create an [ToggleIconStyle] from another style
  ToggleIconStyle.from(ToggleIconStyle? other)
      : size = other?.size,
        backColor = other?.backColor,
        backOpacity = other?.backOpacity,
        color = other?.color,
        opacity = other?.opacity,
        scale = other?.scale;

  /// Creates a copy of this [ToggleIconStyle] but with
  /// the given fields replaced with the new values.
  ToggleIconStyle copyWith({
    double? size,
    Color? color,
    double? opacity,
    double? scale,
    Color? backColor,
    double? backOpacity,
    bool? mergeResolved,
    ToggleIconStyle? selectedStyle,
    ToggleIconStyle? disabledStyle,
  }) {
    final style = ToggleIconStyle(
      size: size ?? this.size,
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
      scale: scale ?? this.scale,
      backColor: backColor ?? this.backColor,
      backOpacity: backOpacity ?? this.backOpacity,
    );

    final hasEventStyle = [
      mergeResolved,
      selectedStyle,
      disabledStyle,
    ].any((el) => el != null);

    if (hasEventStyle) {
      return DrivenToggleIconStyle.from(
        style,
        selectedStyle: selectedStyle,
        disabledStyle: disabledStyle,
        mergeResolved: mergeResolved,
      );
    }
    return style;
  }

  /// Creates a copy of this [ToggleIconStyle] but with
  /// the given fields replaced with the new values.
  ToggleIconStyle merge(ToggleIconStyle? other) {
    // if null return current object
    if (other == null) return this;

    var style = copyWith(
      size: other.size,
      color: other.color,
      opacity: other.opacity,
      scale: other.scale,
      backColor: other.backColor,
      backOpacity: other.backOpacity,
    );

    if (other is DrivenToggleIconStyle) {
      style = style.copyWith(
        selectedStyle: other.selectedStyle,
        disabledStyle: other.disabledStyle,
        mergeResolved: other.mergeResolved,
      );
    }

    return style;
  }

  /// Linearly interpolate between two [ToggleIconStyle] objects.
  static ToggleIconStyle? lerp(
      ToggleIconStyle? a, ToggleIconStyle? b, double t) {
    if (a == null && b == null) return null;
    return ToggleIconStyle(
      size: lerpDouble(a?.size, b?.size, t),
      color: Color.lerp(a?.color, b?.color, t),
      opacity: lerpDouble(a?.opacity, b?.opacity, t),
      scale: lerpDouble(a?.scale, b?.scale, t),
      backColor: Color.lerp(a?.backColor, b?.backColor, t),
      backOpacity: lerpDouble(a?.backOpacity, b?.backOpacity, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'size': size,
        'color': color,
        'opacity': opacity,
        'scale': scale,
        'outerColor': backColor,
        'outerOpacity': backOpacity,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ToggleIconStyle && mapEquals(other.toMap(), toMap());
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

/// A [ToggleIconStyle] that change when some events occurs.
class DrivenToggleIconStyle extends ToggleIconStyle
    implements DrivenProperty<ToggleIconStyle?> {
  /// Whether the resolved style is merged to
  /// the previous resolved style or not
  final bool? mergeResolved;

  /// The [selectedStyle] is style to be resolved when
  /// events includes [WidgetEvent.selected].
  final ToggleIconStyle? selectedStyle;

  /// The [disabledStyle] style to be resolved when
  /// events includes [WidgetEvent.disabled].
  final ToggleIconStyle? disabledStyle;

  /// Map of driven style, order matters
  Map<WidgetEvent, ToggleIconStyle?> get driven => {
        WidgetEvent.selected: selectedStyle,
        WidgetEvent.disabled: disabledStyle,
      };

  /// Create a [ToggleIconStyle] that change when some events occurs.
  const DrivenToggleIconStyle({
    super.size,
    super.color,
    super.opacity,
    super.scale,
    super.backColor,
    super.backOpacity,
    this.selectedStyle,
    this.disabledStyle,
    this.mergeResolved,
  });

  /// Create a [DrivenToggleIconStyle] with value
  /// from another [ToggleIconStyle].
  DrivenToggleIconStyle.from(
    ToggleIconStyle? enabled, {
    this.selectedStyle,
    this.disabledStyle,
    this.mergeResolved,
  }) : super.from(enabled);

  DrivenToggleIconStyle.fade({
    super.size,
    super.color,
    super.backColor,
    ToggleIconStyle? selectedStyle,
    this.disabledStyle,
  })  : mergeResolved = true,
        selectedStyle = const ToggleIconStyle(
          opacity: 1,
          scale: 1,
          backOpacity: .8,
        ).merge(selectedStyle),
        super(
          opacity: 0,
          scale: 1,
          backOpacity: .8,
        );

  DrivenToggleIconStyle.scaleUp({
    super.size,
    super.color,
    super.backColor,
    ToggleIconStyle? selectedStyle,
    this.disabledStyle,
  })  : mergeResolved = true,
        selectedStyle = const ToggleIconStyle(
          opacity: 1,
          scale: 1,
          backOpacity: .8,
        ).merge(selectedStyle),
        super(
          opacity: 0,
          scale: 0,
          backOpacity: .8,
        );

  DrivenToggleIconStyle.scaleDown({
    super.size,
    super.color,
    super.backColor,
    ToggleIconStyle? selectedStyle,
    this.disabledStyle,
  })  : mergeResolved = true,
        selectedStyle = const ToggleIconStyle(
          opacity: 1,
          scale: 1,
          backOpacity: .8,
        ).merge(selectedStyle),
        super(
          opacity: 0,
          scale: 3,
          backOpacity: .8,
        );

  /// Create a [DrivenToggleIconStyle] from a resolver callback
  DrivenToggleIconStyle.resolver(
    DrivenPropertyResolver<ToggleIconStyle?> resolver, {
    this.mergeResolved = false,
  })  : selectedStyle = resolver({WidgetEvent.selected}),
        disabledStyle = resolver({WidgetEvent.disabled}),
        super.from(resolver({}));

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [ToggleIconStyle],
  /// otherwise returns the value itself.
  static ToggleIconStyle? evaluate(
    ToggleIconStyle? value,
    Set<WidgetEvent> events,
  ) =>
      DrivenProperty.evaluate<ToggleIconStyle?>(value, events);

  @override
  ToggleIconStyle resolve(Set<WidgetEvent> events) {
    ToggleIconStyle style = this;
    for (var e in driven.entries) {
      if (events.contains(e.key)) {
        final evaluated = evaluate(e.value, events);
        style = mergeResolved != false
            ? style.merge(evaluated)
            : ToggleIconStyle.from(evaluated);
      }
    }
    return style;
  }

  /// Creates a copy of this [ToggleIconStyle] but with
  /// the given fields replaced with the new values.
  @override
  DrivenToggleIconStyle copyWith({
    double? size,
    Color? color,
    double? opacity,
    double? scale,
    Color? backColor,
    double? backOpacity,
    bool? mergeResolved,
    ToggleIconStyle? selectedStyle,
    ToggleIconStyle? disabledStyle,
  }) {
    return DrivenToggleIconStyle(
      size: size ?? this.size,
      color: color ?? this.color,
      opacity: opacity ?? this.opacity,
      scale: scale ?? this.scale,
      backColor: backColor ?? this.backColor,
      backOpacity: backOpacity ?? this.backOpacity,
      mergeResolved: mergeResolved ?? this.mergeResolved,
      selectedStyle: this.selectedStyle?.merge(selectedStyle) ?? selectedStyle,
      disabledStyle: this.disabledStyle?.merge(disabledStyle) ?? disabledStyle,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('mergeResolved', mergeResolved));
    properties.add(DiagnosticsProperty('selectedStyle', selectedStyle));
    properties.add(DiagnosticsProperty('disabledStyle', disabledStyle));
  }
}
