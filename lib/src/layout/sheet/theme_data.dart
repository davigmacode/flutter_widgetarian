import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'style.dart';
import 'types.dart';

/// Map of [SheetStyle] by [SheetVariant] as key
typedef SheetStyleByVariant = Map<SheetVariant, SheetStyle?>;

extension SheetStyleByVariantUtils on SheetStyleByVariant {
  /// Creates a copy of this [SheetStyleByVariant] but with
  /// the given fields replaced with the new values.
  SheetStyleByVariant merge(SheetStyleByVariant? variants) {
    final entries = SheetVariant.values.map((key) {
      final other = variants?[key];
      final style = this[key]?.merge(other) ?? other;
      return MapEntry(key, style);
    });
    return Map.fromEntries(entries);
  }

  /// Linearly interpolate with another [SheetStyleByVariant] object.
  SheetStyleByVariant lerp(SheetStyleByVariant? other, double t) {
    final entries = SheetVariant.values.map((key) {
      final style = SheetStyle.lerp(this[key], other?[key], t);
      return MapEntry(key, style);
    });
    return Map.fromEntries(entries);
  }
}

/// Defines the visual properties of [Sheet].
///
/// Descendant widgets obtain the current [SheetThemeData] object using
/// `SheetTheme.of(context)`. Instances of [SheetThemeData]
/// can be customized with [SheetThemeData.copyWith] or [SheetThemeData.merge].
@immutable
class SheetThemeData extends ThemeExtension<SheetThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of sheet widget.
  final Curve curve;

  /// The duration over which to animate the parameters of sheet widget.
  final Duration duration;

  /// The [SheetStyle] to be applied to the sheet widget
  final SheetStyle style;

  /// The [SheetStyle] to be applied to the variant sheet widget
  final SheetStyleByVariant variantStyle;

  /// The [SheetStyle] to be applied to the sheet widget with danger severity
  final SheetStyleByVariant dangerStyle;

  /// The [SheetStyle] to be applied to the sheet widget with warning severity
  final SheetStyleByVariant warningStyle;

  /// The [SheetStyle] to be applied to the sheet widget with success severity
  final SheetStyleByVariant successStyle;

  /// The [SheetStyle] to be applied to the sheet widget with info severity
  final SheetStyleByVariant infoStyle;

  /// The [SheetStyle] to be applied to the sheet widget with severity
  Map<SheetSeverity, SheetStyleByVariant> get severityStyle => {
        SheetSeverity.danger: dangerStyle,
        SheetSeverity.warning: warningStyle,
        SheetSeverity.success: successStyle,
        SheetSeverity.info: infoStyle,
      };

  /// Creates a theme data that can be used for [SheetTheme].
  const SheetThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    this.variantStyle = const {},
    this.dangerStyle = const {},
    this.warningStyle = const {},
    this.successStyle = const {},
    this.infoStyle = const {},
  });

  /// Create a [SheetThemeData] with some reasonable default values.
  const SheetThemeData.defaults()
      : curve = Curves.linear,
        duration = const Duration(milliseconds: 200),
        style = SheetStyle.defaults,
        variantStyle = const {},
        dangerStyle = const {},
        warningStyle = const {},
        successStyle = const {},
        infoStyle = const {};

  /// Return [SheetStyle] that depends on [variant] and [severity]
  SheetStyle resolve({SheetVariant? variant, SheetSeverity? severity}) {
    return SheetStyle.from(style)
        .merge(variantStyle[variant])
        .merge(severityStyle[severity]?[variant]);
  }

  /// Creates a copy of this [SheetThemeData] but with
  /// the given fields replaced with the new values.
  @override
  SheetThemeData copyWith({
    Curve? curve,
    Duration? duration,
    SheetStyle? style,
    SheetStyleByVariant? variantStyle,
    SheetStyleByVariant? dangerStyle,
    SheetStyleByVariant? warningStyle,
    SheetStyleByVariant? successStyle,
    SheetStyleByVariant? infoStyle,
  }) {
    return SheetThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
      variantStyle: this.variantStyle.merge(variantStyle),
      dangerStyle: this.dangerStyle.merge(dangerStyle),
      warningStyle: this.warningStyle.merge(warningStyle),
      successStyle: this.successStyle.merge(successStyle),
      infoStyle: this.infoStyle.merge(infoStyle),
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
      variantStyle: other.variantStyle,
      dangerStyle: other.dangerStyle,
      warningStyle: other.warningStyle,
      successStyle: other.successStyle,
      infoStyle: other.infoStyle,
    );
  }

  @override
  SheetThemeData lerp(ThemeExtension<SheetThemeData>? other, double t) {
    if (other is! SheetThemeData) return this;
    return SheetThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      style: SheetStyle.lerp(style, other.style, t) ?? style,
      variantStyle: variantStyle.lerp(other.variantStyle, t),
      dangerStyle: dangerStyle.lerp(other.dangerStyle, t),
      warningStyle: warningStyle.lerp(other.warningStyle, t),
      successStyle: successStyle.lerp(other.successStyle, t),
      infoStyle: infoStyle.lerp(other.infoStyle, t),
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'style': style,
        'variantStyle': variantStyle,
        'dangerStyle': dangerStyle,
        'warningStyle': warningStyle,
        'successStyle': successStyle,
        'infoStyle': infoStyle,
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
