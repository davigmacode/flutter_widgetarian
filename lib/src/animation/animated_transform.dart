import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class AnimatedTransform extends ImplicitlyAnimatedWidget {
  const AnimatedTransform({
    Key? key,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.linear,
    this.rotation,
    this.flipX = false,
    this.flipY = false,
    required this.child,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  final Widget child;
  final double? rotation;
  final bool flipX;
  final bool flipY;

  @override
  AnimatedTransformState createState() => AnimatedTransformState();
}

class AnimatedTransformState
    extends AnimatedWidgetBaseState<AnimatedTransform> {
  ColorTween? color;
  Tween<double?>? size;
  Tween<double>? rotateZ;
  Tween<double>? rotateX;
  Tween<double>? rotateY;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    rotateZ = visitor(
      rotateZ,
      widget.rotation ?? 0.0,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    rotateX = visitor(
      rotateX,
      widget.flipY ? math.pi : 0.0,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    rotateY = visitor(
      rotateY,
      widget.flipX ? math.pi : 0.0,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateX(rotateX?.evaluate(animation) ?? 0)
        ..rotateY(rotateY?.evaluate(animation) ?? 0)
        ..rotateZ(radians(rotateZ?.evaluate(animation) ?? 0)),
      child: widget.child,
    );
  }
}

double radians(double degrees) {
  return degrees * math.pi / 180;
}
