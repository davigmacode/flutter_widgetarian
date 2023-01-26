import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';
import 'tween.dart';

/// A Widget that controls how descendant tile should look like.
///
/// Descendant widgets obtain the current [TileStyle] object using `TileTheme.of(context)`.
/// Instances of [TileStyle] can be customized with [TileStyle.copyWith] or [TileStyle.merge].
class TileTheme extends InheritedTheme {
  /// The [TileThemeData] to be applied to descendant [Tile]s
  final TileThemeData data;

  /// Creates a theme that controls
  /// how descendant [TileTheme]s should look like.
  const TileTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [TileTheme] that controls the style of
  /// descendant widgets, and merges in the current [TileTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    TileStyle? style,
    TileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = TileTheme.of(context);
        return TileTheme(
          key: key,
          data: parent.merge(data).copyWith(style: style),
          child: child,
        );
      },
    );
  }

  /// The [TileThemeData] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// TileThemeData theme = TileTheme.of(context);
  /// ```
  static TileThemeData of(BuildContext context) {
    final parentTheme = context.dependOnInheritedWidgetOfExactType<TileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<TileThemeData>();
    final defaultTheme = TileThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(TileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}

/// A widget that animates the [TileThemeData] implicitly.
class AnimatedTileTheme extends ImplicitlyAnimatedWidget {
  /// The [TileThemeData] to be applied to descendant [Tile]s
  final TileThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Creates a widget that animates the [data] implicitly.
  const AnimatedTileTheme({
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
  AnimatedWidgetBaseState<AnimatedTileTheme> createState() =>
      _AnimatedIconThemeState();
}

class _AnimatedIconThemeState
    extends AnimatedWidgetBaseState<AnimatedTileTheme> {
  TileThemeDataTween? _dataTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _dataTween = visitor(
      _dataTween,
      widget.data,
      (dynamic value) => TileThemeDataTween(begin: value),
    ) as TileThemeDataTween?;
  }

  @override
  Widget build(BuildContext context) {
    return TileTheme.merge(
      data: _dataTween?.evaluate(animation),
      child: widget.child,
    );
  }
}
