import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';
import 'theme_preset.dart';

/// A Widget that controls how descendant [Switch] should look like.
class SwitchTheme extends InheritedTheme {
  /// The properties for descendant [Switch]s
  final SwitchThemeData data;

  /// Creates a theme that controls
  /// how descendant switch should look like.
  const SwitchTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [SwitchTheme] that controls the style of descendant widgets,
  /// and merges in the current [SwitchTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    SwitchStyle? style,
    SwitchThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = SwitchTheme.of(context);
        return SwitchTheme(
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

  /// The [SwitchTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// SwitchThemeData theme = SwitchTheme.of(context);
  /// ```
  static SwitchThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<SwitchTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<SwitchThemeData>();
    final defaultTheme = SwitchThemePreset.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SwitchTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(SwitchTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SwitchThemeData>('data', data));
  }
}
