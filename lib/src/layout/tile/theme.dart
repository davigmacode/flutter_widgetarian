import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';

class ListTileTheme extends InheritedTheme {
  /// The [ListTileStyle] to apply
  final ListTileStyle style;

  /// Creates a theme that controls
  /// how descendant [ListTileTheme]s should look like.
  const ListTileTheme({
    Key? key,
    required this.style,
    required Widget child,
  }) : super(key: key, child: child);

  /// A const-constructable [style] that provides fallback values.
  ///
  /// Returned from [of] when the given [BuildContext] doesn't have an enclosing default text style.
  ///
  /// This constructor creates a [ListTileTheme] with an invalid [child], which
  /// means the constructed value cannot be incorporated into the tree.
  const ListTileTheme.fallback({Key? key})
      : style = const ListTileStyle.fallback(),
        super(key: key, child: const NullWidget());

  /// Creates an [ListTileTheme] that controls the style of
  /// descendant widgets, and merges in the current [ListTileTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    required ListTileStyle style,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ListTileTheme.of(context);
        return ListTileTheme(
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
  /// Defaults to [ThemeData.listTileTheme]
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ListTileStyle style = ListTileTheme.of(context).style;
  /// ```
  static ListTileTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ListTileTheme>() ??
        const ListTileTheme.fallback();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ListTileTheme(style: style, child: child);
  }

  @override
  bool updateShouldNotify(ListTileTheme oldWidget) {
    return oldWidget.style != style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    style.debugFillProperties(properties);
  }
}
