import 'package:flutter/widgets.dart';
import 'animated_icon_theme.dart';
import 'animated_transform.dart';

class AnimatedIcon extends StatelessWidget {
  const AnimatedIcon({
    Key? key,
    this.color,
    this.opacity,
    this.size,
    this.scale,
    this.rotation,
    this.flipX = false,
    this.flipY = false,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.linear,
    required this.icon,
  }) : super(key: key);

  final Duration duration;

  final Curve curve;

  final IconData icon;

  /// Color of the checkmark.
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to [Colors.black87].
  final Color? color;

  /// Color of the checkmark.
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to [Colors.black87].
  final double? opacity;

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
  final double? scale;

  /// Stroke width of the checkmark.
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to 1.0.
  final double? rotation;

  final bool flipX;

  final bool flipY;

  @override
  Widget build(BuildContext context) {
    return AnimatedTransform(
      flipX: flipX,
      flipY: flipY,
      scale: scale,
      rotation: rotation,
      duration: duration,
      curve: curve,
      child: AnimatedSwitcher(
        duration: duration,
        switchInCurve: curve,
        switchOutCurve: curve,
        child: AnimatedIconTheme(
          duration: duration,
          curve: curve,
          data: IconThemeData(
            color: color,
            opacity: opacity,
            size: size,
          ),
          child: Icon(icon, key: ValueKey(icon.toString())),
        ),
      ),
    );
  }
}
