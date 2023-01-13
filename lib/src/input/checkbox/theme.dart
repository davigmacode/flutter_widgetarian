import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';

/// Defines the visual properties of [Checkbox].
///
/// Descendant widgets obtain the current [CheckboxThemeData] object using
/// `CheckboxTheme.of(context)`. Instances of [CheckboxThemeData]
/// can be customized with [CheckboxThemeData.copyWith] or [CheckboxThemeData.merge].
@immutable
class CheckboxThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of checkbox widget.
  final Curve curve;

  /// The duration over which to animate the parameters of checkbox widget.
  final Duration duration;

  /// The [CheckboxStyle] to be applied to the checkbox widget
  final CheckboxStyle style;

  /// The [CheckboxStyle] that provides fallback values.
  final CheckboxStyle fallback;

  /// Creates a theme data that can be used for [CheckboxTheme].
  const CheckboxThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    required this.fallback,
  });

  /// An [CheckboxThemeData] with some reasonable default values.
  static const defaults = CheckboxThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: CheckboxStyle.defaults,
    fallback: CheckboxStyle(),
  );

  /// Creates a copy of this [CheckboxThemeData] but with
  /// the given fields replaced with the new values.
  CheckboxThemeData copyWith({
    Curve? curve,
    Duration? duration,
    CheckboxStyle? style,
    CheckboxStyle? fallback,
  }) {
    return CheckboxThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
      fallback: this.fallback.merge(fallback),
    );
  }

  /// Creates a copy of this [CheckboxThemeData] but with
  /// the given fields replaced with the new values.
  CheckboxThemeData merge(CheckboxThemeData? other) {
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
    return other is CheckboxThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant checkbox should look like.
class CheckboxTheme extends InheritedTheme {
  /// The properties for descendant [Checkbox]s
  final CheckboxThemeData data;

  /// Creates a theme that controls
  /// how descendant checkbox should look like.
  const CheckboxTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [CheckboxTheme] that controls the style of descendant widgets,
  /// and merges in the current [CheckboxTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    CheckboxStyle? style,
    CheckboxStyle? fallback,
    CheckboxThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = CheckboxTheme.of(context);
        return CheckboxTheme(
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

  /// The [CheckboxTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// CheckboxThemeData theme = CheckboxTheme.of(context);
  /// ```
  static CheckboxThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<CheckboxTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<CheckboxThemeData?>();
    return CheckboxThemeData.defaults
        .copyWith(
          fallback: DrivenCheckboxStyle(
            borderColor: appTheme.colorScheme.outline,
            selectedStyle: CheckboxStyle(
              backgroundColor: appTheme.brightness.isLight
                  ? appTheme.colorScheme.primary
                  : appTheme.colorScheme.inversePrimary,
            ),
            indeterminateStyle: CheckboxStyle(
              backgroundColor: appTheme.brightness.isLight
                  ? appTheme.colorScheme.primary
                  : appTheme.colorScheme.inversePrimary,
            ),
          ),
        )
        .merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return CheckboxTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(CheckboxTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CheckboxThemeData>('data', data));
  }
}
