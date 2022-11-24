import 'package:flutter/widgets.dart';
import 'style.dart';

class SheetTheme extends InheritedTheme {
  /// Creates a theme that controls
  /// how descendant [Button]s should look like.
  const SheetTheme({
    Key? key,
    required Widget child,
    required this.style,
  }) : super(key: key, child: child);

  final SheetStyle style;

  /// The [style] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Defaults to [ThemeData.checkboxTheme]
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// SheetStyle style = SheetTheme.of(context);
  /// ```
  static SheetStyle of(BuildContext context) {
    final SheetTheme? theme =
        context.dependOnInheritedWidgetOfExactType<SheetTheme>();
    return theme?.style ?? const SheetStyle().flat();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SheetTheme(style: style, child: child);
  }

  @override
  bool updateShouldNotify(SheetTheme oldWidget) {
    return oldWidget.style != style;
  }
}
