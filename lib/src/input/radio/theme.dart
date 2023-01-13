import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';

/// Defines the visual properties of [Radio].
///
/// Descendant widgets obtain the current [RadioThemeData] object using
/// `RadioTheme.of(context)`. Instances of [RadioThemeData]
/// can be customized with [RadioThemeData.copyWith] or [RadioThemeData.merge].
@immutable
class RadioThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of radio widget.
  final Curve curve;

  /// The duration over which to animate the parameters of radio widget.
  final Duration duration;

  /// The [RadioStyle] to be applied to the radio widget
  final RadioStyle style;

  /// The [RadioStyle] that provides fallback values.
  final RadioStyle fallback;

  /// Creates a theme data that can be used for [RadioTheme].
  const RadioThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    required this.fallback,
  });

  /// An [RadioThemeData] with some reasonable default values.
  static const defaults = RadioThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: RadioStyle.defaults,
    fallback: RadioStyle(),
  );

  /// Creates a copy of this [RadioThemeData] but with
  /// the given fields replaced with the new values.
  RadioThemeData copyWith({
    Curve? curve,
    Duration? duration,
    RadioStyle? style,
    RadioStyle? fallback,
  }) {
    return RadioThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
      fallback: this.fallback.merge(fallback),
    );
  }

  /// Creates a copy of this [RadioThemeData] but with
  /// the given fields replaced with the new values.
  RadioThemeData merge(RadioThemeData? other) {
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
    return other is RadioThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant radio should look like.
class RadioTheme extends InheritedTheme {
  /// The properties for descendant [Radio]s
  final RadioThemeData data;

  /// Creates a theme that controls
  /// how descendant radio should look like.
  const RadioTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [RadioTheme] that controls the style of descendant widgets,
  /// and merges in the current [RadioTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    RadioStyle? style,
    RadioStyle? fallback,
    RadioThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = RadioTheme.of(context);
        return RadioTheme(
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

  /// The [RadioTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// RadioThemeData theme = RadioTheme.of(context);
  /// ```
  static RadioThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<RadioTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<RadioThemeData?>();
    return RadioThemeData.defaults
        .copyWith(
          fallback: DrivenRadioStyle(
            borderColor: appTheme.colorScheme.outline,
            thumbColor: Colors.transparent,
            selectedStyle: RadioStyle(
              borderColor: appTheme.brightness.isLight
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
    return RadioTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(RadioTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<RadioThemeData>('data', data));
  }
}
