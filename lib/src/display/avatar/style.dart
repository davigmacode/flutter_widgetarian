import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart' as utils;

/// Default avatar's style.
class AvatarStyle {
  const AvatarStyle({
    this.shape,
    this.size,
    this.margin,
    this.clipBehavior,
    this.shadowColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.foregroundSpacing,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
  });

  /// Create a avatar's style from another style
  AvatarStyle.from(AvatarStyle? other)
      : size = other?.size,
        shape = other?.shape,
        margin = other?.margin,
        clipBehavior = other?.clipBehavior,
        shadowColor = other?.shadowColor,
        elevation = other?.elevation,
        foregroundStyle = other?.foregroundStyle,
        foregroundColor = other?.foregroundColor,
        foregroundOpacity = other?.foregroundOpacity,
        foregroundAlpha = other?.foregroundAlpha,
        foregroundSpacing = other?.foregroundSpacing,
        backgroundColor = other?.backgroundColor,
        backgroundOpacity = other?.backgroundOpacity,
        backgroundAlpha = other?.backgroundAlpha,
        borderColor = other?.borderColor,
        borderOpacity = other?.borderOpacity,
        borderAlpha = other?.borderAlpha,
        borderWidth = other?.borderWidth,
        borderRadius = other?.borderRadius,
        borderStyle = other?.borderStyle;

  static const defaultSize = 40.0;
  static const defaultShape = BoxShape.circle;
  static const defaultClipBehavior = Clip.antiAlias;
  static const defaultBorderWidth = 1.0;
  static const defaultBorderStyle = BorderStyle.none;
  static const defaultBorderRadius = BorderRadius.all(Radius.circular(8));
  static const disabledForegroundAlpha = 0x61; // 38%
  static const disabledBackgroundAlpha = 0x0c; // 38% * 12% = 5%
  static const disabledBorderAlpha = 0x0c; // 38% * 12% = 5%

  final BoxShape? shape;

  /// Defaults to [AvatarStyle.defaultHeight]
  final double? size;

  /// Empty space to surround the outside avatar.
  final EdgeInsetsGeometry? margin;

  /// The avatar's content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  ///
  /// Defaults to [AvatarStyle.defaultClipBehavior]
  final Clip? clipBehavior;

  /// When [elevation] is non zero the color to use for the avatar's shadow color.
  final Color? shadowColor;

  /// The avatar's z-coordinate relative to the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  final double? elevation;

  /// The style to be applied to the avatar's label.
  ///
  /// The default label style is [TextTheme.bodyText1] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  final TextStyle? foregroundStyle;

  /// The color to be applied to the avatar's label, icon, and checkmark
  final Color? foregroundColor;

  /// Opacity to be apply to [foregroundColor].
  final double? foregroundOpacity;

  /// Alpha to be apply to [foregroundColor].
  final int? foregroundAlpha;

  /// How much space to place between avatar's foreground widget in a run in the main axis.
  final double? foregroundSpacing;

  /// Color to be used for the avatar's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

  /// Color to be used for the avatar's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the avatar's border, in logical pixels.
  final double? borderWidth;

  /// The radii for each corner of the avatar's border.
  final BorderRadius? borderRadius;

  /// The style of this side of the avatar's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  Color? get effectiveBackgroundColor {
    return backgroundColor != null
        ? utils.Colors.colorWithOpacityOrAlpha(
            backgroundColor!,
            backgroundOpacity,
            backgroundAlpha,
          )
        : null;
  }

  Color? get effectiveBorderColor {
    return borderColor != null
        ? utils.Colors.colorWithOpacityOrAlpha(
            borderColor!,
            borderOpacity,
            borderAlpha,
          )
        : null;
  }

  Color? get effectiveForegroundColor {
    return foregroundColor != null
        ? utils.Colors.colorWithOpacityOrAlpha(
            foregroundColor!,
            foregroundOpacity,
            foregroundAlpha,
          )
        : null;
  }

  TextStyle get effectiveForegroundStyle {
    return const TextStyle()
        .copyWith(color: foregroundColor)
        .merge(foregroundStyle);
  }

  /// Linearly interpolate between two icon theme data objects.
  static AvatarStyle lerp(AvatarStyle? a, AvatarStyle? b, double t) {
    return AvatarStyle(
      size: utils.lerpDouble(a?.size, b?.size, t),
      shape: t < 0.5 ? a?.shape : b?.shape,
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      clipBehavior: t < 0.5 ? a?.clipBehavior : b?.clipBehavior,
      shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
      elevation: utils.lerpDouble(a?.elevation, b?.elevation, t),
      foregroundStyle:
          TextStyle.lerp(a?.foregroundStyle, b?.foregroundStyle, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      foregroundOpacity:
          utils.lerpDouble(a?.foregroundOpacity, b?.foregroundOpacity, t),
      foregroundAlpha: utils.lerpInt(a?.foregroundAlpha, b?.foregroundAlpha, t),
      foregroundSpacing:
          utils.lerpDouble(a?.foregroundSpacing, b?.foregroundSpacing, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      backgroundOpacity:
          utils.lerpDouble(a?.backgroundOpacity, b?.backgroundOpacity, t),
      backgroundAlpha: utils.lerpInt(a?.backgroundAlpha, b?.backgroundAlpha, t),
      borderColor: Color.lerp(a?.borderColor, b?.borderColor, t),
      borderOpacity: utils.lerpDouble(a?.borderOpacity, b?.borderOpacity, t),
      borderAlpha: utils.lerpInt(a?.borderAlpha, b?.borderAlpha, t),
      borderWidth: utils.lerpDouble(a?.borderWidth, b?.borderWidth, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      borderStyle: t < 0.5 ? a?.borderStyle : b?.borderStyle,
    );
  }

  /// Creates a copy of this [AvatarStyle] but with
  /// the given fields replaced with the new values.
  AvatarStyle copyWith({
    double? size,
    BoxShape? shape,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    Color? shadowColor,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadius? borderRadius,
    BorderStyle? borderStyle,
  }) {
    return AvatarStyle(
      size: size ?? this.size,
      shape: shape ?? this.shape,
      margin: margin ?? this.margin,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      foregroundSpacing: foregroundSpacing ?? this.foregroundSpacing,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
    );
  }

  /// Creates a copy of this [AvatarStyle] but with
  /// the given fields replaced with the new values.
  AvatarStyle merge(AvatarStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      size: other.size,
      shape: other.shape,
      margin: other.margin,
      clipBehavior: other.clipBehavior,
      shadowColor: other.shadowColor,
      elevation: other.elevation,
      foregroundStyle: other.foregroundStyle,
      foregroundColor: other.foregroundColor,
      foregroundOpacity: other.foregroundOpacity,
      foregroundAlpha: other.foregroundAlpha,
      foregroundSpacing: other.foregroundSpacing,
      backgroundColor: other.backgroundColor,
      backgroundOpacity: other.backgroundOpacity,
      backgroundAlpha: other.backgroundAlpha,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderRadius: other.borderRadius,
      borderStyle: other.borderStyle,
    );
  }
}
