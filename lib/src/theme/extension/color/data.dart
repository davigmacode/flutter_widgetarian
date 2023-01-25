import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'preset.dart';

/// Descendant widgets obtain the current [ColorThemeData] object using
/// `AlertTheme.of(context)`. Instances of [ColorThemeData]
/// can be customized with [ColorThemeData.copyWith] or [ColorThemeData.merge].
@immutable
class ColorThemeData extends ThemeExtension<ColorThemeData>
    with Diagnosticable {
  /// The [Color] to be applied to the alert widget
  final Color danger;

  /// The [Color] to be applied to the alert widget
  final Color warning;

  /// The [Color] to be applied to the alert widget
  final Color success;

  /// The [Color] to be applied to the alert widget
  final Color info;

  /// A [ColorThemeData] with some reasonable default values.
  static const fallback = ColorThemeData(
    danger: Color(0xFFF44336),
    warning: Color(0xFFFF9800),
    success: Color(0xFF2196F3),
    info: Color(0xFF4CAF50),
  );

  /// Creates a theme data that can be used for [ColorTheme].
  const ColorThemeData({
    required this.danger,
    required this.warning,
    required this.success,
    required this.info,
  });

  /// Creates a [ColorThemeData] from another one that probably null.
  ColorThemeData.from([ColorThemeData? other])
      : danger = other?.danger ?? fallback.danger,
        warning = other?.warning ?? fallback.warning,
        success = other?.success ?? fallback.success,
        info = other?.info ?? fallback.info;

  /// A [ColorThemeData] with default values.
  factory ColorThemeData.defaults(BuildContext context) =>
      ColorThemeDefaults(context);

  /// Creates a copy of this [ColorThemeData] but with
  /// the given fields replaced with the new values.
  @override
  ColorThemeData copyWith({
    Color? danger,
    Color? warning,
    Color? success,
    Color? info,
  }) {
    return ColorThemeData(
      danger: danger ?? this.danger,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      info: info ?? this.info,
    );
  }

  /// Creates a copy of this [ColorThemeData] but with
  /// the given fields replaced with the new values.
  ColorThemeData merge(ColorThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      danger: other.danger,
      warning: other.warning,
      success: other.success,
      info: other.info,
    );
  }

  @override
  ColorThemeData lerp(ThemeExtension<ColorThemeData>? other, double t) {
    if (other is! ColorThemeData) return this;
    return ColorThemeData(
      danger: Color.lerp(danger, other.danger, t) ?? danger,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      success: Color.lerp(success, other.warning, t) ?? warning,
      info: Color.lerp(info, other.warning, t) ?? warning,
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
    return other is ColorThemeData && mapEquals(other.toMap(), toMap());
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
