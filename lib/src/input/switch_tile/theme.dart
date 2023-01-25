import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/switch/style.dart';
import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant switch tile should look like.
class SwitchTileTheme extends InheritedTheme {
  /// The properties for descendant [SwitchTile]s
  final SwitchTileThemeData data;

  /// Creates a theme that controls
  /// how descendant switch should look like.
  const SwitchTileTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [SwitchTileTheme] that controls the style of descendant widgets,
  /// and merges in the current [SwitchTileTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    SwitchStyle? switchStyle,
    ButtonStyle? buttonStyle,
    SwitchTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = SwitchTileTheme.of(context);
        return SwitchTileTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                controlAffinity: controlAffinity,
                switchStyle: switchStyle,
                buttonStyle: buttonStyle,
              ),
          child: child,
        );
      },
    );
  }

  /// The [SwitchTileTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// SwitchTileThemeData theme = SwitchTileTheme.of(context);
  /// ```
  static SwitchTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<SwitchTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<SwitchTileThemeData>();
    final defaultTheme = SwitchTileThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SwitchTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(SwitchTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SwitchTileThemeData>('data', data));
  }
}
