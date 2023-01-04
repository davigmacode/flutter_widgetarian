import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/display/chip/fallback.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/theme.dart';
import 'style.dart';

/// Defines the visual properties of [Chip].
///
/// Descendant widgets obtain the current [ChipThemeData] object using
/// `ChipTheme.of(context)`. Instances of [ChipThemeData]
/// can be customized with [ChipThemeData.copyWith] or [ChipThemeData.merge].
@immutable
class ChipThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of [Chip] widget.
  final Curve curve;

  /// The duration over which to animate the parameters of [Chip] widget.
  final Duration duration;

  /// The [ChipStyle] to be applied to the [Chip] widget
  final ChipStyle style;

  /// The [ChipStyle] that provides fallback values.
  final ChipStyleFallback fallback;

  /// Creates a theme data that can be used for [ChipTheme].
  const ChipThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    required this.fallback,
  });

  /// An [ChipThemeData] with some reasonable default values.
  static final defaults = ChipThemeData(
    curve: Curves.linear,
    duration: const Duration(milliseconds: 200),
    style: DrivenChipStyle.tonal(),
    fallback: const ChipStyleFallback(),
  );

  /// Creates a copy of this [ChipThemeData] but with
  /// the given fields replaced with the new values.
  ChipThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ChipStyle? style,
    ChipStyleFallback? fallback,
  }) {
    return ChipThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
      fallback: this.fallback.merge(fallback),
    );
  }

  /// Creates a copy of this [ChipThemeData] but with
  /// the given fields replaced with the new values.
  ChipThemeData merge(ChipThemeData? other) {
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
    return other is ChipThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant [Chip]s should look like.
class ChipTheme extends InheritedTheme {
  /// The properties for descendant [Chip]s
  final ChipThemeData data;

  /// Creates a theme that controls
  /// how descendant [Chip]s should look like.
  const ChipTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [ChipTheme] that controls the style of
  /// descendant widgets, and merges in the current [ChipTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ChipStyle? style,
    ChipStyleFallback? fallback,
    ChipThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ChipTheme.of(context);
        return ChipTheme(
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

  /// The [ChipTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ChipThemeData theme = ChipTheme.of(context);
  /// ```
  static ChipThemeData of(BuildContext context) {
    final parentTheme = context.dependOnInheritedWidgetOfExactType<ChipTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<ChipThemeData?>();
    return ChipThemeData.defaults
        .copyWith(
          fallback: ChipStyleFallback(
            base: DrivenChipStyle(
              foregroundStyle: appTheme.textTheme.labelLarge,
              foregroundColor: appTheme.colorScheme.onSurface,
              borderColor: appTheme.colorScheme.outline,
              shadowColor: appTheme.colorScheme.shadow,
              overlayColor: appTheme.brightness.isDark ? Colors.white : null,
            ),
            filled: DrivenChipStyle(
              foregroundColor: appTheme.colorScheme.onSurface,
              backgroundColor: appTheme.unselectedWidgetColor,
              selectedStyle: ChipStyle(
                backgroundColor: appTheme.brightness.isLight
                    ? appTheme.colorScheme.primary
                    : appTheme.colorScheme.inversePrimary,
              ),
            ),
            outlined: DrivenChipStyle(
              backgroundColor: appTheme.colorScheme.surface,
              selectedStyle: ChipStyle(
                foregroundColor: appTheme.colorScheme.primary,
                borderColor: appTheme.colorScheme.primary,
              ),
            ),
          ),
        )
        .merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ChipTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ChipTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ChipThemeData>('data', data));
  }
}
