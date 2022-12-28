import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/theme.dart';
import 'style.dart';

/// Defines the visual properties of [ToggleIcon].
///
/// Descendant widgets obtain the current [ToggleIconThemeData] object using
/// `ToggleIconTheme.of(context)`. Instances of [ToggleIconThemeData]
/// can be customized with [ToggleIconThemeData.copyWith] or [ToggleIconThemeData.merge].
@immutable
class ToggleIconThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of [ToggleIcon] widget.
  final Curve curve;

  /// The duration over which to animate the parameters of [ToggleIcon] widget.
  final Duration duration;

  /// The [ToggleIconStyle] to be applied to the [ToggleIcon] widget
  final ToggleIconStyle style;

  /// Creates a theme data that can be used for [ToggleIconTheme].
  const ToggleIconThemeData({
    required this.curve,
    required this.duration,
    required this.style,
  });

  /// An [ToggleIconThemeData] with some reasonable default values.
  static final defaults = ToggleIconThemeData(
    curve: Curves.linear,
    duration: const Duration(milliseconds: 200),
    style: DrivenToggleIconStyle.fade(),
  );

  /// Creates a copy of this [ToggleIconThemeData] but with
  /// the given fields replaced with the new values.
  ToggleIconThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ToggleIconStyle? style,
  }) {
    return ToggleIconThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [ToggleIconThemeData] but with
  /// the given fields replaced with the new values.
  ToggleIconThemeData merge(ToggleIconThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      style: other.style,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'style': style,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ToggleIconThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant toggle icon should look like.
class ToggleIconTheme extends InheritedTheme {
  /// The properties for descendant [ToggleIcon]s
  final ToggleIconThemeData data;

  /// Creates a theme that controls
  /// how descendant toggle icon should look like.
  const ToggleIconTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [ToggleIconTheme] that controls the style of
  /// descendant widgets, and merges in the current [ToggleIconTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ToggleIconStyle? style,
    ToggleIconThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ToggleIconTheme.of(context);
        return ToggleIconTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                style: style,
              ),
          child: child,
        );
      },
    );
  }

  /// The [ToggleIconTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ToggleIconThemeData theme = ToggleIconTheme.of(context);
  /// ```
  static ToggleIconThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<ToggleIconTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<ToggleIconThemeData?>();
    return ToggleIconThemeData.defaults
        .copyWith(
          style: ToggleIconStyle.defaults.copyWith(
            backColor: appTheme.iconTheme.color,
            color: appTheme.colorScheme.primary,
          ),
        )
        .merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ToggleIconTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ToggleIconTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ToggleIconThemeData>('data', data));
  }
}
