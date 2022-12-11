import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';

class OverlayTheme extends InheritedTheme {
  /// The [OverlayStyle] to apply
  final OverlayStyle style;

  /// Creates a theme that controls
  /// how descendant [Overlay]s should look like.
  const OverlayTheme({
    Key? key,
    required this.style,
    required Widget child,
  }) : super(key: key, child: child);

  /// A const-constructable [style] that provides fallback values.
  ///
  /// Returned from [of] when the given [BuildContext] doesn't have an enclosing default text style.
  ///
  /// This constructor creates a [OverlayTheme] with an invalid [child], which
  /// means the constructed value cannot be incorporated into the tree.
  const OverlayTheme.fallback({Key? key})
      : style = const OverlayStyle.fallback(),
        super(key: key, child: const NullWidget());

  /// Creates an [OverlayTheme] that controls the style of
  /// descendant widgets, and merges in the current [OverlayTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    required OverlayStyle style,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = OverlayTheme.of(context);
        return OverlayTheme(
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
  /// Defaults to [ThemeData.overlayTheme]
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// OverlayStyle style = OverlayTheme.of(context).style;
  /// ```
  static OverlayTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<OverlayTheme>() ??
        const OverlayTheme.fallback();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return OverlayTheme(style: style, child: child);
  }

  @override
  bool updateShouldNotify(OverlayTheme oldWidget) {
    return oldWidget.style != style;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    style.debugFillProperties(properties);
  }
}
