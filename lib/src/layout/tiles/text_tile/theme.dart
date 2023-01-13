import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'tween.dart';

/// A Widget that controls how descendant tile should look like.
///
/// Descendant widgets obtain the current [TextTileStyle] object using `TextTileTheme.of(context)`.
/// Instances of [TextTileStyle] can be customized with [TextTileStyle.copyWith] or [TextTileStyle.merge].
class TextTileTheme extends InheritedTheme {
  /// The [TextTileStyle] to be applied to descendant [TextTile]s
  final TextTileStyle style;

  /// Creates a theme that controls
  /// how descendant [TextTileTheme]s should look like.
  const TextTileTheme({
    Key? key,
    required this.style,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [TextTileTheme] that controls the style of
  /// descendant widgets, and merges in the current [TextTileTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    TextTileStyle? style,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = TextTileTheme.of(context);
        return TextTileTheme(
          key: key,
          style: parent.merge(style),
          child: child,
        );
      },
    );
  }

  /// The [style] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// TextTileStyle style = TextTileTheme.of(context);
  /// ```
  static TextTileStyle of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<TextTileTheme>();
    if (parentTheme != null) return parentTheme.style;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<TextTileStyle?>();
    return TextTileStyle.defaults.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TextTileTheme(style: style, child: child);
  }

  @override
  bool updateShouldNotify(TextTileTheme oldWidget) {
    return oldWidget.style != style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    style.debugFillProperties(properties);
  }
}

/// A widget that animates the [TextTileStyle] implicitly.
class AnimatedTextTileTheme extends ImplicitlyAnimatedWidget {
  /// The [TextTileStyle] to be applied to descendant [TextTile]s
  final TextTileStyle style;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Creates a widget that animates the [style] implicitly.
  const AnimatedTextTileTheme({
    Key? key,
    Curve curve = Curves.linear,
    Duration duration = const Duration(milliseconds: 200),
    VoidCallback? onEnd,
    required this.style,
    required this.child,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
          onEnd: onEnd,
        );

  @override
  AnimatedWidgetBaseState<AnimatedTextTileTheme> createState() =>
      _AnimatedIconThemeState();
}

class _AnimatedIconThemeState
    extends AnimatedWidgetBaseState<AnimatedTextTileTheme> {
  TextTileStyleTween? _styleTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _styleTween = visitor(
      _styleTween,
      widget.style,
      (dynamic value) => TextTileStyleTween(begin: value),
    ) as TextTileStyleTween?;
  }

  @override
  Widget build(BuildContext context) {
    return TextTileTheme.merge(
      style: _styleTween?.evaluate(animation),
      child: widget.child,
    );
  }
}
