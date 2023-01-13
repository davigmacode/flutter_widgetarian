import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:widgetarian/src/layout/sheet/style.dart';
import 'package:widgetarian/src/layout/sheet/types.dart';

typedef AlertVariant = SheetVariant;
typedef AlertSeverity = SheetSeverity;

/// The style to be applied to alert widget
@immutable
class AlertStyle extends SheetStyle {
  /// Create a raw alert's style
  const AlertStyle({
    super.variant,
    super.severity,
    super.margin,
    super.padding,
    super.clipBehavior,
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
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
  }) : super(width: double.infinity);

  /// Create a alert's style from another style
  AlertStyle.from(AlertStyle? other)
      : super(
          variant: other?.variant,
          severity: other?.severity,
          width: double.infinity,
          margin: other?.margin,
          padding: other?.padding,
          clipBehavior: other?.clipBehavior,
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
          iconColor: other?.iconColor,
          iconOpacity: other?.iconOpacity,
          iconSize: other?.iconSize,
        );

  /// Create [AlertStyle] with default value for toned style.
  const AlertStyle.tonal({
    Color? color,
    super.severity,
    super.margin,
    super.padding,
    super.clipBehavior,
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
    super.backgroundOpacity = 0.12,
    super.backgroundAlpha,
    super.borderColor,
    super.borderOpacity = 1.0,
    super.borderAlpha,
    super.borderWidth = 1.0,
    super.borderRadius,
    super.borderStyle = BorderStyle.none,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
  }) : super(
          width: double.infinity,
          variant: SheetVariant.tonal,
          backgroundColor: color,
          foregroundColor: color,
        );

  /// Create [AlertStyle] with default value for filled style.
  const AlertStyle.filled({
    Color? color,
    super.severity,
    super.margin,
    super.padding,
    super.clipBehavior,
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
    super.backgroundOpacity = 0.8,
    super.backgroundAlpha,
    super.borderOpacity = 0.0,
    super.borderAlpha,
    super.borderWidth = 0.0,
    super.borderRadius,
    super.borderStyle = BorderStyle.none,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
  }) : super(
          width: double.infinity,
          variant: SheetVariant.filled,
          backgroundColor: color,
          borderColor: color,
        );

  /// Create [AlertStyle] with default value for outlined style.
  const AlertStyle.outlined({
    Color? color,
    super.severity,
    super.margin,
    super.padding,
    super.clipBehavior,
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
    super.backgroundOpacity = 0.0,
    super.backgroundAlpha,
    super.borderOpacity = 1.0,
    super.borderAlpha,
    super.borderWidth = 1.0,
    super.borderRadius,
    super.borderStyle = BorderStyle.solid,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
  }) : super(
          width: double.infinity,
          variant: SheetVariant.outlined,
          borderColor: color,
          foregroundColor: color,
        );

  static const defaults = AlertStyle(
    clipBehavior: Clip.antiAlias,
    borderRadius: BorderRadius.all(Radius.circular(8)),
    margin: EdgeInsets.zero,
    padding: EdgeInsets.symmetric(horizontal: 16),
    iconSize: 20.0,
    foregroundSpacing: 15.0,
    foregroundLoosen: false,
    foregroundExpanded: true,
    foregroundAlign: CrossAxisAlignment.start,
  );

  /// Creates a copy of this [AlertStyle] but with
  /// the given fields replaced with the new values.
  @override
  AlertStyle copyWith({
    AlertVariant? variant,
    AlertSeverity? severity,
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
  }) {
    return AlertStyle(
      variant: variant ?? this.variant,
      severity: severity ?? this.severity,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
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
      iconColor: iconColor ?? this.iconColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconSize: iconSize ?? this.iconSize,
    );
  }

  /// Creates a copy of this [AlertStyle] but with
  /// the given fields replaced with the new values.
  @override
  AlertStyle merge(covariant AlertStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      variant: other.variant,
      severity: other.severity,
      margin: other.margin,
      padding: other.padding,
      clipBehavior: other.clipBehavior,
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
      iconColor: other.iconColor,
      iconOpacity: other.iconOpacity,
      iconSize: other.iconSize,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is AlertStyle && mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => Object.hashAll(toMap().values);
}
