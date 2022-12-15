import 'package:flutter/material.dart' show Theme, ThemeData;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/animation.dart';
import 'package:widgetarian/utils.dart';
import '../box.dart';
import 'style.dart';
import 'theme.dart';

/// The sheet widget is the baseline for numerous components.
class Sheet extends StatelessWidget {
  const Sheet({
    Key? key,
    this.duration,
    this.curve,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
    this.clipBehavior,
    this.overlayColor,
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
    this.shape,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
    this.style,
    this.tooltip,
    this.child,
  }) : super(key: key);

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

  /// {@macro widgetarian.sheet.style.width}
  final double? width;

  /// {@macro widgetarian.sheet.style.height}
  final double? height;

  /// {@macro widgetarian.sheet.style.margin}
  final EdgeInsetsGeometry? margin;

  /// {@macro widgetarian.sheet.style.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro widgetarian.sheet.style.alignment}
  final Alignment? alignment;

  /// {@macro widgetarian.sheet.style.clipBehavior}
  final Clip? clipBehavior;

  /// {@macro widgetarian.sheet.style.overlayColor}
  final Color? overlayColor;

  /// {@macro widgetarian.sheet.style.shadowColor}
  final Color? shadowColor;

  /// {@macro widgetarian.sheet.style.elevation}
  final double? elevation;

  /// {@macro widgetarian.sheet.style.foregroundStyle}
  final TextStyle? foregroundStyle;

  /// {@macro widgetarian.sheet.style.foregroundColor}
  final Color? foregroundColor;

  /// {@macro widgetarian.sheet.style.foregroundOpacity}
  final double? foregroundOpacity;

  /// {@macro widgetarian.sheet.style.foregroundAlpha}
  final int? foregroundAlpha;

  /// {@macro widgetarian.sheet.style.foregroundSpacing}
  final double? foregroundSpacing;

  /// {@macro widgetarian.sheet.style.backgroundColor}
  final Color? backgroundColor;

  /// {@macro widgetarian.sheet.style.backgroundOpacity}
  final double? backgroundOpacity;

  /// {@macro widgetarian.sheet.style.backgroundAlpha}
  final int? backgroundAlpha;

  /// {@macro widgetarian.sheet.style.borderColor}
  final Color? borderColor;

  /// {@macro widgetarian.sheet.style.borderOpacity}
  final double? borderOpacity;

  /// {@macro widgetarian.sheet.style.borderAlpha}
  final int? borderAlpha;

  /// {@macro widgetarian.sheet.style.borderWidth}
  final double? borderWidth;

  /// {@macro widgetarian.sheet.style.borderRadius}
  final BorderRadius? borderRadius;

  /// {@macro widgetarian.sheet.style.borderStyle}
  final BorderStyle? borderStyle;

  /// {@macro widgetarian.sheet.style.shape}
  final BoxShape? shape;

  /// {@macro widgetarian.sheet.style.iconColor}
  final Color? iconColor;

  /// {@macro widgetarian.sheet.style.iconOpacity}
  final double? iconOpacity;

  /// {@macro widgetarian.sheet.style.iconSize}
  final double? iconSize;

  /// The style to be applied to the sheet.
  final SheetStyle? style;

  /// Tooltip string to be used for the body area of the button.
  final String? tooltip;

  /// The widget below this widget in the tree.
  final Widget? child;

  SheetStyle get effectiveStyle {
    return SheetStyle.from(style).copyWith(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      alignment: alignment,
      clipBehavior: clipBehavior,
      overlayColor: overlayColor,
      shadowColor: shadowColor,
      elevation: elevation,
      foregroundStyle: foregroundStyle,
      foregroundColor: foregroundColor,
      foregroundOpacity: foregroundOpacity,
      foregroundAlpha: foregroundAlpha,
      foregroundSpacing: foregroundSpacing,
      backgroundColor: backgroundColor,
      backgroundOpacity: backgroundOpacity,
      backgroundAlpha: backgroundAlpha,
      borderColor: borderColor,
      borderOpacity: borderOpacity,
      borderAlpha: borderAlpha,
      borderWidth: borderWidth,
      borderRadius: borderRadius,
      borderStyle: borderStyle,
      shape: shape,
      iconColor: iconColor,
      iconOpacity: iconOpacity,
      iconSize: iconSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    final sheetTheme = SheetTheme.of(context);
    return _SheetRender(
      theme: Theme.of(context),
      curve: sheetTheme.curve,
      duration: sheetTheme.duration,
      style: sheetTheme.style.merge(effectiveStyle),
      tooltip: tooltip,
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SheetStyle?>('style', style));
    properties
        .add(DiagnosticsProperty<SheetStyle>('effectiveStyle', effectiveStyle));
  }
}

class _SheetRender extends StatefulWidget {
  const _SheetRender({
    Key? key,
    this.tooltip,
    required this.theme,
    required this.curve,
    required this.duration,
    required this.style,
    required this.child,
  }) : super(key: key);

