import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant checkbox should look like.
class CheckboxTheme extends InheritedTheme {
  /// The properties for descendant [Checkbox]s
  final CheckboxThemeData data;

  /// Creates a theme that controls
  /// how descendant checkbox should look like.
  const CheckboxTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [CheckboxTheme] that controls the style of descendant widgets,
  /// and merges in the current [CheckboxTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    CheckboxStyle? style,
    CheckboxThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = CheckboxTheme.of(context);
        return CheckboxTheme(
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

  /// The [CheckboxTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// CheckboxThemeData theme = CheckboxTheme.of(context);
  /// ```
  static CheckboxThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<CheckboxTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<CheckboxThemeData>();
    final defaultTheme = CheckboxThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return CheckboxTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(CheckboxTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CheckboxThemeData>('data', data));
  }
}
