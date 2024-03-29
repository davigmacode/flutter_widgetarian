import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:widgetarian/utils.dart';
import 'types.dart';

/// The style to be applied to the sheet widget
@immutable
class SheetStyle with Diagnosticable {
  /// {@template widgetarian.sheet.style.variant}
  /// Type of the sheet variant
  /// {@endtemplate}
  final SheetVariant? variant;

  /// {@template widgetarian.sheet.style.severity}
  /// Type of the sheet severity
  /// {@endtemplate}
  final SheetSeverity? severity;

  /// {@template widgetarian.sheet.style.width}
  /// The horizontal extent of the sheet widget.
  /// {@endtemplate}
  final double? width;

  /// {@template widgetarian.sheet.style.height}
  /// The vertical extent of the sheet widget.
  /// {@endtemplate}
  final double? height;

  /// {@template widgetarian.sheet.style.margin}
  /// Empty space to surround the outside sheet.
  /// {@endtemplate}
  final EdgeInsetsGeometry? margin;

  /// {@template widgetarian.sheet.style.padding}
  /// The padding between the contents of the sheet and the outside sheet.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template widgetarian.sheet.style.alignment}
  /// Align the [child] within the sheet.
  ///
  /// If non-null, the sheet will expand to fill its parent and position its
  /// child within itself according to the given value. If the incoming
  /// constraints are unbounded, then the child will be shrink-wrapped instead.
  ///
  /// Ignored if [child] is null.
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  /// {@endtemplate}
  final Alignment? alignment;

  /// {@template widgetarian.sheet.style.clipBehavior}
  /// The sheet's content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  /// {@endtemplate}
  final Clip? clipBehavior;

  /// {@template widgetarian.sheet.style.overlayDisabled}
  /// Whether the overlay is disabled or not
  /// {@endtemplate}
  final bool? overlayDisabled;

  /// {@template widgetarian.sheet.style.overlayColor}
  /// Defines the overlay colors.
  /// {@endtemplate}
  final Color? overlayColor;

  /// {@template widgetarian.sheet.style.shadowColor}
  /// When [elevation] is non zero the color
  /// to use for the sheet's shadow color.
  /// {@endtemplate}
  final Color? shadowColor;

  /// {@template widgetarian.sheet.style.surfaceTint}
  /// The color used as an overlay on [color] to indicate elevation.
  ///
  /// If this is null, no overlay will be applied. Otherwise the this
  /// color will be composited on top of [color] with an opacity related
  /// to [elevation] and used to paint the background of the card.
  ///
  /// The default is null.
  /// {@endtemplate}
  final Color? surfaceTint;

  /// {@template widgetarian.sheet.style.elevation}
  /// The sheet's z-coordinate relative to
  /// the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  /// {@endtemplate}
  final double? elevation;

  /// {@template widgetarian.sheet.style.foregroundStyle}
  /// The style to be applied to the sheet's label.
  ///
  /// The default label style is [TextTheme.bodyText1] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  /// {@endtemplate}
  final TextStyle? foregroundStyle;

  /// {@template widgetarian.sheet.style.foregroundColor}
  /// The color to be applied to the sheet's label, and icon
  /// {@endtemplate}
  final Color? foregroundColor;

  /// {@template widgetarian.sheet.style.foregroundOpacity}
  /// Opacity to be apply to [foregroundColor].
  /// {@endtemplate}
  final double? foregroundOpacity;

  /// {@template widgetarian.sheet.style.foregroundAlpha}
  /// Alpha to be apply to [foregroundColor].
  /// {@endtemplate}
  final int? foregroundAlpha;

  /// {@template widgetarian.sheet.style.foregroundSpacing}
  /// How much space to place between sheet's foreground widget in a run in the main axis.
  /// {@endtemplate}
  final double? foregroundSpacing;

  /// {@template widgetarian.sheet.style.foregroundSpacingEnforced}
  /// Whether the spacing is forced to child with no leading or trailing.
  /// {@endtemplate}
  final bool? foregroundLoosen;

  /// {@template widgetarian.sheet.style.foregroundExpanded}
  /// Whether the foreground widget is expanded or not
  /// {@endtemplate}
  final bool? foregroundExpanded;

  /// {@template widgetarian.sheet.style.foregroundAlign}
  /// Cross axis alignment of the foreground widget
  /// {@endtemplate}
  final CrossAxisAlignment? foregroundAlign;

  /// {@template widgetarian.sheet.style.foregroundJustify}
  /// Main axis alignment of the foreground widget
  /// {@endtemplate}
  final MainAxisAlignment? foregroundJustify;

  /// {@template widgetarian.sheet.style.backgroundColor}
  /// Color to be used for the sheet's background.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template widgetarian.sheet.style.backgroundOpacity}
  /// Opacity to be apply to [backgroundColor].
  /// {@endtemplate}
  final double? backgroundOpacity;

