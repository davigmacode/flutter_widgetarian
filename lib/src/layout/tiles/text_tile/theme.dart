import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';

class TextTileTheme extends InheritedTheme {
  /// The [TextTileStyle] to apply
  final TextTileStyle style;

  /// Creates a theme that controls
  /// how descendant [TextTileTheme]s should look like.
  const TextTileTheme({
    Key? key,
    required this.style,
    required Widget child,
  }) : super(key: key, child: child);

  /// A const-constructable [style] that provides fallback values.
  ///
  /// Returned from [of] when the given [BuildContext] doesn't have an enclosing default text style.
  ///
  /// This constructor creates a [TextTileTheme] with an invalid [child], which
  /// means the constructed value cannot be incorporated into the tree.
  const TextTileTheme.fallback({Key? key})
      : style = TextTileStyle.defaults,
        super(key: key, child: const NullWidget());

  /// Creates an [TextTileTheme] that controls the style of
  /// descendant widgets, and merges in the current [TextTileTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    required TextTileStyle style,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = TextTileTheme.of(context);
        return TextTileTheme(
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
  /// Defaults to [ThemeData.textTileTheme]
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// TextTileStyle style = TextTileTheme.of(context).style;
  /// ```
  static TextTileTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TextTileTheme>() ??
        const TextTileTheme.fallback();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return TextTileTheme(style: style, child: child);
  }

  @override
  bool updateShouldNotify(TextTileTheme oldWidget) {
    return oldWidget.style != style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    style.debugFillProperties(properties);
  }
}
