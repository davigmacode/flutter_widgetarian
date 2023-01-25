import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/checkbox/style.dart';
import 'package:widgetarian/src/button/style.dart';
import 'theme_data.dart';

/// A Widget that controls how descendant checkbox tile should look like.
class CheckboxTileTheme extends InheritedTheme {
  /// The properties for descendant [CheckboxTile]s
  final CheckboxTileThemeData data;

  /// Creates a theme that controls
  /// how descendant checkbox should look like.
  const CheckboxTileTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [CheckboxTileTheme] that controls the style of descendant widgets,
  /// and merges in the current [CheckboxTileTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    CheckboxStyle? checkboxStyle,
    ButtonStyle? buttonStyle,
    CheckboxTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = CheckboxTileTheme.of(context);
        return CheckboxTileTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                controlAffinity: controlAffinity,
                checkboxStyle: checkboxStyle,
                buttonStyle: buttonStyle,
              ),
          child: child,
        );
      },
    );
  }

  /// The [CheckboxTileTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// CheckboxTileThemeData theme = CheckboxTileTheme.of(context);
  /// ```
  static CheckboxTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<CheckboxTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<CheckboxTileThemeData>();
    final defaultTheme = CheckboxTileThemeData.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return CheckboxTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(CheckboxTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CheckboxTileThemeData>('data', data));
  }
}
