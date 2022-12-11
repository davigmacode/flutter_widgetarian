import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';

class OverlayStyle {
  final Color? color;
  final double? opacity;
  final double? radius;
  final BoxShape? shape;
  final EdgeInsetsGeometry? padding;

  const OverlayStyle({
    this.color,
    this.opacity,
    this.radius,
    this.shape,
    this.padding,
  });

  /// Create a overlay's style from another style
  OverlayStyle.from(OverlayStyle? other)
      : color = other?.color,
        opacity = other?.opacity,
        radius = other?.radius,
        shape = other?.shape,
        padding = other?.padding;

  /// Creates a copy of this [SheetStyle] but with
  /// the given fields replaced with the new values.
  OverlayStyle copyWith({
    Color? color,
    double? opacity,
    double? radius,
    BoxShape? shape,
    EdgeInsetsGeometry? padding,
  }) {
    return OverlayStyle(
      color: color,
      opacity: opacity,
      radius: radius,
      shape: shape,
      padding: padding,
    );
  }

  /// Creates a copy of this [SheetStyle] but with
  /// the given fields replaced with the new values.
  OverlayStyle merge(OverlayStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      color: other.color,
      opacity: other.opacity,
      radius: other.radius,
      shape: other.shape,
      padding: other.padding,
    );
  }
}

class AnimatedOverlay extends ImplicitlyAnimatedWidget {
  const AnimatedOverlay({
    Key? key,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 100),
    this.color,
    this.opacity,
    this.radius,
    this.shape,
    this.padding,
    this.style,
    this.content,
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
  final EdgeInsetsGeometry? padding;
  final OverlayStyle? style;
  final Widget? content;
  final Widget? child;

  @override
  AnimatedWidgetBaseState<AnimatedOverlay> createState() =>
      _AnimatedOverlayState();
}

class _AnimatedOverlayState extends AnimatedWidgetBaseState<AnimatedOverlay> {
  ColorTween? color;
  Tween<double?>? opacity;
  Tween<double?>? radius;
  EdgeInsetsGeometryTween? padding;

  OverlayStyle get style {
    return OverlayStyle.from(widget.style).copyWith(
      color: widget.color,
      opacity: widget.opacity,
      radius: widget.radius,
      shape: widget.shape,
      padding: widget.padding,
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

    padding = visitor(
      padding,
      style.padding ?? EdgeInsets.zero,
      (dynamic value) => EdgeInsetsGeometryTween(begin: value),
    ) as EdgeInsetsGeometryTween?;
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      color: color?.evaluate(animation),
      opacity: opacity?.evaluate(animation),
      radius: radius?.evaluate(animation),
      padding: padding?.evaluate(animation),
      shape: style.shape,
      content: widget.content,
      child: widget.child,
    );
  }
}

class Overlay extends RenderObjectWidget
    with SlottedMultiChildRenderObjectWidgetMixin<OverlaySlot> {
  const Overlay({
    Key? key,
    this.color,
    this.opacity,
    this.radius,
    this.shape,
    this.padding,
    this.style,
    this.content,
    this.child,
  }) : super(key: key);

  final Color? color;
  final double? opacity;
  final double? radius;
  final BoxShape? shape;
  final EdgeInsetsGeometry? padding;
  final OverlayStyle? style;
  final Widget? content;
  final Widget? child;

  OverlayStyle get effectiveStyle {
    return OverlayStyle.from(style).copyWith(
      color: color,
      opacity: opacity,
      radius: radius,
      shape: shape,
      padding: padding,
    );
  }

  @override
  Iterable<OverlaySlot> get slots => OverlaySlot.values;

  @override
  Widget? childForSlot(OverlaySlot slot) {
    switch (slot) {
      case OverlaySlot.content:
        return content;
      case OverlaySlot.child:
        return child;
    }
  }

  @override
  RenderOverlay createRenderObject(BuildContext context) {
    return RenderOverlay(
      color: effectiveStyle.color,
      opacity: effectiveStyle.opacity,
      shape: effectiveStyle.shape,
      radius: effectiveStyle.radius,
      padding: effectiveStyle.padding,
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
      ..radius = effectiveStyle.radius
      ..padding = effectiveStyle.padding;
  }
}

class RenderOverlay extends RenderProxyBox
    with SlottedContainerRenderObjectMixin<OverlaySlot> {
  RenderOverlay({
    Color? color,
    double? opacity,
    BoxShape? shape,
    double? radius,
    EdgeInsetsGeometry? padding,
  })  : _color = color ?? Colors.black,
        _opacity = opacity ?? 0.0,
        _shape = shape ?? BoxShape.circle,
        _radius = radius ?? 0.0,
        _padding = padding ?? EdgeInsets.zero;

  @override
  RenderBox? get child => childForSlot(OverlaySlot.child);
  RenderBox? get content => childForSlot(OverlaySlot.content);

  bool get hasChild => child != null;
  bool get hasContent => content != null;

  @override
  bool get isRepaintBoundary => true;

  // The returned list is ordered for hit testing.
  @override
  Iterable<RenderBox> get children {
    return <RenderBox>[
      if (hasChild) child!,
      if (hasContent) content!,
    ];
  }

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

  EdgeInsetsGeometry get padding => _padding;
  EdgeInsetsGeometry _padding;
  set padding(EdgeInsetsGeometry? value) {
    if (value == null) return;
    if (_padding == value) return;
    _padding = value;
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);

    final Canvas canvas = context.canvas;

    /// paint overlay
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

    /// paint content
    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    if (hasContent) {
      context.paintChild(content!, offset);
    }
    canvas.restore();
  }
}

enum OverlaySlot { content, child }
