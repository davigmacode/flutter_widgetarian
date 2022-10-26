import 'package:flutter/widgets.dart';

class Box extends StatelessWidget {
  const Box({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.shape,
    this.border,
    this.borderSide,
    this.borderRadius,
    this.shadowColor = const Color(0xFF000000),
    this.clipBehavior = Clip.antiAlias,
    this.elevation = 0.0,
  }) : super(key: key);

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color shadowColor;
  final double elevation;
  final ShapeBorder? border;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final Clip clipBehavior;

  ShapeBorder get defaultBorder {
    return shape == BoxShape.circle
        ? CircleBorder(
            side: borderSide ?? BorderSide.none,
          )
        : RoundedRectangleBorder(
            side: borderSide ?? BorderSide.none,
            borderRadius: borderRadius ?? BorderRadius.zero,
          );
  }

  @override
  Widget build(BuildContext context) {
    final border = this.border ?? defaultBorder;
    final textDirection = Directionality.maybeOf(context);
    final clipper = ShapeBorderClipper(
      textDirection: textDirection,
      shape: border,
    );

    Widget contents = child;

    if (padding != null) {
      contents = Padding(padding: padding!, child: contents);
    }

    if (width != null || height != null) {
      contents = SizedBox(
        width: width,
        height: height,
        child: contents,
      );
    }

    contents = ShapeBorderPaint(
      textDirection: textDirection,
      shape: border,
      child: contents,
    );

    if (color == null) {
      contents = ClipPath(
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: contents,
      );
    }

    if (shape != null) {
      contents = PhysicalModel(
        color: color!,
        elevation: elevation,
        shadowColor: shadowColor,
        clipBehavior: clipBehavior,
        borderRadius: borderRadius,
        shape: shape!,
        child: contents,
      );
    }

    contents = PhysicalShape(
      color: color!,
      elevation: elevation,
      shadowColor: shadowColor,
      clipBehavior: clipBehavior,
      clipper: clipper,
      child: contents,
    );

    if (margin != null) {
      contents = Padding(padding: margin!, child: contents);
    }

    return contents;
  }
}

class ShapeBorderPaint extends StatelessWidget {
  const ShapeBorderPaint({
    Key? key,
    required this.child,
    required this.shape,
    this.textDirection,
    this.isForeground = true,
  }) : super(key: key);

  final Widget child;
  final ShapeBorder shape;
  final TextDirection? textDirection;
  final bool isForeground;

  @override
  Widget build(BuildContext context) {
    final painter = ShapeBorderPainter(shape, textDirection);
    return CustomPaint(
      painter: isForeground ? null : painter,
      foregroundPainter: isForeground ? painter : null,
      child: child,
    );
  }
}

class ShapeBorderPainter extends CustomPainter {
  ShapeBorderPainter(this.shape, this.textDirection);
  final ShapeBorder shape;
  final TextDirection? textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    shape.paint(canvas, Offset.zero & size, textDirection: textDirection);
  }

  @override
  bool shouldRepaint(ShapeBorderPainter oldDelegate) {
    return oldDelegate.shape != shape;
  }
}
