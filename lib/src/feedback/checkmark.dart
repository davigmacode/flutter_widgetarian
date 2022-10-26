import 'package:flutter/widgets.dart';
import 'package:widgetarian/animation.dart';

enum StrokeStyle { round, sharp }

class AnimatedCheckmark extends ImplicitlyAnimatedWidget {
  const AnimatedCheckmark({
    Key? key,
    this.color,
    this.fill,
    this.weight,
    this.padding,
    this.shape,
    this.style,
    this.size,
    this.value = true,
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

  /// Stroke width of the checkmark.
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to 1.0.
  final double? weight;

  /// Padding to the outer.
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to 0.0.
  final double? padding;

  /// Defaults to [RoundedRectangleBorder]
  final ShapeBorder? shape;

  /// Defaults to [StrokeStyle.sharp].
  final StrokeStyle? style;

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
  final bool? value;

  @override
  AnimatedCheckmarkState createState() => AnimatedCheckmarkState();
}

class AnimatedCheckmarkState
    extends AnimatedWidgetBaseState<AnimatedCheckmark> {
  Tween<double>? progress;
  Tween<double>? weight;
  Tween<double>? padding;
  Tween<double>? size;
  ColorTween? color;
  ColorTween? fill;
  ShapeBorderTween? shape;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    progress = visitor(
      progress,
      widget.value == null
          ? -1.0
          : widget.value == true
              ? 1.0
              : 0.0,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    weight = visitor(
      weight,
      widget.weight,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    padding = visitor(
      padding,
      widget.padding ?? 0.0,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    size = visitor(
      size,
      widget.size,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;

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

    shape = visitor(
      shape,
      widget.shape ?? const RoundedRectangleBorder(),
      (dynamic value) => ShapeBorderTween(begin: value),
    ) as ShapeBorderTween?;
  }

  @override
  Widget build(BuildContext context) {
    return Checkmark(
      progress: progress?.evaluate(animation),
      color: color?.evaluate(animation),
      fill: fill?.evaluate(animation),
      weight: weight?.evaluate(animation),
      padding: padding?.evaluate(animation),
      shape: shape?.evaluate(animation),
      size: size?.evaluate(animation) ?? widget.size,
      style: widget.style,
    );
  }
}

class Checkmark extends CustomPaint {
  Checkmark({
    Key? key,
    double? progress,
    Color? color,
    Color? fill,
    double? weight,
    double? padding,
    ShapeBorder? shape,
    StrokeStyle? style,
    double? size,
  }) : super(
          key: key,
          size: size != null && size != 0 ? Size.square(size) : Size.zero,
          painter: CheckmarkPainter(
            progress: progress,
            color: color,
            fill: fill,
            padding: padding,
            shape: shape,
            weight: weight,
            style: style,
          ),
        );
}

class CheckmarkPainter extends CustomPainter {
  CheckmarkPainter({
    double? progress,
    Color? color,
    this.fill,
    double? weight,
    double? padding,
    ShapeBorder? shape,
    StrokeStyle? style,
  })  : progress = progress ?? 1.0,
        color = color ?? const Color(0xFF000000),
        weight = weight ?? 1.0,
        padding = padding ?? 0.0,
        shape = shape ?? const RoundedRectangleBorder(),
        style = style ?? StrokeStyle.sharp;

  /// Defaults to 1.0
  final double progress;

  /// Defaults to black
  final Color color;

  /// Defaults to null
  final Color? fill;

  /// Defaults to 1.0
  final double weight;

  /// Defaults to 0.0
  final double padding;

  /// Defaults to [RoundedRectangleBorder]
  final ShapeBorder shape;

  /// Defaults to [StrokeStyle.sharp]
  final StrokeStyle style;

  @override
  bool shouldRepaint(CheckmarkPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.fill != fill ||
        oldDelegate.weight != weight ||
        oldDelegate.padding != padding ||
        oldDelegate.shape != shape ||
        oldDelegate.style != style;
  }

  void _drawBox(Canvas canvas, Size size) {
    const origin = Offset(0, 0);
    final outer = Rect.fromLTWH(
      origin.dx,
      origin.dy,
      size.width,
      size.height,
    ).deflate(-padding);

    // draw border
    shape.paint(canvas, outer);

    // draw fill
    if (fill != null) {
      final paint = Paint()..color = fill!;
      canvas.drawPath(shape.getOuterPath(outer), paint);
    }
  }

  void _drawCheck(Canvas canvas, Size size, Paint paint) {
    // As t goes from 0.0 to 1.0,
    // animate the two check mark strokes
    // from the short side to the long side.
    const origin = Offset(0, 0);
    final path = Path();
    final start = Offset(size.width * 0.15, size.height * 0.45);
    final mid = Offset(size.width * 0.4, size.height * 0.7);
    final end = Offset(size.width * 0.85, size.height * 0.25);
    if (progress < 0.5) {
      final strokeT = progress * 2.0;
      final drawMid = Offset.lerp(start, mid, strokeT)!;
      path.moveTo(origin.dx + start.dx, origin.dy + start.dy);
      path.lineTo(origin.dx + drawMid.dx, origin.dy + drawMid.dy);
    } else {
      final strokeT = (progress - 0.5) * 2.0;
      final drawEnd = Offset.lerp(mid, end, strokeT)!;
      path.moveTo(origin.dx + start.dx, origin.dy + start.dy);
      path.lineTo(origin.dx + mid.dx, origin.dy + mid.dy);
      path.lineTo(origin.dx + drawEnd.dx, origin.dy + drawEnd.dy);
    }
    canvas.drawPath(path, paint);
  }

  void _drawDash(Canvas canvas, Size size, Paint paint) {
    // As t goes from 0.0 to -1.0,
    // animate the horizontal line
    // from the mid point outwards.
    const origin = Offset(0, 0);
    final dy = size.height * 0.5;
    final start = Offset(size.width * 0.2, dy);
    final mid = Offset(size.width * 0.5, dy);
    final end = Offset(size.width * 0.8, dy);
    final drawStart = Offset.lerp(start, mid, 1.0 - (-progress))!;
    final drawEnd = Offset.lerp(mid, end, -progress)!;
    canvas.drawLine(origin + drawStart, origin + drawEnd, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    assert(progress >= -1.0 && progress <= 1.0);
    final isSharpen = style == StrokeStyle.sharp;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeJoin = isSharpen ? StrokeJoin.miter : StrokeJoin.round
      ..strokeCap =
          isSharpen || progress == 0 ? StrokeCap.butt : StrokeCap.round
      ..strokeWidth = weight;

    _drawBox(canvas, size);
    if (progress > 0) {
      _drawCheck(canvas, size, paint);
    } else {
      _drawDash(canvas, size, paint);
    }
  }
}
