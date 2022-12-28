import 'package:flutter/widgets.dart';
import 'package:widgetarian/tween.dart';

/// A widget that animates the icon theme data implicitly.
class AnimatedIconTheme extends ImplicitlyAnimatedWidget {
  /// The color, opacity, and size to use for icons in this subtree.
  final IconThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Creates an animated icon theme
  const AnimatedIconTheme({
    Key? key,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 200),
    required this.data,
    required this.child,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );

  /// Creates an [AnimatedIconTheme] that controls the style of
  /// descendant widgets, and merges in the current [AnimatedIconTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 200),
    IconThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = IconTheme.of(context);
        return AnimatedIconTheme(
          key: key,
          curve: curve,
          duration: duration,
          data: parent.merge(data),
          child: child,
        );
      },
    );
  }

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
    return IconTheme.merge(
      data: _dataTween!.evaluate(animation),
      child: widget.child,
    );
  }
}
