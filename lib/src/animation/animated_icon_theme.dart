import 'package:flutter/widgets.dart';
import 'package:widgetarian/tween.dart';

class AnimatedIconTheme extends ImplicitlyAnimatedWidget {
  /// Creates a widget that animates the icon theme data implicitly.
  const AnimatedIconTheme({
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

  /// The widget below this widget in the tree.
  final Widget child;

  /// The color, opacity, and size to use for icons in this subtree.
  final IconThemeData data;

  @override
  AnimatedWidgetBaseState<AnimatedIconTheme> createState() =>
      _AnimatedIconThemeState();
}

class _AnimatedIconThemeState
    extends AnimatedWidgetBaseState<AnimatedIconTheme> {
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
