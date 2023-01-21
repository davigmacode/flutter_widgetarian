import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';
import 'theme_preset.dart';

/// A Widget that controls how descendant [Sheet]s should look like.
class SheetTheme extends InheritedTheme {
  /// The properties for descendant [Sheet]s
  final SheetThemeData data;

  /// Creates a theme that controls
  /// how descendant [Sheet]s should look like.
  const SheetTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [SheetTheme] that controls the style of
  /// descendant widgets, and merges in the current [SheetTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    SheetStyle? style,
    SheetStyleByVariant? variantStyle,
    SheetStyleByVariant? dangerStyle,
    SheetStyleByVariant? warningStyle,
    SheetStyleByVariant? successStyle,
    SheetStyleByVariant? infoStyle,
    SheetThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = SheetTheme.of(context);
        return SheetTheme(
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

  /// The [data] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// SheetThemeData theme = SheetTheme.of(context);
  /// ```
  static SheetThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<SheetTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<SheetThemeData>();
    final defaultTheme = SheetThemePreset.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SheetTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(SheetTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SheetThemeData>('data', data));
  }
}
