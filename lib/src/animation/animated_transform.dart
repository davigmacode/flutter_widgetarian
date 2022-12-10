import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class AnimatedTransform extends ImplicitlyAnimatedWidget {
  const AnimatedTransform({
    Key? key,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.linear,
    this.offset,
    this.scale,
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
  final Offset? offset;
  final double? scale;
  final double? rotation;
  final bool flipX;
  final bool flipY;

  @override
  AnimatedTransformState createState() => AnimatedTransformState();
}

class AnimatedTransformState
    extends AnimatedWidgetBaseState<AnimatedTransform> {
  Tween<Offset>? tweenOffset;
  Tween<double>? tweenScale;
  Tween<double>? tweenRotateX;
  Tween<double>? tweenRotateY;
  Tween<double>? tweenRotateZ;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    tweenOffset = visitor(
      tweenOffset,
      widget.offset ?? Offset.zero,
      (dynamic value) => Tween<Offset>(begin: value),
    ) as Tween<Offset>?;

    tweenScale = visitor(
      tweenScale,
      widget.scale ?? 1.0,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    tweenRotateX = visitor(
      tweenRotateX,
      widget.flipY ? math.pi : 0.0,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    tweenRotateY = visitor(
      tweenRotateY,
      widget.flipX ? math.pi : 0.0,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    tweenRotateZ = visitor(
      tweenRotateZ,
      widget.rotation ?? 0.0,
      (dynamic value) => Tween<double>(begin: value),
    ) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    final transform = Matrix4.identity();
    final offset = tweenOffset?.evaluate(animation);
    final scale = tweenScale?.evaluate(animation);
    final rotateX = tweenRotateX?.evaluate(animation);
    final rotateY = tweenRotateY?.evaluate(animation);
    final rotateZ = tweenRotateZ?.evaluate(animation);

    if (offset != null) {
      transform.translate(offset.dx, offset.dy);
    }

    if (scale != null) {
      transform.scale(scale);
    }

    if (rotateX != null) {
      transform.rotateX(rotateX);
    }

    if (rotateY != null) {
      transform.rotateY(rotateY);
    }

    if (rotateZ != null) {
      transform.rotateZ(radians(rotateZ));
    }

    return Transform(
      alignment: Alignment.center,
      transform: transform,
      child: widget.child,
    );
  }
}

double radians(double degrees) {
  return degrees * math.pi / 180;
}
