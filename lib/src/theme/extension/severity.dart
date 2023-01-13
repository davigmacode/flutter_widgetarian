import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/theme.dart';

/// Defines the visual properties of [Alert].
///
/// Descendant widgets obtain the current [SeverityThemeData] object using
/// `AlertTheme.of(context)`. Instances of [SeverityThemeData]
/// can be customized with [SeverityThemeData.copyWith] or [SeverityThemeData.merge].
@immutable
class SeverityThemeData with Diagnosticable {
  /// The [AlertStyle] to be applied to the alert widget
  final Color danger;

  /// The [AlertStyle] to be applied to the alert widget
  final Color warning;

  /// The [AlertStyle] to be applied to the alert widget
  final Color success;

  /// The [AlertStyle] to be applied to the alert widget
  final Color info;

  /// Creates a theme data that can be used for [SeverityTheme].
  const SeverityThemeData({
    required this.danger,
    required this.warning,
    required this.success,
    required this.info,
  });

  /// An [SeverityThemeData] with some reasonable default values.
  static const defaults = SeverityThemeData(
    danger: Color(0xFFF44336),
    warning: Color(0xFFFF9800),
    success: Color(0xFF2196F3),
    info: Color(0xFF4CAF50),
  );

  /// Creates a copy of this [SeverityThemeData] but with
  /// the given fields replaced with the new values.
  SeverityThemeData copyWith({
    Color? danger,
    Color? warning,
    Color? success,
    Color? info,
  }) {
    return SeverityThemeData(
      danger: danger ?? this.danger,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      info: info ?? this.info,
    );
  }

  /// Creates a copy of this [SeverityThemeData] but with
  /// the given fields replaced with the new values.
  SeverityThemeData merge(SeverityThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      danger: other.danger,
      warning: other.warning,
      success: other.success,
      info: other.info,
    );
  }

  Map<String, dynamic> toMap() => {
        'danger': danger,
        'warning': warning,
        'success': success,
        'info': info,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is SeverityThemeData && mapEquals(other.toMap(), toMap());
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
class SeverityTheme extends InheritedTheme {
  /// The properties for descendant [Alert]s
  final SeverityThemeData data;

  /// Creates a theme that controls
  /// how descendant alerts should look like.
  const SeverityTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [SeverityTheme] that controls the style of
  /// descendant widgets, and merges in the current [SeverityTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Color? danger,
    Color? warning,
    Color? success,
    Color? info,
    SeverityThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = SeverityTheme.of(context);
        return SeverityTheme(
          key: key,
          data: parent.merge(data).copyWith(
                danger: danger,
                warning: warning,
                success: success,
                info: info,
              ),
          child: child,
        );
      },
    );
  }

  /// The [SeverityTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// AlertThemeData theme = AlertTheme.of(context);
  /// ```
  static SeverityThemeData of(BuildContext context) {
    final sheetTheme =
        context.dependOnInheritedWidgetOfExactType<SeverityTheme>();
    if (sheetTheme != null) return sheetTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<SeverityThemeData?>();
    return SeverityThemeData.defaults.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SeverityTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(SeverityTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SeverityThemeData>('data', data));
  }
}
