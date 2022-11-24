import 'package:flutter/widgets.dart';
import 'package:widgetarian/tween.dart';

class AnimatedIconTheme extends StatelessWidget {
  const AnimatedIconTheme({
    Key? key,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 200),
    this.data,
    required this.child,
  }) : super(key: key);

  /// The curve to apply when animating the parameters of this widget.
  final Curve curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration duration;

  /// The color, opacity, and size to use for icons in this subtree.
  final IconThemeData? data;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _AnimatedIconTheme(
      curve: curve,
      duration: duration,
      data: IconTheme.of(context).merge(data),
      child: child,
    );
  }
}

class _AnimatedIconTheme extends ImplicitlyAnimatedWidget {
  /// Creates a widget that animates the icon theme data implicitly.
  const _AnimatedIconTheme({
    Key? key,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 200),
    VoidCallback? onEnd,
    required this.data,
    required this.child,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  final IconThemeData data;
  final Widget child;

  @override
  AnimatedWidgetBaseState<_AnimatedIconTheme> createState() =>
      _AnimatedIconThemeState();
}

class _AnimatedIconThemeState
    extends AnimatedWidgetBaseState<_AnimatedIconTheme> {
  IconThemeDataTween? _dataTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _dataTween = visitor(
      _dataTween,
      widget.data,
      (dynamic value) => IconThemeDataTween(begin: value as IconThemeData),
    ) as IconThemeDataTween?;
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: _dataTween!.evaluate(animation),
      child: widget.child,
    );
  }
}