  final ThemeData theme;
  final Curve curve;
  final Duration duration;
  final SheetStyle style;
  final String? tooltip;
  final Widget? child;

  @override
  State<_SheetRender> createState() => _SheetRenderState();
}

class _SheetRenderState extends State<_SheetRender> {
  SheetStyle get style => widget.style;

  Color get defaultBackgroundColor {
    return style.isOutlined
        ? widget.theme.colorScheme.surface
        : widget.theme.unselectedWidgetColor;
  }

  Color get defaultBorderColor {
    return widget.theme.colorScheme.outline;
  }

  Color get defaultForegroundColor {
    return style.isFilled
        ? Colors.colorOnSurface(backgroundColor)!
        : widget.theme.colorScheme.onSurface;
  }

  Color get backgroundColor => Colors.colorWithOpacityOrAlpha(
        style.backgroundColor ?? defaultBackgroundColor,
        style.backgroundOpacity,
        style.backgroundAlpha,
      );

  Color get borderColor => Colors.colorWithOpacityOrAlpha(
        style.borderColor ?? defaultBorderColor,
        style.borderOpacity,
        style.borderAlpha,
      );

  Color get foregroundColor => Colors.colorWithOpacityOrAlpha(
        style.foregroundColor ?? defaultForegroundColor,
        style.foregroundOpacity,
        style.foregroundAlpha,
      );

  Clip get clipBehavior {
    return style.clipBehavior ?? SheetStyle.defaultClipBehavior;
  }

  double? get width {
    return style.shape == BoxShape.circle ? height : style.width;
  }

  double? get height {
    return style.height;
  }

  EdgeInsetsGeometry get padding {
    final defaultPadding = style.shape == BoxShape.circle
        ? EdgeInsets.zero
        : SheetStyle.defaultPadding;
    return style.padding ?? defaultPadding;
  }

  EdgeInsetsGeometry get margin {
    return style.margin ?? SheetStyle.defaultMargin;
  }

  Color get shadowColor {
    return style.shadowColor ?? widget.theme.colorScheme.shadow;
  }

  BoxShape get shape {
    return style.shape ?? BoxShape.rectangle;
  }

  BorderRadius get borderRadius {
    return style.borderRadius ?? SheetStyle.defaultBorderRadius;
  }

  BorderSide get borderSide {
    return BorderSide(
      color: borderColor,
      width: style.borderWidth ?? SheetStyle.defaultBorderWidth,
      style: style.borderStyle ?? SheetStyle.defaultBorderStyle,
    );
  }

  TextStyle get foregroundStyle {
    return const TextStyle()
        .copyWith(color: foregroundColor)
        .merge(style.foregroundStyle);
  }

  Color get iconColor {
    return style.iconColor ?? foregroundColor;
  }

  double get iconSize {
    return style.iconSize ?? SheetStyle.defaultIconSize;
  }

  @override
  void didUpdateWidget(_SheetRender oldWidget) {
    if (mounted) {
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      child: AnimatedDefaultTextStyle(
        curve: widget.curve,
        duration: widget.duration,
        style: foregroundStyle,
        child: AnimatedIconTheme(
          data: IconThemeData(
            color: iconColor,
            size: style.iconSize,
            opacity: style.iconOpacity,
          ),
          child: AnimatedBox(
            curve: widget.curve,
            duration: widget.duration,
            tooltip: widget.tooltip,
            color: backgroundColor,
            clipBehavior: clipBehavior,
            shape: shape,
            borderSide: borderSide,
            borderRadius: borderRadius,
            shadowColor: shadowColor,
            elevation: style.elevation,
            padding: padding,
            margin: margin,
            width: width,
            height: height,
            alignment: style.alignment,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(ColorProperty('defaultBackgroundColor', defaultBackgroundColor));
    properties.add(ColorProperty('defaultBorderColor', defaultBorderColor));
    properties
        .add(ColorProperty('defaultForegroundColor', defaultForegroundColor));
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(ColorProperty('borderColor', borderColor));
    properties.add(ColorProperty('foregroundColor', foregroundColor));
    properties.add(EnumProperty<Clip>('clipBehavior', clipBehavior));
    properties.add(DoubleProperty('width', width));
    properties.add(DoubleProperty('height', height));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin));
    properties.add(ColorProperty('shadowColor', shadowColor));
    properties.add(EnumProperty<BoxShape>('shape', shape));
    properties
        .add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius));
    properties.add(DiagnosticsProperty<BorderSide>('borderSide', borderSide));
    properties.add(
        DiagnosticsProperty<TextStyle>('foregroundStyle', foregroundStyle));
    properties.add(ColorProperty('iconColor', iconColor));
    properties.add(DoubleProperty('iconSize', iconSize));
  }
}
