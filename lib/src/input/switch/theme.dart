import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/theme.dart';
import 'style.dart';

/// Defines the visual properties of [Switch].
///
/// Descendant widgets obtain the current [SwitchThemeData] object using
/// `SwitchTheme.of(context)`. Instances of [SwitchThemeData]
/// can be customized with [SwitchThemeData.copyWith] or [SwitchThemeData.merge].
@immutable
class SwitchThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of [Switch] widget.
  final Curve curve;

  /// The duration over which to animate the parameters of [Switch] widget.
  final Duration duration;

  /// The [SwitchStyle] to be applied to the [Switch] widget
  final SwitchStyle style;

  /// The [SwitchStyle] that provides fallback values.
  final SwitchStyle fallback;

  /// Creates a theme data that can be used for [SwitchTheme].
  const SwitchThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    required this.fallback,
  });

  /// An [SwitchThemeData] with some reasonable default values.
  static const defaults = SwitchThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: SwitchStyle.defaults,
    fallback: SwitchStyle(),
  );

  /// Creates a copy of this [SwitchThemeData] but with
  /// the given fields replaced with the new values.
  SwitchThemeData copyWith({
    Curve? curve,
    Duration? duration,
    SwitchStyle? style,
    SwitchStyle? fallback,
  }) {
    return SwitchThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
      fallback: this.fallback.merge(fallback),
    );
  }

  /// Creates a copy of this [SwitchThemeData] but with
  /// the given fields replaced with the new values.
  SwitchThemeData merge(SwitchThemeData? other) {
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
    return other is SwitchThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant [Switch] should look like.
class SwitchTheme extends InheritedTheme {
  /// The properties for descendant [Switch]s
  final SwitchThemeData data;

  /// Creates a theme that controls
  /// how descendant switch should look like.
  const SwitchTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [SwitchTheme] that controls the style of descendant widgets,
  /// and merges in the current [SwitchTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    SwitchStyle? style,
    SwitchStyle? fallback,
    SwitchThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = SwitchTheme.of(context);
        return SwitchTheme(
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

  /// The [SwitchTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// SwitchThemeData theme = SwitchTheme.of(context);
  /// ```
  static SwitchThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<SwitchTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<SwitchThemeData?>();
    return SwitchThemeData.defaults
        .copyWith(
          fallback: DrivenSwitchStyle(
            trackColor: appTheme.unselectedWidgetColor,
            thumbColor: Colors.white,
            selectedStyle: SwitchStyle(
              trackColor: appTheme.brightness.isLight
                  ? appTheme.colorScheme.primary
                  : appTheme.colorScheme.inversePrimary,
              thumbColor: appTheme.brightness.isLight
                  ? appTheme.colorScheme.primary
                  : appTheme.colorScheme.inversePrimary,
            ),
          ),
        )
        .merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SwitchTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(SwitchTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SwitchThemeData>('data', data));
  }
}
