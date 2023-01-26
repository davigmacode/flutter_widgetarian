import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';
import 'tween.dart';

/// A Widget that controls how descendant tile should look like.
///
/// Descendant widgets obtain the current [ListTileThemeData] object using `ListTileTheme.of(context)`.
/// Instances of [ListTileThemeData] can be customized with [ListTileThemeData.copyWith] or [ListTileThemeData.merge].
class ListTileTheme extends InheritedTheme {
  /// The [ListTileThemeData] to be applied to descendant [ListTile]s
  final ListTileThemeData data;

  /// Creates a theme that controls
  /// how descendant [ListTileTheme]s should look like.
  const ListTileTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [ListTileTheme] that controls the style of
  /// descendant widgets, and merges in the current [ListTileTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    ListTileStyle? style,
    ListTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ListTileTheme.of(context);
        return ListTileTheme(
          key: key,
          data: parent.merge(data),
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
  /// ListTileThemeData data = ListTileTheme.of(context);
  /// ```
  static ListTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<ListTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<ListTileThemeData>();
    final defaultTheme = ListTileThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ListTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ListTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    data.debugFillProperties(properties);
  }
}

/// A widget that animates the [ListTileThemeData] implicitly.
class AnimatedListTileTheme extends ImplicitlyAnimatedWidget {
  /// The [ListTileThemeData] to be applied to descendant [ListTile]s
  final ListTileThemeData data;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Creates a widget that animates the [data] implicitly.
  const AnimatedListTileTheme({
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
  AnimatedWidgetBaseState<AnimatedListTileTheme> createState() =>
      _AnimatedIconThemeState();
}

class _AnimatedIconThemeState
    extends AnimatedWidgetBaseState<AnimatedListTileTheme> {
  ListTileThemeDataTween? _dataTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _dataTween = visitor(
      _dataTween,
      widget.data,
      (dynamic value) => ListTileThemeDataTween(begin: value),
    ) as ListTileThemeDataTween?;
  }

  @override
  Widget build(BuildContext context) {
    return ListTileTheme.merge(
      data: _dataTween?.evaluate(animation),
      child: widget.child,
    );
  }
}
