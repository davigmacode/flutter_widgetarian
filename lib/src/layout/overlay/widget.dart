import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';

class AnimatedOverlay extends ImplicitlyAnimatedWidget {
  const AnimatedOverlay({
    Key? key,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 100),
    this.color,
    this.opacity,
    this.radius,
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
  final BoxShape? shape;
  final OverlayStyle? style;
  final Widget? child;

  @override
  AnimatedWidgetBaseState<AnimatedOverlay> createState() =>
      _AnimatedOverlayState();
}

class _AnimatedOverlayState extends AnimatedWidgetBaseState<AnimatedOverlay> {
  ColorTween? color;
  Tween<double?>? opacity;
  Tween<double?>? radius;

  OverlayStyle get style {
    return OverlayStyle.from(widget.style).copyWith(
      color: widget.color,
      opacity: widget.opacity,
      radius: widget.radius,
      shape: widget.shape,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    color = visitor(
      color,
      style.color,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    opacity = visitor(
      opacity,
      style.opacity ?? 0.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    radius = visitor(
      radius,
      style.radius ?? 0.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      color: color?.evaluate(animation),
      opacity: opacity?.evaluate(animation),
      radius: radius?.evaluate(animation),
      shape: style.shape,
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
    this.shape,
    this.style,
    Widget? child,
  }) : super(key: key, child: child);

  final Color? color;
  final double? opacity;
  final double? radius;
  final BoxShape? shape;
  final OverlayStyle? style;

  OverlayStyle get effectiveStyle {
    return OverlayStyle.from(style).copyWith(
      color: color,
      opacity: opacity,
      radius: radius,
      shape: shape,
    );
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderOverlay(
      color: effectiveStyle.color,
      opacity: effectiveStyle.opacity,
      shape: effectiveStyle.shape,
      radius: effectiveStyle.radius,
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
      ..shape = effectiveStyle.shape
      ..radius = effectiveStyle.radius;
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
