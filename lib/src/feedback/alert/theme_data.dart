import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Map of [AlertStyle] by [AlertVariant] as key
typedef AlertStyleByVariant = Map<AlertVariant, AlertStyle?>;

extension AlertStyleByVariantUtils on AlertStyleByVariant {
  /// Creates a copy of this [AlertStyleByVariant] but with
  /// the given fields replaced with the new values.
  AlertStyleByVariant merge(AlertStyleByVariant? variants) {
    final entries = AlertVariant.values.map((key) {
      final other = variants?[key];
      final style = this[key]?.merge(other) ?? other;
      return MapEntry(key, style);
    });
    return Map.fromEntries(entries);
  }

  /// Linearly interpolate with another [AlertStyleByVariant] object.
  AlertStyleByVariant lerp(AlertStyleByVariant? other, double t) {
    final entries = AlertVariant.values.map((key) {
      final style = AlertStyle.lerp(this[key], other?[key], t);
      return MapEntry(key, style);
    });
    return Map.fromEntries(entries);
  }
}

/// Defines the visual properties of [Alert].
///
/// Descendant widgets obtain the current [AlertThemeData] object using
/// `AlertTheme.of(context)`. Instances of [AlertThemeData]
/// can be customized with [AlertThemeData.copyWith] or [AlertThemeData.merge].
@immutable
class AlertThemeData extends ThemeExtension<AlertThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of alert widget.
  final Curve curve;

  /// The duration over which to animate the parameters of alert widget.
  final Duration duration;

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyle style;

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyleByVariant variantStyle;

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyleByVariant dangerStyle;

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyleByVariant warningStyle;

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyleByVariant successStyle;

  /// The [AlertStyle] to be applied to the alert widget
  final AlertStyleByVariant infoStyle;

  /// Creates a theme data that can be used for [AlertTheme].
  const AlertThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    this.variantStyle = const {},
    this.dangerStyle = const {},
    this.warningStyle = const {},
    this.successStyle = const {},
    this.infoStyle = const {},
  });

  /// Create a [AlertThemeData] with some reasonable default values.
  static const fallback = AlertThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: AlertStyle.defaults,
    variantStyle: {},
    dangerStyle: {},
    warningStyle: {},
    successStyle: {},
    infoStyle: {},
  );

  /// Creates a [AlertThemeData] from another one that probably null.
  AlertThemeData.from([AlertThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        style = other?.style ?? fallback.style,
        variantStyle = other?.variantStyle ?? fallback.variantStyle,
        dangerStyle = other?.dangerStyle ?? fallback.dangerStyle,
        warningStyle = other?.warningStyle ?? fallback.warningStyle,
        successStyle = other?.successStyle ?? fallback.successStyle,
        infoStyle = other?.infoStyle ?? fallback.infoStyle;

  /// A [AlertThemeData] with default values.
  factory AlertThemeData.defaults(BuildContext context) =>
      AlertThemeDefaults(context);

  /// Creates a copy of this [AlertThemeData] but with
  /// the given fields replaced with the new values.
  @override
  AlertThemeData copyWith({
    Curve? curve,
    Duration? duration,
    AlertStyle? style,
    AlertStyleByVariant? variantStyle,
    AlertStyleByVariant? dangerStyle,
    AlertStyleByVariant? warningStyle,
    AlertStyleByVariant? successStyle,
    AlertStyleByVariant? infoStyle,
  }) {
    return AlertThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
      dangerStyle: this.dangerStyle.merge(dangerStyle),
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
      dangerStyle: other.dangerStyle,
      warningStyle: other.warningStyle,
      successStyle: other.successStyle,
      infoStyle: other.infoStyle,
    );
  }

  @override
  AlertThemeData lerp(ThemeExtension<AlertThemeData>? other, double t) {
    if (other is! AlertThemeData) return this;
    return AlertThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      style: AlertStyle.lerp(style, other.style, t) ?? style,
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
        'dangerStyle': dangerStyle,
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
