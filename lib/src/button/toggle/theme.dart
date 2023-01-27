import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant buttons should look like.
class ToggleButtonTheme extends InheritedTheme {
  /// The properties for descendant [Button]s
  final ToggleButtonThemeData data;

  /// Creates a theme that controls
  /// how descendant buttons should look like.
  const ToggleButtonTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [ToggleButtonTheme] that controls the style of
  /// descendant widgets, and merges in the current [ToggleButtonTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ButtonStyle? style,
    ButtonStyleByVariant? variantStyle,
    ButtonStyleByVariant? dangerStyle,
    ButtonStyleByVariant? warningStyle,
    ButtonStyleByVariant? successStyle,
    ButtonStyleByVariant? infoStyle,
    ToggleButtonThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ToggleButtonTheme.of(context);
        return ToggleButtonTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                style: style,
                variantStyle: variantStyle,
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

  /// The [ToggleButtonTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ToggleButtonThemeData theme = ToggleButtonTheme.of(context);
  /// ```
  static ToggleButtonThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<ToggleButtonTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<ToggleButtonThemeData>();
    final defaultTheme = ToggleButtonThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ToggleButtonTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ToggleButtonTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ToggleButtonThemeData>('data', data));
  }
}
