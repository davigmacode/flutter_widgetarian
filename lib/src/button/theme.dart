import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_data.dart';
import 'theme_preset.dart';

/// A Widget that controls how descendant buttons should look like.
class ButtonTheme extends InheritedTheme {
  /// The properties for descendant [Button]s
  final ButtonThemeData data;

  /// Creates a theme that controls
  /// how descendant buttons should look like.
  const ButtonTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [ButtonTheme] that controls the style of
  /// descendant widgets, and merges in the current [ButtonTheme], if any.
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
    ButtonThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ButtonTheme.of(context);
        return ButtonTheme(
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

  /// The [ButtonTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ButtonThemeData theme = ButtonTheme.of(context);
  /// ```
  static ButtonThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<ButtonTheme>();
    if (parentTheme != null) return parentTheme.data;

    final globalTheme = Theme.of(context).extension<ButtonThemeData>();
    final defaultTheme = ButtonThemePreset.defaults(context);
    return defaultTheme.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ButtonTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ButtonTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ButtonThemeData>('data', data));
  }
}
