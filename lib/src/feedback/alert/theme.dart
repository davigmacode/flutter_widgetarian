import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant alerts should look like.
class AlertTheme extends InheritedTheme {
  /// The properties for descendant [Alert]s
  final AlertThemeData data;

  /// Creates a theme that controls
  /// how descendant alerts should look like.
  const AlertTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [AlertTheme] that controls the style of
  /// descendant widgets, and merges in the current [AlertTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    AlertStyle? style,
    AlertStyleByVariant? variantStyle,
    AlertStyleByVariant? dangerStyle,
    AlertStyleByVariant? warningStyle,
    AlertStyleByVariant? successStyle,
    AlertStyleByVariant? infoStyle,
    AlertThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = AlertTheme.of(context);
        return AlertTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                style: style,
                dangerStyle: dangerStyle,
                warningStyle: warningStyle,
                successStyle: successStyle,
                infoStyle: infoStyle,
              ),
          child: child,
        );
      },
    );
  }

  /// The [AlertTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// AlertThemeData theme = AlertTheme.of(context);
  /// ```
  static AlertThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<AlertTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<AlertThemeData>();
    final defaultTheme = AlertThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AlertTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AlertTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AlertThemeData>('data', data));
  }
}
