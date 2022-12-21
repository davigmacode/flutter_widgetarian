import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/theme.dart';
import 'style.dart';

/// Defines the visual properties of [Alert].
///
/// Descendant widgets obtain the current [AlertThemeData] object using
/// `AlertTheme.of(context)`. Instances of [AlertThemeData]
/// can be customized with [AlertThemeData.copyWith] or [AlertThemeData.merge].
@immutable
class AlertThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of alert widget.
  final Curve curve;

  /// The duration over which to animate the parameters of alert widget.
  final Duration duration;

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyle style;

  /// Creates a theme data that can be used for [AlertTheme].
  const AlertThemeData({
    required this.curve,
    required this.duration,
    required this.style,
  });

  /// An [AlertThemeData] with some reasonable default values.
  static const defaults = AlertThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: AlertStyle.defaults,
  );

  /// Creates a copy of this [AlertThemeData] but with
  /// the given fields replaced with the new values.
  AlertThemeData copyWith({
    Curve? curve,
    Duration? duration,
    AlertStyle? style,
  }) {
    return AlertThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [AlertThemeData] but with
  /// the given fields replaced with the new values.
  AlertThemeData merge(AlertThemeData? other) {
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
    return other is AlertThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant alerts should look like.
class AlertTheme extends InheritedTheme {
  /// The properties for descendant [Alert]s
  final AlertThemeData data;

  /// Creates a theme that controls
  /// how descendant alerts should look like.
  const AlertTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [AlertTheme] that controls the style of
  /// descendant widgets, and merges in the current [AlertTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    AlertStyle? style,
    AlertThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = AlertTheme.of(context);
        return AlertTheme(
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

  /// The [AlertTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// AlertThemeData theme = AlertTheme.of(context);
  /// ```
  static AlertThemeData of(BuildContext context) {
    final sheetTheme = context.dependOnInheritedWidgetOfExactType<AlertTheme>();
    if (sheetTheme != null) return sheetTheme.data;

    final theme = Theme.of(context);
    final globalTheme = theme.extension<AlertThemeData?>();
    return AlertThemeData.defaults.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AlertTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AlertTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AlertThemeData>('data', data));
  }
}
