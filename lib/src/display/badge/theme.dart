import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';

class BadgeTheme extends InheritedTheme {
  /// The [BadgeStyle] to apply
  final BadgeStyle style;

  /// Creates a theme that controls
  /// how descendant [BadgeTheme]s should look like.
  const BadgeTheme({
    Key? key,
    required this.style,
    required Widget child,
  }) : super(key: key, child: child);

  /// A const-constructable [style] that provides fallback values.
  ///
  /// Returned from [of] when the given [BuildContext] doesn't have an enclosing default text style.
  ///
  /// This constructor creates a [BadgeTheme] with an invalid [child], which
  /// means the constructed value cannot be incorporated into the tree.
  const BadgeTheme.fallback({Key? key})
      : style = BadgeStyle.defaults,
        super(key: key, child: const NullWidget());

  /// Creates an [BadgeTheme] that controls the style of
  /// descendant widgets, and merges in the current [BadgeTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    required BadgeStyle style,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = BadgeTheme.of(context);
        return BadgeTheme(
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
  /// Defaults to [ThemeData.badgeTheme]
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// BadgeStyle style = BadgeTheme.of(context).style;
  /// ```
  static BadgeTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BadgeTheme>() ??
        const BadgeTheme.fallback();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return BadgeTheme(style: style, child: child);
  }

  @override
  bool updateShouldNotify(BadgeTheme oldWidget) {
    return oldWidget.style != style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    style.debugFillProperties(properties);
  }
}
