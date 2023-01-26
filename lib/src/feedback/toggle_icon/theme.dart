import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant toggle icon should look like.
class ToggleIconTheme extends InheritedTheme {
  /// The properties for descendant [ToggleIcon]s
  final ToggleIconThemeData data;

  /// Creates a theme that controls
  /// how descendant toggle icon should look like.
  const ToggleIconTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [ToggleIconTheme] that controls the style of
  /// descendant widgets, and merges in the current [ToggleIconTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ToggleIconStyle? style,
    ToggleIconThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ToggleIconTheme.of(context);
        return ToggleIconTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                style: style,
              ),
          child: child,
        );
      },
    );
  }

  /// The [ToggleIconTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ToggleIconThemeData theme = ToggleIconTheme.of(context);
  /// ```
  static ToggleIconThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<ToggleIconTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<ToggleIconThemeData>();
    final defaultTheme = ToggleIconThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ToggleIconTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ToggleIconTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ToggleIconThemeData>('data', data));
  }
}
