import 'package:flutter/widgets.dart';

class ShapeBorderPaint extends StatelessWidget {
  const ShapeBorderPaint({
    Key? key,
    required this.shape,
    this.textDirection,
    this.isForeground = true,
    this.child,
  }) : super(key: key);

  final Widget? child;
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
