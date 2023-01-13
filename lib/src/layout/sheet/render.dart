import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/animation.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/src/layout/box.dart';
import 'package:widgetarian/src/layout/tiles/tile/style.dart';
import 'package:widgetarian/src/layout/tiles/tile/theme.dart';
import 'style.dart';
import 'fallback.dart';

class SheetRender extends StatefulWidget {
  const SheetRender({
    Key? key,
    this.tooltip,
    required this.curve,
    required this.duration,
    required this.style,
    required this.fallback,
    required this.child,
  }) : super(key: key);

  final Curve curve;
  final Duration duration;
  final SheetStyle style;
  final SheetStyleFallback fallback;
  final String? tooltip;
  final Widget? child;

  @override
  State<SheetRender> createState() => _SheetRenderState();
}

class _SheetRenderState extends State<SheetRender> {
  SheetStyle get style => widget.style;
  SheetStyle get fallback => widget.fallback.resolve(
        variant: style.variant,
        severity: style.severity,
      );

  Color? get defaultBackgroundColor {
    return fallback.backgroundColor;
  }

  Color? get defaultBorderColor {
    return fallback.borderColor;
  }

  Color? get defaultForegroundColor {
    return style.isFilled || style.isElevated
        ? Colors.onSurface(backgroundColor)!
        : fallback.foregroundColor;
  }

  Color? get defaultShadowColor {
    return fallback.borderColor;
  }

  Color? get backgroundColor => Colors.withTransparency(
        style.backgroundColor ?? defaultBackgroundColor,
        opacity: style.backgroundOpacity,
        alpha: style.backgroundAlpha,
      );

  Color? get borderColor => Colors.withTransparency(
        style.borderColor ?? defaultBorderColor,
        opacity: style.borderOpacity,
        alpha: style.borderAlpha,
      );

  Color? get foregroundColor => Colors.withTransparency(
        style.foregroundColor ?? defaultForegroundColor,
        opacity: style.foregroundOpacity,
        alpha: style.foregroundAlpha,
      );

  Color? get shadowColor {
    return style.shadowColor ?? defaultShadowColor;
  }

  Color? get iconColor {
    return style.iconColor ?? foregroundColor;
  }

  TextStyle get foregroundStyle {
    return const TextStyle()
        .merge(style.foregroundStyle)
        .copyWith(color: foregroundColor);
  }

  double? get width {
    return style.shape == BoxShape.circle ? style.height : style.width;
  }

  @override
  void didUpdateWidget(SheetRender oldWidget) {
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
          curve: widget.curve,
          duration: widget.duration,
          data: IconThemeData(
            color: iconColor,
            size: style.iconSize,
            opacity: style.iconOpacity,
          ),
          child: AnimatedTileTheme(
            curve: widget.curve,
            duration: widget.duration,
            style: TileStyle(
              childExpanded: style.foregroundExpanded,
              crossAxisAlignment: style.foregroundAlign,
              mainAxisAlignment: style.foregroundJustify,
              mainAxisExpanded: width == double.infinity,
              spacing: style.foregroundSpacing,
              spacingEnforced: style.foregroundLoosen,
            ),
            child: AnimatedBox(
              curve: widget.curve,
              duration: widget.duration,
              tooltip: widget.tooltip,
              color: backgroundColor,
              shadowColor: shadowColor,
              borderColor: borderColor,
              borderRadius: style.borderRadius,
              borderWidth: style.borderWidth,
              borderStyle: style.borderStyle,
              elevation: style.elevation,
              alignment: style.alignment,
              clipBehavior: style.clipBehavior,
              shape: style.shape,
              padding: style.padding,
              margin: style.margin,
              height: style.height,
              width: width,
              child: widget.child,
            ),
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
    properties.add(ColorProperty('shadowColor', shadowColor));
    properties.add(ColorProperty('iconColor', iconColor));
    properties.add(
        DiagnosticsProperty<TextStyle>('foregroundStyle', foregroundStyle));
    properties.add(DoubleProperty('width', width));
  }
}
