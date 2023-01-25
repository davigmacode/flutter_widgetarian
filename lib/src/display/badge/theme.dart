import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant badges should look like.
class BadgeTheme extends InheritedTheme {
  /// The properties for descendant [Badge]s
  final BadgeThemeData data;

  /// Creates a theme that controls
  /// how descendant [BadgeTheme]s should look like.
  const BadgeTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [BadgeTheme] that controls the style of
  /// descendant widgets, and merges in the current [BadgeTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    AlignmentGeometry? alignment,
    Offset? offset,
    BadgeStyle? style,
    BadgeThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = BadgeTheme.of(context);
        return BadgeTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                alignment: alignment,
                offset: offset,
                style: style,
              ),
          child: child,
        );
      },
    );
  }

  /// The [BadgeTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// BadgeThemeData theme = BadgeTheme.of(context);
  /// ```
  static BadgeThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<BadgeTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<BadgeThemeData>();
    final defaultTheme = BadgeThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return BadgeTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(BadgeTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BadgeThemeData>('data', data));
  }
}
