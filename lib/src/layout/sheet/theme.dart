import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';

class SheetTheme extends InheritedTheme {
  /// The [SheetStyle] to apply
  final SheetStyle style;

  /// Creates a theme that controls
  /// how descendant [Sheet]s should look like.
  const SheetTheme({
    Key? key,
    required Widget child,
    required this.style,
  }) : super(key: key, child: child);

  /// A const-constructable [style] that provides fallback values.
  ///
  /// Returned from [of] when the given [BuildContext] doesn't have an enclosing default text style.
  ///
  /// This constructor creates a [SheetTheme] with an invalid [child], which
  /// means the constructed value cannot be incorporated into the tree.
  const SheetTheme.fallback({Key? key})
      : style = const SheetStyle.fallback(),
        super(key: key, child: const NullWidget());

  /// Creates an [SheetTheme] that controls the style of
  /// descendant widgets, and merges in the current [SheetTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    required SheetStyle style,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = SheetTheme.of(context);
        return SheetTheme(
          key: key,
          style: parent.style.merge(style),
          child: child,
        );
      },
    );
  }

  /// The [style] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Defaults to [ThemeData.sheetTheme]
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// SheetStyle style = SheetTheme.of(context).style;
  /// ```
  static SheetTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SheetTheme>() ??
        const SheetTheme.fallback();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SheetTheme(style: style, child: child);
  }

  @override
  bool updateShouldNotify(SheetTheme oldWidget) {
    return oldWidget.style != style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    style.debugFillProperties(properties);
  }
}
