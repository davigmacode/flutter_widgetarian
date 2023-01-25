import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant [Chip]s should look like.
class ChipTheme extends InheritedTheme {
  /// The properties for descendant [Chip]s
  final ChipThemeData data;

  /// Creates a theme that controls
  /// how descendant [Chip]s should look like.
  const ChipTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [ChipTheme] that controls the style of
  /// descendant widgets, and merges in the current [ChipTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ChipStyle? style,
    ChipStyleByVariant? variantStyle,
    ChipStyleByVariant? dangerStyle,
    ChipStyleByVariant? warningStyle,
    ChipStyleByVariant? successStyle,
    ChipStyleByVariant? infoStyle,
    ChipThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ChipTheme.of(context);
        return ChipTheme(
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

  /// The [ChipTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ChipThemeData theme = ChipTheme.of(context);
  /// ```
  static ChipThemeData of(BuildContext context) {
    final parentTheme = context.dependOnInheritedWidgetOfExactType<ChipTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<ChipThemeData>();
    final defaultTheme = ChipThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ChipTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ChipTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ChipThemeData>('data', data));
  }
}
