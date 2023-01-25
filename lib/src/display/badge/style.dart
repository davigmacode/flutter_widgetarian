import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:widgetarian/src/layout/sheet/style.dart';
import 'package:widgetarian/src/layout/sheet/types.dart';
import 'package:widgetarian/src/utils/lerp.dart';

typedef BadgeVariant = SheetVariant;
typedef BadgeSeverity = SheetSeverity;

/// The style to be applied to badge widget
@immutable
class BadgeStyle extends SheetStyle {
  /// Create a raw badge's style
  const BadgeStyle({
    super.severity,
    super.width,
    super.height,
    super.margin,
    super.padding,
    super.alignment,
    super.clipBehavior,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundColor,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
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
  }) : super(variant: BadgeVariant.filled);

  /// Create a badge's style from another style
  BadgeStyle.from(BadgeStyle? other)
      : super(
          variant: BadgeVariant.filled,
          severity: other?.severity,
          width: other?.width,
          height: other?.height,
          margin: other?.margin,
          padding: other?.padding,
          alignment: other?.alignment,
          clipBehavior: other?.clipBehavior,
          overlayColor: other?.overlayColor,
          shadowColor: other?.shadowColor,
          surfaceTint: other?.surfaceTint,
          elevation: other?.elevation,
          foregroundStyle: other?.foregroundStyle,
          foregroundColor: other?.foregroundColor,
          foregroundOpacity: other?.foregroundOpacity,
          foregroundAlpha: other?.foregroundAlpha,
          foregroundSpacing: other?.foregroundSpacing,
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

  /// Create a raw badge's style
  const BadgeStyle.circle({
    double? size = 20,
    super.severity,
    super.margin = EdgeInsets.zero,
    super.padding = EdgeInsets.zero,
    super.alignment = Alignment.center,
    super.clipBehavior,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundColor,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
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
  }) : super(
          variant: BadgeVariant.filled,
          shape: BoxShape.circle,
          width: size,
          height: size,
        );

  /// An [BadgeStyle] with some reasonable default values.
  static const defaults = BadgeStyle(
    shape: BoxShape.rectangle,
    margin: EdgeInsets.zero,
    padding: EdgeInsets.symmetric(
      horizontal: 5,
      vertical: 3,
    ),
    clipBehavior: Clip.antiAlias,
    foregroundStyle: TextStyle(
      fontSize: 10,
      height: 1,
    ),
    backgroundOpacity: 1.0,
    borderOpacity: 1.0,
    borderWidth: 0.0,
    borderStyle: BorderStyle.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  /// Creates a copy of this [BadgeStyle] but with
  /// the given fields replaced with the new values.
  @override
  BadgeStyle copyWith({
    BadgeVariant? variant,
    BadgeSeverity? severity,
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
    return BadgeStyle(
      severity: severity ?? this.severity,
      width: width ?? this.width,
      height: height ?? this.height,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      alignment: alignment ?? this.alignment,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      overlayColor: overlayColor ?? this.overlayColor,
      shadowColor: shadowColor ?? this.shadowColor,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      elevation: elevation ?? this.elevation,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      foregroundSpacing: foregroundSpacing ?? this.foregroundSpacing,
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
  }

  /// Creates a copy of this [BadgeStyle] but with
  /// the given fields replaced with the new values.
  @override
  BadgeStyle merge(covariant BadgeStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      severity: other.severity,
      width: other.width,
      height: other.height,
      margin: other.margin,
      padding: other.padding,
      alignment: other.alignment,
      clipBehavior: other.clipBehavior,
      overlayColor: other.overlayColor,
      shadowColor: other.shadowColor,
      elevation: other.elevation,
      foregroundStyle: other.foregroundStyle,
      foregroundColor: other.foregroundColor,
      foregroundOpacity: other.foregroundOpacity,
      foregroundAlpha: other.foregroundAlpha,
      foregroundSpacing: other.foregroundSpacing,
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
  }

  /// Linearly interpolate between two [BadgeStyle] objects.
  static BadgeStyle? lerp(BadgeStyle? a, BadgeStyle? b, double t) {
    if (a == null && b == null) return null;
    return BadgeStyle(
      severity: lerpEnum(a?.severity, b?.severity, t),
      shape: lerpEnum(a?.shape, b?.shape, t),
      width: lerpDouble(a?.width, b?.width, t),
      height: lerpDouble(a?.height, b?.height, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      alignment: lerpEnum(a?.alignment, b?.alignment, t),
      clipBehavior: lerpEnum(a?.clipBehavior, b?.clipBehavior, t),
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
