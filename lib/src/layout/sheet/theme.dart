import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/theme.dart';
import 'style.dart';

/// Defines the visual properties of [Sheet].
///
/// Descendant widgets obtain the current [SheetThemeData] object using
/// `SheetTheme.of(context)`. Instances of [SheetThemeData]
/// can be customized with [SheetThemeData.copyWith] or [SheetThemeData.merge].
@immutable
class SheetThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of sheet widget.
  final Curve curve;

  /// The duration over which to animate the parameters of sheet widget.
  final Duration duration;

  /// The [SheetStyle] to be applied to the sheet widget
  final SheetStyle style;

  /// The [SheetStyle] that provides fallback values.
  final SheetStyle fallback;

  /// Creates a theme data that can be used for [SheetTheme].
  const SheetThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    required this.fallback,
  });

  /// An [SheetThemeData] with some reasonable default values.
  static const defaults = SheetThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: SheetStyle.defaults,
    fallback: SheetStyle(),
  );

  /// Creates a copy of this [SheetThemeData] but with
  /// the given fields replaced with the new values.
  SheetThemeData copyWith({
    Curve? curve,
    Duration? duration,
    SheetStyle? style,
    SheetStyle? fallback,
  }) {
    return SheetThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
      fallback: this.fallback.merge(fallback),
    );
  }

  /// Creates a copy of this [SheetThemeData] but with
  /// the given fields replaced with the new values.
  SheetThemeData merge(SheetThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      style: other.style,
      fallback: other.fallback,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'style': style,
        'fallback': fallback,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is SheetThemeData && mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => Object.hashAll(toMap().values);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    toMap().entries.forEach((el) {
      properties.add(DiagnosticsProperty(el.key, el.value, defaultValue: null));
    });
  }
}

/// A Widget that controls how descendant [Sheet]s should look like.
class SheetTheme extends InheritedTheme {
  /// The properties for descendant [Sheet]s
  final SheetThemeData data;

  /// Creates a theme that controls
  /// how descendant [Sheet]s should look like.
  const SheetTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [SheetTheme] that controls the style of
  /// descendant widgets, and merges in the current [SheetTheme], if any.
  ///
  /// The [style] and [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    SheetStyle? style,
    SheetStyle? fallback,
    SheetThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = SheetTheme.of(context);
        return SheetTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                style: style,
                fallback: fallback,
              ),
          child: child,
        );
      },
    );
  }

  /// The [style] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// SheetThemeData theme = SheetTheme.of(context);
  /// ```
  static SheetThemeData of(BuildContext context) {
    final sheetTheme = context.dependOnInheritedWidgetOfExactType<SheetTheme>();
    if (sheetTheme != null) return sheetTheme.data;

    final theme = Theme.of(context);
    final globalTheme = theme.extension<SheetThemeData?>();
    return SheetThemeData.defaults
        .copyWith(
          fallback: SheetStyle(
            foregroundColor: theme.colorScheme.onSurface,
            backgroundColor: theme.unselectedWidgetColor,
            borderColor: theme.colorScheme.outline,
            shadowColor: theme.colorScheme.shadow,
          ),
        )
        .merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SheetTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(SheetTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SheetThemeData>('data', data));
  }
}
