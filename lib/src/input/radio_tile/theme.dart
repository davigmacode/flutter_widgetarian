import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/radio/style.dart';
import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant radio tile should look like.
class RadioTileTheme extends InheritedTheme {
  /// The properties for descendant [RadioTile]s
  final RadioTileThemeData data;

  /// Creates a theme that controls
  /// how descendant radio should look like.
  const RadioTileTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [RadioTileTheme] that controls the style of descendant widgets,
  /// and merges in the current [RadioTileTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    RadioStyle? radioStyle,
    ButtonStyle? buttonStyle,
    RadioTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = RadioTileTheme.of(context);
        return RadioTileTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                controlAffinity: controlAffinity,
                radioStyle: radioStyle,
                buttonStyle: buttonStyle,
              ),
          child: child,
        );
      },
    );
  }

  /// The [RadioTileTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// RadioTileThemeData theme = RadioTileTheme.of(context);
  /// ```
  static RadioTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<RadioTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<RadioTileThemeData>();
    final defaultTheme = RadioTileThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return RadioTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(RadioTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<RadioTileThemeData>('data', data));
  }
}
