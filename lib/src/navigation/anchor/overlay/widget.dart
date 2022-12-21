import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';
import 'tween.dart';

class AnimatedOverlay extends ImplicitlyAnimatedWidget {
  const AnimatedOverlay({
    Key? key,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 100),
    this.color,
    this.opacity,
    this.radius,
    this.borderRadius,
    this.shape,
    this.style,
    this.child,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );

  final Color? color;
  final double? opacity;
  final double? radius;
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final OverlayStyle? style;
  final Widget? child;

  @override
  AnimatedWidgetBaseState<AnimatedOverlay> createState() =>
      _AnimatedOverlayState();
}

class _AnimatedOverlayState extends AnimatedWidgetBaseState<AnimatedOverlay> {
  OverlayStyleTween? styleTween;

  OverlayStyle get effectiveStyle {
    return OverlayStyle.from(widget.style).copyWith(
      color: widget.color,
      opacity: widget.opacity,
      radius: widget.radius,
      borderRadius: widget.borderRadius,
      shape: widget.shape,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    styleTween = visitor(
      styleTween,
      effectiveStyle,
      (dynamic value) => OverlayStyleTween(begin: value),
    ) as OverlayStyleTween?;
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      style: styleTween?.evaluate(animation),
      child: widget.child,
    );
  }
}

class Overlay extends SingleChildRenderObjectWidget {
  const Overlay({
    Key? key,
    this.color,
    this.opacity,
    this.radius,
    this.borderRadius,
    this.shape,
    this.style,
    Widget? child,
  }) : super(key: key, child: child);

  final Color? color;
  final double? opacity;
  final double? radius;
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final OverlayStyle? style;

  OverlayStyle get effectiveStyle {
    return OverlayStyle.from(style).copyWith(
      color: color,
      opacity: opacity,
      radius: radius,
      borderRadius: borderRadius,
      shape: shape,
    );
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderOverlay(
      color: effectiveStyle.color,
      opacity: effectiveStyle.opacity,
      radius: effectiveStyle.radius,
      borderRadius: effectiveStyle.borderRadius,
      shape: effectiveStyle.shape,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderOverlay renderObject,
  ) {
    renderObject
      ..color = effectiveStyle.color
      ..opacity = effectiveStyle.opacity
      ..radius = effectiveStyle.radius
      ..borderRadius = effectiveStyle.borderRadius
      ..shape = effectiveStyle.shape;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    effectiveStyle.debugFillProperties(properties);
  }
}

class RenderOverlay extends RenderProxyBox {
  RenderOverlay({
    Color? color,
    double? opacity,
    BoxShape? shape,
    double? radius,
    BorderRadius? borderRadius,
  })  : _color = color ?? Colors.black,
        _opacity = opacity ?? 0.0,
        _shape = shape ?? BoxShape.circle,
        _radius = radius ?? 0.0,
        _borderRadius = borderRadius ?? BorderRadius.zero;

  @override
  bool get isRepaintBoundary => true;

  Color get color => _color;
  Color _color;
  set color(Color? value) {
    if (value == null) return;
    if (_color == value) return;
    _color = value;
    markNeedsPaint();
  }

  double get opacity => _opacity;
  double _opacity;
  set opacity(double? value) {
    if (value == null) return;
    if (_opacity == value) return;
    _opacity = value;
    markNeedsPaint();
  }

  BoxShape get shape => _shape;
  BoxShape _shape;
  set shape(BoxShape? value) {
    if (value == null) return;
    if (_shape == value) return;
    _shape = value;
    markNeedsPaint();
  }

  double get radius => _radius;
  double _radius;
  set radius(double? value) {
    if (value == null) return;
    if (_radius == value) return;
    _radius = value;
    markNeedsPaint();
  }

  BorderRadius get borderRadius => _borderRadius;
  BorderRadius _borderRadius;
  set borderRadius(BorderRadius? value) {
    if (value == null) return;
    if (_borderRadius == value) return;
    _borderRadius = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);

    final Canvas canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    final paint = Paint()..color = color.withOpacity(opacity);
    final rect = Offset.zero & size;
    if (shape == BoxShape.rectangle) {
      if (borderRadius != BorderRadius.zero) {
        canvas.drawRRect(borderRadius.toRRect(rect), paint);
      } else {
        canvas.drawRect(rect, paint);
      }
    } else {
      canvas.drawCircle(rect.center, radius, paint);
    }

    canvas.restore();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('color', color));
    properties.add(DoubleProperty('opacity', opacity));
    properties.add(EnumProperty<BoxShape>('shape', shape));
    properties.add(DoubleProperty('radius', radius));
    properties
        .add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius));
  }
}
