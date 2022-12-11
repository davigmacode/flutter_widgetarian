import 'package:flutter/widgets.dart';

class ShapeBorderPaint extends StatelessWidget {
  const ShapeBorderPaint({
    Key? key,
    this.textDirection,
    this.isForeground = true,
    this.inflate,
    required this.shape,
    this.child,
  }) : super(key: key);

  final TextDirection? textDirection;
  final bool isForeground;
  final double? inflate;
  final OutlinedBorder shape;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final painter = ShapeBorderPainter(shape, textDirection, inflate);
    return CustomPaint(
      painter: isForeground ? null : painter,
      foregroundPainter: isForeground ? painter : null,
      child: child,
    );
  }
}

class ShapeBorderPainter extends CustomPainter {
  ShapeBorderPainter(this.shape, this.textDirection, this.inflate);
  final OutlinedBorder shape;
  final TextDirection? textDirection;
  final double? inflate;

  double get defaultInflate => shape.side.width / 5;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    shape.paint(
      canvas,
      rect.inflate(inflate ?? defaultInflate),
      textDirection: textDirection,
    );
  }

  @override
  bool shouldRepaint(ShapeBorderPainter oldDelegate) {
    return oldDelegate.shape != shape;
  }
}
