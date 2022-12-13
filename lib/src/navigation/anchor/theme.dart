import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';

class AnchorTheme extends InheritedTheme {
  /// The [AnchorStyle] to apply
  final AnchorStyle style;

  /// Creates a theme that controls
  /// how descendant [Anchor]s should look like.
  const AnchorTheme({
    Key? key,
    required Widget child,
    required this.style,
  }) : super(key: key, child: child);

  /// A const-constructable [style] that provides fallback values.
  ///
  /// Returned from [of] when the given [BuildContext] doesn't have an enclosing default text style.
  ///
  /// This constructor creates a [AnchorTheme] with an invalid [child], which
  /// means the constructed value cannot be incorporated into the tree.
  AnchorTheme.fallback({Key? key})
      : style = AnchorStyle.defaults,
        super(key: key, child: const NullWidget());

  /// Creates an [AnchorTheme] that controls the style of
  /// descendant widgets, and merges in the current [AnchorTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    required AnchorStyle style,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = AnchorTheme.of(context);
        return AnchorTheme(
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
  /// Defaults to [ThemeData.anchorTheme]
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// AnchorStyle style = AnchorTheme.of(context).style;
  /// ```
  static AnchorTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AnchorTheme>() ??
        AnchorTheme.fallback();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AnchorTheme(style: style, child: child);
  }

  @override
  bool updateShouldNotify(AnchorTheme oldWidget) {
    return oldWidget.style != style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    style.debugFillProperties(properties);
  }
}