  /// {@template widgetarian.sheet.style.backgroundAlpha}
  /// Alpha to be apply to [backgroundColor].
  /// {@endtemplate}
  final int? backgroundAlpha;

  /// {@template widgetarian.sheet.style.borderColor}
  /// Color to be used for the sheet's border.
  /// {@endtemplate}
  final Color? borderColor;

  /// {@template widgetarian.sheet.style.borderOpacity}
  /// Opacity to be apply to [borderColor].
  /// {@endtemplate}
  final double? borderOpacity;

  /// {@template widgetarian.sheet.style.borderAlpha}
  /// Alpha to be apply to [borderColor].
  /// {@endtemplate}
  final int? borderAlpha;

  /// {@template widgetarian.sheet.style.borderWidth}
  /// The width of this side of the sheet's border, in logical pixels.
  /// {@endtemplate}
  final double? borderWidth;

  /// {@template widgetarian.sheet.style.borderRadius}
  /// The radii for each corner of the sheet's border.
  /// {@endtemplate}
  final BorderRadius? borderRadius;

  /// {@template widgetarian.sheet.style.borderStyle}
  /// The style of this side of the sheet's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  /// {@endtemplate}
  final BorderStyle? borderStyle;

  /// {@template widgetarian.sheet.style.shape}
  /// The type of shape.
  /// {@endtemplate}
  final BoxShape? shape;

  /// {@template widgetarian.sheet.style.iconColor}
  /// Color to be used for the icon's inside the sheet.
  /// {@endtemplate}
  final Color? iconColor;

  /// {@template widgetarian.sheet.style.iconOpacity}
  /// Opacity to be apply to [iconColor].
  /// {@endtemplate}
  final double? iconOpacity;

  /// {@template widgetarian.sheet.style.iconSize}
  /// The size of the icon's inside the sheet, in logical pixels.
  /// {@endtemplate}
  final double? iconSize;

  /// Whether or not this is text variant
  bool get isText => variant == SheetVariant.text;

  /// Whether or not this is tonal variant
  bool get isTonal => variant == SheetVariant.tonal;

  /// Whether or not this is filled variant
  bool get isFilled => variant == SheetVariant.filled;

  /// Whether or not this is elevated variant
  bool get isElevated => variant == SheetVariant.elevated;

  /// Whether or not this is outlined variant
  bool get isOutlined => variant == SheetVariant.outlined;

  /// An [SheetStyle] with some reasonable default values.
  static const defaults = SheetStyle(
    variant: SheetVariant.text,
    shape: BoxShape.rectangle,
    clipBehavior: Clip.antiAlias,
  );

  /// An [SheetStyle] with some reasonable disabled values.
  static const disabled = SheetStyle(
    foregroundAlpha: 0x61, // 38%
    backgroundAlpha: 0x0c, // 38% * 12% = 5%
    borderAlpha: 0x0c, // 38% * 12% = 5%
  );

  /// [SheetStyle] with an empty value.
  const SheetStyle({
    this.variant,
    this.severity,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.clipBehavior,
    this.overlayDisabled,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTint,
    this.elevation,
    this.foregroundStyle,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.foregroundSpacing,
    this.foregroundLoosen,
    this.foregroundExpanded,
    this.foregroundAlign,
    this.foregroundJustify,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
    this.shape,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
  });

  /// Create a [SheetStyle] from another style
  SheetStyle.from(SheetStyle? other)
      : variant = other?.variant,
        severity = other?.severity,
        width = other?.width,
        height = other?.height,
        margin = other?.margin,
        padding = other?.padding,
        alignment = other?.alignment,
        clipBehavior = other?.clipBehavior,
        overlayDisabled = other?.overlayDisabled,
        overlayColor = other?.overlayColor,
        shadowColor = other?.shadowColor,
        surfaceTint = other?.surfaceTint,
        elevation = other?.elevation,
        foregroundStyle = other?.foregroundStyle,
        foregroundColor = other?.foregroundColor,
        foregroundOpacity = other?.foregroundOpacity,
        foregroundAlpha = other?.foregroundAlpha,
        foregroundSpacing = other?.foregroundSpacing,
        foregroundLoosen = other?.foregroundLoosen,
        foregroundExpanded = other?.foregroundExpanded,
        foregroundAlign = other?.foregroundAlign,
        foregroundJustify = other?.foregroundJustify,
        backgroundColor = other?.backgroundColor,
        backgroundOpacity = other?.backgroundOpacity,
        backgroundAlpha = other?.backgroundAlpha,
        borderColor = other?.borderColor,
        borderOpacity = other?.borderOpacity,
        borderAlpha = other?.borderAlpha,
        borderWidth = other?.borderWidth,
        borderRadius = other?.borderRadius,
        borderStyle = other?.borderStyle,
        shape = other?.shape,
        iconColor = other?.iconColor,
        iconOpacity = other?.iconOpacity,
        iconSize = other?.iconSize;

