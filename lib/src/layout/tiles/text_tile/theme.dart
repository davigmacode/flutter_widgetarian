import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';
import 'tween.dart';

/// A Widget that controls how descendant tile should look like.
///
/// Descendant widgets obtain the current [TextTileThemeData] object using `TextTileTheme.of(context)`.
/// Instances of [TextTileThemeData] can be customized with [TextTileThemeData.copyWith] or [TextTileThemeData.merge].
class TextTileTheme extends InheritedTheme {
  /// The [TextTileThemeData] to be applied to descendant [TextTile]s
  final TextTileThemeData data;

  /// Creates a theme that controls
  /// how descendant [TextTileTheme]s should look like.
  const TextTileTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [TextTileTheme] that controls the style of
  /// descendant widgets, and merges in the current [TextTileTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    TextTileStyle? style,
    TextTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = TextTileTheme.of(context);
        return TextTileTheme(
          key: key,
          data: parent.merge(data).copyWith(style: style),
          child: child,
        );
      },
    );
  }

  /// The [data] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// TextTileThemeData style = TextTileTheme.of(context);
  /// ```
  static TextTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<TextTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<TextTileThemeData>();
    final defaultTheme = TextTileThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TextTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(TextTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}

/// A widget that animates the [TextTileThemeData] implicitly.
class AnimatedTextTileTheme extends ImplicitlyAnimatedWidget {
  /// The [TextTileThemeData] to be applied to descendant [TextTile]s
  final TextTileThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Creates a widget that animates the [data] implicitly.
  const AnimatedTextTileTheme({
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

  @override
  AnimatedWidgetBaseState<AnimatedTextTileTheme> createState() =>
      _AnimatedIconThemeState();
}

class _AnimatedIconThemeState
    extends AnimatedWidgetBaseState<AnimatedTextTileTheme> {
  TextTileThemeDataTween? _dataTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _dataTween = visitor(
      _dataTween,
      widget.data,
      (dynamic value) => TextTileThemeDataTween(begin: value),
    ) as TextTileThemeDataTween?;
  }

  @override
  Widget build(BuildContext context) {
    return TextTileTheme.merge(
      data: _dataTween?.evaluate(animation),
      child: widget.child,
    );
  }
}
