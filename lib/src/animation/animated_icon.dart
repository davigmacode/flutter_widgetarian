import 'package:flutter/widgets.dart';
import 'animated_transform.dart';

class AnimatedIcon extends ImplicitlyAnimatedWidget {
  const AnimatedIcon({
    Key? key,
    required this.icon,
    this.color,
    this.size,
    this.rotation,
    this.flipX = false,
    this.flipY = false,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.linear,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  final IconData icon;

  /// Color of the checkmark.
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to [Colors.black87].
  final Color? color;

  /// Expand to parent if the value is [Size.zero].
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to parent size.
  final double? size;

  /// Stroke width of the checkmark.
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to 1.0.
  final double? rotation;

  final bool flipX;

  final bool flipY;

  @override
  AnimatedIconState createState() => AnimatedIconState();
}

class AnimatedIconState extends AnimatedWidgetBaseState<AnimatedIcon> {
  ColorTween? color;
  Tween<double?>? size;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    color = visitor(
      color,
      widget.color,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    size = visitor(
      size,
      widget.size,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTransform(
      flipX: widget.flipX,
      flipY: widget.flipY,
      rotation: widget.rotation,
      duration: widget.duration,
      curve: widget.curve,
      child: AnimatedSwitcher(
        duration: widget.duration,
        switchInCurve: widget.curve,
        switchOutCurve: widget.curve,
        child: Icon(
          widget.icon,
          key: ValueKey(widget.icon.toString()),
          size: size?.evaluate(animation),
          color: color?.evaluate(animation),
        ),
      ),
    );
  }
}