  /// Create [SheetStyle] with default value for toned style.
  const SheetStyle.tonal({
    Color? color,
    this.severity,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.clipBehavior,
    this.overlayDisabled,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTint,
    this.elevation,
    this.foregroundStyle,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.foregroundSpacing,
    this.foregroundLoosen,
    this.foregroundExpanded,
    this.foregroundAlign,
    this.foregroundJustify,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
    this.shape,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
  })  : variant = SheetVariant.tonal,
        backgroundColor = color,
        foregroundColor = color;

  /// Create [SheetStyle] with default value for filled style.
  const SheetStyle.filled({
    Color? color,
    this.severity,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.clipBehavior,
    this.overlayDisabled,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTint,
    this.elevation,
    this.foregroundStyle,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.foregroundSpacing,
    this.foregroundLoosen,
    this.foregroundExpanded,
    this.foregroundAlign,
    this.foregroundJustify,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
    this.shape,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
  })  : backgroundColor = color,
        borderColor = color,
        variant = SheetVariant.filled;

  /// Create [SheetStyle] with default value for elevated style.
  const SheetStyle.elevated({
    Color? color,
    this.severity,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.clipBehavior,
    this.overlayDisabled,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTint,
    this.elevation,
    this.foregroundStyle,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.foregroundSpacing,
    this.foregroundLoosen,
    this.foregroundExpanded,
    this.foregroundAlign,
    this.foregroundJustify,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
    this.shape,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
  })  : backgroundColor = color,
        borderColor = color,
        variant = SheetVariant.elevated;

  /// Create [SheetStyle] with default value for outlined style.
  const SheetStyle.outlined({
    Color? color,
    this.severity,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.clipBehavior,
    this.overlayDisabled,
    this.overlayColor,
    this.shadowColor,
    this.surfaceTint,
    this.elevation,
    this.foregroundStyle,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.foregroundSpacing,
    this.foregroundLoosen,
    this.foregroundExpanded,
    this.foregroundAlign,
    this.foregroundJustify,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
    this.shape,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
  })  : borderColor = color,
        foregroundColor = color,
        variant = SheetVariant.outlined;

  /// Creates a copy of this [SheetStyle] but with
  /// the given fields replaced with the new values.
  SheetStyle copyWith({
    SheetVariant? variant,
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
  }) {
    return SheetStyle(
      variant: variant ?? this.variant,
      severity: severity ?? this.severity,
      width: width ?? this.width,
      height: height ?? this.height,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      alignment: alignment ?? this.alignment,
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
  }

  /// Creates a copy of this [SheetStyle] but with
  /// the given fields replaced with the new values.
  SheetStyle merge(SheetStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      variant: other.variant,
      severity: other.severity,
      width: other.width,
      height: other.height,
      margin: other.margin,
      padding: other.padding,
      alignment: other.alignment,
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
  }

  /// Linearly interpolate between two [SheetStyle] objects.
  static SheetStyle? lerp(SheetStyle? a, SheetStyle? b, double t) {
    if (a == null && b == null) return null;
    return SheetStyle(
      variant: lerpEnum(a?.variant, b?.variant, t),
      severity: lerpEnum(a?.severity, b?.severity, t),
      shape: lerpEnum(a?.shape, b?.shape, t),
      width: lerpDouble(a?.width, b?.width, t),
      height: lerpDouble(a?.height, b?.height, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      alignment: lerpEnum(a?.alignment, b?.alignment, t),
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

  Map<String, dynamic> toMap() => {
        'variant': variant,
        'severity': severity,
        'shape': shape,
        'width': width,
        'height': height,
        'margin': margin,
        'padding': padding,
        'alignment': alignment,
        'clipBehavior': clipBehavior,
        'overlayDisabled': overlayDisabled,
        'overlayColor': overlayColor,
        'shadowColor': shadowColor,
        'surfaceTint': surfaceTint,
        'elevation': elevation,
        'foregroundStyle': foregroundStyle,
        'foregroundColor': foregroundColor,
        'foregroundOpacity': foregroundOpacity,
        'foregroundAlpha': foregroundAlpha,
        'foregroundSpacing': foregroundSpacing,
        'foregroundLoosen': foregroundLoosen,
        'foregroundExpanded': foregroundExpanded,
        'foregroundAlign': foregroundAlign,
        'foregroundJustify': foregroundJustify,
        'backgroundColor': backgroundColor,
        'backgroundOpacity': backgroundOpacity,
        'backgroundAlpha': backgroundAlpha,
        'borderColor': borderColor,
        'borderOpacity': borderOpacity,
        'borderAlpha': borderAlpha,
        'borderWidth': borderWidth,
        'borderRadius': borderRadius,
        'borderStyle': borderStyle,
        'iconColor': iconColor,
        'iconOpacity': iconOpacity,
        'iconSize': iconSize,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is SheetStyle && mapEquals(other.toMap(), toMap());
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
