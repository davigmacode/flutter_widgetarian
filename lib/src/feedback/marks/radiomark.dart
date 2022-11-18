import 'package:flutter/widgets.dart';
import 'package:widgetarian/tween.dart';

class AnimatedRadiomark extends ImplicitlyAnimatedWidget {
  const AnimatedRadiomark({
    Key? key,
    this.shape,
    this.color,
    this.fill,
    this.size,
    this.padding,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.linear,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  /// Color of the checkmark.
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to [Colors.black87].
  final Color? color;

  /// Color of the fill background.
  ///
  /// Changing triggers animation.
  final Color? fill;

  /// Defaults to [RoundedRectangleBorder]
  final ShapeBorder? shape;

  /// Expand to parent if the value is [Size.zero].
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to parent size.
  final double? size;

  /// Whether to show the checkmark.
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to [true].
  final double? padding;

  @override
  AnimatedRadiomarkState createState() => AnimatedRadiomarkState();
}

class AnimatedRadiomarkState
    extends AnimatedWidgetBaseState<AnimatedRadiomark> {
  Tween<double?>? size;
  Tween<double?>? padding;
  ShapeBorderTween? shape;
  ColorTween? color;
  ColorTween? fill;

  ShapeBorder get defaultShape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
      side: BorderSide(
        color: widget.color ?? const Color(0xFF000000),
        width: 2,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    padding = visitor(
      padding,
      widget.padding,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    shape = visitor(
      shape,
      widget.shape ?? defaultShape,
      (dynamic value) => ShapeBorderTween(begin: value),
    ) as ShapeBorderTween?;

    size = visitor(
      size,
      widget.size,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    color = visitor(
      color,
      widget.color,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    fill = visitor(
      fill,
      widget.fill,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;
  }

  @override
  Widget build(BuildContext context) {
    return Radiomark(
      padding: padding?.evaluate(animation),
      shape: shape?.evaluate(animation),
      color: color?.evaluate(animation),
      fill: fill?.evaluate(animation),
      size: size?.evaluate(animation),
    );
  }
}

class Radiomark extends CustomPaint {
  Radiomark({
    Key? key,
    double? padding,
    ShapeBorder? shape,
    Color? color,
    Color? fill,
    double? size,
  }) : super(
          key: key,
          size: size != null ? Size.square(size) : Size.zero,
          painter: RadiomarkPainter(
            padding: padding,
            shape: shape,
            color: color,
            fill: fill,
          ),
        );
}

class RadiomarkPainter extends CustomPainter {
  RadiomarkPainter({
    double? padding,
    ShapeBorder? shape,
    Color? color,
    this.fill,
  })  : padding = padding ?? 0.5,
        color = color ?? const Color(0xFF000000),
        shape = shape ?? const CircleBorder(side: BorderSide());

  /// between 0.0 to 1.0
  final double padding;

  final ShapeBorder shape;

  /// inner color
  final Color color;

  /// outer color
  final Color? fill;

  // final CustomClipper<Path>? clipper;

  @override
  bool shouldRepaint(RadiomarkPainter oldDelegate) {
    return oldDelegate.padding != padding ||
        oldDelegate.color != color ||
        oldDelegate.fill != fill ||
        oldDelegate.shape != shape;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawOuter(canvas, size);
    _drawInner(canvas, size);
  }

  void _drawOuter(Canvas canvas, Size size) {
    final outer = Offset.zero & size;

    // draw fill
    if (fill != null) {
      final paint = Paint()..color = fill!;
      canvas.drawPath(shape.getInnerPath(outer), paint);
    }
    // draw border
    shape.paint(canvas, outer);
  }

  void _drawInner(Canvas canvas, Size size) {
    final origin = (Offset.zero & size).center;
    final scale = 1.0 - padding;
    final offset = origin - ((origin - Offset.zero) * scale);
    final outer = offset & (size * scale);

    final paint = Paint()..color = color;
    canvas.drawPath(shape.getOuterPath(outer), paint);
  }
}
