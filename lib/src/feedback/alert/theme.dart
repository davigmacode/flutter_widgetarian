import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/theme/extension/severity.dart';
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

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyle errorStyle;

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyle warningStyle;

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyle successStyle;

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyle infoStyle;

  /// Creates a theme data that can be used for [AlertTheme].
  const AlertThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    required this.errorStyle,
    required this.warningStyle,
    required this.successStyle,
    required this.infoStyle,
  });

  /// An [AlertThemeData] with some reasonable default values.
  static const defaults = AlertThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: AlertStyle.defaults,
    errorStyle: AlertStyle(),
    warningStyle: AlertStyle(),
    successStyle: AlertStyle(),
    infoStyle: AlertStyle(),
  );

  /// Creates a copy of this [AlertThemeData] but with
  /// the given fields replaced with the new values.
  AlertThemeData copyWith({
    Curve? curve,
    Duration? duration,
    AlertStyle? style,
    AlertStyle? errorStyle,
    AlertStyle? warningStyle,
    AlertStyle? successStyle,
    AlertStyle? infoStyle,
  }) {
    return AlertThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
      errorStyle: this.errorStyle.merge(errorStyle),
      warningStyle: this.warningStyle.merge(warningStyle),
      successStyle: this.successStyle.merge(successStyle),
      infoStyle: this.infoStyle.merge(infoStyle),
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
      errorStyle: other.errorStyle,
      warningStyle: other.warningStyle,
      successStyle: other.successStyle,
      infoStyle: other.infoStyle,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'style': style,
        'errorStyle': errorStyle,
        'warningStyle': warningStyle,
        'successStyle': successStyle,
        'infoStyle': infoStyle,
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
    AlertStyle? errorStyle,
    AlertStyle? warningStyle,
    AlertStyle? successStyle,
    AlertStyle? infoStyle,
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
                errorStyle: errorStyle,
                warningStyle: warningStyle,
                successStyle: successStyle,
                infoStyle: infoStyle,
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

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<AlertThemeData?>();
    final severityTheme = SeverityTheme.of(context);
    return AlertThemeData.defaults
        .copyWith(
          style: const AlertStyle.tonal(padding: EdgeInsets.all(20)),
          errorStyle: AlertStyle(
            foregroundColor: severityTheme.danger,
            backgroundColor: severityTheme.danger,
          ),
          warningStyle: AlertStyle(
            foregroundColor: severityTheme.warning,
            backgroundColor: severityTheme.warning,
          ),
          successStyle: AlertStyle(
            foregroundColor: severityTheme.success,
            backgroundColor: severityTheme.success,
          ),
          infoStyle: AlertStyle(
            foregroundColor: severityTheme.info,
            backgroundColor: severityTheme.info,
          ),
        )
        .merge(globalTheme);
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
