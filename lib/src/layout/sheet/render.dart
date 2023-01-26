import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/animation.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/src/layout/box.dart';
import 'package:widgetarian/src/layout/tiles/tile/style.dart';
import 'package:widgetarian/src/layout/tiles/tile/theme_data.dart';
import 'package:widgetarian/src/layout/tiles/tile/theme.dart';
import 'style.dart';
import 'theme_data.dart';

class SheetRender extends StatefulWidget {
  const SheetRender({
    Key? key,
    required this.theme,
    this.style,
    this.curve,
    this.duration,
    this.tooltip,
    this.child,
  }) : super(key: key);

  final SheetThemeData theme;
  final SheetStyle? style;
  final Curve? curve;
  final Duration? duration;
  final String? tooltip;
  final Widget? child;

  @override
  State<SheetRender> createState() => _SheetRenderState();
}

class _SheetRenderState extends State<SheetRender> {
  Curve get curve => widget.curve ?? widget.theme.curve;

  Duration get duration => widget.duration ?? widget.theme.duration;

  SheetStyle get style {
    final raw = SheetStyle.defaults.merge(widget.style);
    final fallback = widget.theme.resolve(
      variant: raw.variant,
      severity: raw.severity,
    );
    return fallback.merge(raw);
  }

  Color? get defaultForegroundColor {
    return style.isFilled || style.isElevated
        ? Colors.onSurface(backgroundColor)
        : null;
  }

  Color? get borderColor => Colors.withTransparency(
        style.borderColor,
        opacity: style.borderOpacity,
        alpha: style.borderAlpha,
      );

  Color? get backgroundColor {
    final color = Colors.withTransparency(
      style.backgroundColor,
      opacity: style.backgroundOpacity,
      alpha: style.backgroundAlpha,
    );

    final elevation = style.elevation;

    if (color == null || elevation == null) return color;

    if (surfaceTint != null) {
      return ElevationOverlay.applySurfaceTint(color, surfaceTint, elevation);
    }
    return ElevationOverlay.applyOverlay(context, color, elevation);
  }

  Color? get foregroundColor => Colors.withTransparency(
        style.foregroundColor ?? defaultForegroundColor,
        opacity: style.foregroundOpacity,
        alpha: style.foregroundAlpha,
      );

  Color? get shadowColor {
    return style.shadowColor;
  }

  Color? get surfaceTint {
    return style.surfaceTint;
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
        curve: curve,
        duration: duration,
        style: foregroundStyle,
        child: AnimatedIconTheme(
          curve: curve,
          duration: duration,
          data: IconThemeData(
            color: iconColor,
            size: style.iconSize,
            opacity: style.iconOpacity,
          ),
          child: AnimatedTileTheme(
            curve: curve,
            duration: duration,
            data: TileThemeData(
              style: TileStyle(
                childExpanded: style.foregroundExpanded,
                crossAxisAlignment: style.foregroundAlign,
                mainAxisAlignment: style.foregroundJustify,
                mainAxisExpanded: width == double.infinity,
                spacing: style.foregroundSpacing,
                spacingEnforced: style.foregroundLoosen,
              ),
            ),
            child: AnimatedBox(
              curve: curve,
              duration: duration,
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
