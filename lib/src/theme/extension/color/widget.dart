import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'data.dart';

/// A Widget that controls how descendant alerts should look like.
class ColorTheme extends InheritedTheme {
  /// The properties for descendant [Alert]s
  final ColorThemeData data;

  /// Creates a theme that controls
  /// how descendant alerts should look like.
  const ColorTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [ColorTheme] that controls the style of
  /// descendant widgets, and merges in the current [ColorTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Color? danger,
    Color? warning,
    Color? success,
    Color? info,
    ColorThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ColorTheme.of(context);
        return ColorTheme(
          key: key,
          data: parent.merge(data).copyWith(
                danger: danger,
                warning: warning,
                success: success,
                info: info,
              ),
          child: child,
        );
      },
    );
  }

  /// The [ColorTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ColorThemeData theme = ColorTheme.of(context);
  /// ```
  static ColorThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<ColorTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<ColorThemeData>();
    final defaultTheme = ColorThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ColorTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ColorTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ColorThemeData>('data', data));
  }
}
