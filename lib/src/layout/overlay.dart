import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';

class AnimatedOverlay extends ImplicitlyAnimatedWidget {
  const AnimatedOverlay({
    Key? key,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 100),
    this.color,
    this.opacity,
    this.shape,
    this.radius,
    this.child,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );

  final Color? color;
  final double? opacity;
  final BoxShape? shape;
  final double? radius;
  final Widget? child;

  @override
  AnimatedWidgetBaseState<AnimatedOverlay> createState() =>
      _AnimatedOverlayState();
}

class _AnimatedOverlayState extends AnimatedWidgetBaseState<AnimatedOverlay> {
  ColorTween? color;
  Tween<double?>? opacity;
  Tween<double?>? radius;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    color = visitor(
      color,
      widget.color,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    opacity = visitor(
      opacity,
      widget.opacity ?? 0.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    radius = visitor(
      radius,
      widget.radius ?? 0.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      color: color?.evaluate(animation),
      opacity: opacity?.evaluate(animation),
      radius: radius?.evaluate(animation),
      shape: widget.shape,
      child: widget.child,
    );
  }
}

class Overlay extends SingleChildRenderObjectWidget {
  const Overlay({
    Key? key,
    this.color,
    this.opacity,
    this.shape,
    this.radius,
    Widget? child,
  }) : super(key: key, child: child);

  final Color? color;
  final double? opacity;
  final BoxShape? shape;
  final double? radius;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderOverlay(
      color: color,
      opacity: opacity,
      shape: shape,
      radius: radius,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderOverlay renderObject,
  ) {
    renderObject
      ..color = color
      ..opacity = opacity
      ..shape = shape
      ..radius = radius;
  }
}

class RenderOverlay extends RenderProxyBox {
  RenderOverlay({
    Color? color,
    double? opacity,
    BoxShape? shape,
    double? radius,
  })  : _color = color ?? Colors.black,
        _opacity = opacity ?? 0.0,
        _shape = shape ?? BoxShape.circle,
        _radius = radius ?? 0.0;

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

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);

    final Canvas canvas = context.canvas;
    canvas.save();
    canvas.translate(offset.dx, offset.dy);

    final paint = Paint()..color = color.withOpacity(opacity);
    final origin = Offset.zero & size;
    if (shape == BoxShape.rectangle) {
      canvas.drawRect(origin, paint);
    } else {
      canvas.drawCircle(origin.center, radius, paint);
    }

    canvas.restore();
  }
}
