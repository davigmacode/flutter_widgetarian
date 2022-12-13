import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';

class TileTheme extends InheritedTheme {
  /// The [TileStyle] to apply
  final TileStyle style;

  /// Creates a theme that controls
  /// how descendant [TileTheme]s should look like.
  const TileTheme({
    Key? key,
    required this.style,
    required Widget child,
  }) : super(key: key, child: child);

  /// A const-constructable [style] that provides fallback values.
  ///
  /// Returned from [of] when the given [BuildContext] doesn't have an enclosing default text style.
  ///
  /// This constructor creates a [TileTheme] with an invalid [child], which
  /// means the constructed value cannot be incorporated into the tree.
  const TileTheme.fallback({Key? key})
      : style = TileStyle.defaults,
        super(key: key, child: const NullWidget());

  /// Creates an [TileTheme] that controls the style of
  /// descendant widgets, and merges in the current [TileTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    required TileStyle style,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = TileTheme.of(context);
        return TileTheme(
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
  /// Defaults to [ThemeData.tileTheme]
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// TileStyle style = TileTheme.of(context).style;
  /// ```
  static TileTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TileTheme>() ??
        const TileTheme.fallback();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TileTheme(style: style, child: child);
  }

  @override
  bool updateShouldNotify(TileTheme oldWidget) {
    return oldWidget.style != style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    style.debugFillProperties(properties);
  }
}
