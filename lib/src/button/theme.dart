import 'package:flutter/widgets.dart';
import 'style.dart';

class ButtonTheme extends InheritedTheme {
  /// Creates a theme that controls
  /// how descendant [Button]s should look like.
  const ButtonTheme({
    Key? key,
    required Widget child,
    required this.style,
  }) : super(key: key, child: child);

  final ButtonStyle style;

  /// The [style] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Defaults to [ThemeData.checkboxTheme]
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ButtonStyle style = ButtonTheme.of(context);
  /// ```
  static ButtonStyle of(BuildContext context) {
    final ButtonTheme? theme =
        context.dependOnInheritedWidgetOfExactType<ButtonTheme>();
    return theme?.style ?? ButtonStyle.flat();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ButtonTheme(style: style, child: child);
  }

  @override
  bool updateShouldNotify(ButtonTheme oldWidget) {
    return oldWidget.style != style;
  }
}
