import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'package:widgetarian/src/button/style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [Button].
///
/// Descendant widgets obtain the current [ToggleButtonThemeData] object using
/// `ToggleButtonTheme.of(context)`. Instances of [ToggleButtonThemeData]
/// can be customized with [ToggleButtonThemeData.copyWith] or [ToggleButtonThemeData.merge].
@immutable
class ToggleButtonThemeData extends ThemeExtension<ToggleButtonThemeData>
    with Diagnosticable {
  /// The curve to apply when animating the parameters of avatar widget.
  final Curve curve;

  /// The duration over which to animate the parameters of button widget.
  final Duration duration;

  /// The [ButtonStyle] to be applied to the button widget
  final ButtonStyle style;

  /// The [ButtonStyle] to be applied to the variant sheet widget
  final ButtonStyleByVariant variantStyle;

  /// The [ButtonStyle] to be applied to the sheet widget with danger severity
  final ButtonStyleByVariant dangerStyle;

  /// The [ButtonStyle] to be applied to the sheet widget with warning severity
  final ButtonStyleByVariant warningStyle;

  /// The [ButtonStyle] to be applied to the sheet widget with success severity
  final ButtonStyleByVariant successStyle;

  /// The [ButtonStyle] to be applied to the sheet widget with info severity
  final ButtonStyleByVariant infoStyle;

  /// The [ButtonStyle] to be applied to the sheet widget with severity
  Map<ButtonSeverity, ButtonStyleByVariant> get severityStyle => {
        ButtonSeverity.danger: dangerStyle,
        ButtonSeverity.warning: warningStyle,
        ButtonSeverity.success: successStyle,
        ButtonSeverity.info: infoStyle,
      };

  /// Creates a theme data that can be used for [ToggleButtonTheme].
  const ToggleButtonThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    this.variantStyle = const {},
    this.dangerStyle = const {},
    this.warningStyle = const {},
    this.successStyle = const {},
    this.infoStyle = const {},
  });

  /// Create a [ToggleButtonThemeData] with some reasonable default values.
  static const fallback = ToggleButtonThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: ButtonStyle.defaults,
    variantStyle: {},
    dangerStyle: {},
    warningStyle: {},
    successStyle: {},
    infoStyle: {},
  );

  /// Creates a [ToggleButtonThemeData] from another one that probably null.
  ToggleButtonThemeData.from([ToggleButtonThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        style = other?.style ?? fallback.style,
        variantStyle = other?.variantStyle ?? fallback.variantStyle,
        dangerStyle = other?.dangerStyle ?? fallback.dangerStyle,
        warningStyle = other?.warningStyle ?? fallback.warningStyle,
        successStyle = other?.successStyle ?? fallback.successStyle,
        infoStyle = other?.infoStyle ?? fallback.infoStyle;

  /// A [ToggleButtonThemeData] with default values.
  factory ToggleButtonThemeData.defaults(BuildContext context) =>
      ToggleButtonThemeDefaults(context);

  /// A [ToggleButtonThemeData] with material 2 default values.
  factory ToggleButtonThemeData.m2(BuildContext context) =>
      ToggleButtonThemeM2(context);

  /// A [ToggleButtonThemeData] with material 3 default values.
  factory ToggleButtonThemeData.m3(BuildContext context) =>
      ToggleButtonThemeM3(context);

  /// Return [ButtonStyle] that depends on [variant] and [severity]
  ButtonStyle resolve({ButtonVariant? variant, ButtonSeverity? severity}) {
    variant ??= style.variant;
    severity ??= style.severity;
    return const ButtonStyle()
        .merge(style)
        .merge(variantStyle[variant])
        .merge(severityStyle[severity]?[variant]);
  }

  /// Creates a copy of this [ToggleButtonThemeData] but with
  /// the given fields replaced with the new values.
  @override
  ToggleButtonThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ButtonStyle? style,
    ButtonStyleByVariant? variantStyle,
    ButtonStyleByVariant? dangerStyle,
    ButtonStyleByVariant? warningStyle,
    ButtonStyleByVariant? successStyle,
    ButtonStyleByVariant? infoStyle,
  }) {
    return ToggleButtonThemeData(
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

  /// Creates a copy of this [ToggleButtonThemeData] but with
  /// the given fields replaced with the new values.
  ToggleButtonThemeData merge(ToggleButtonThemeData? other) {
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
  ToggleButtonThemeData lerp(
      ThemeExtension<ToggleButtonThemeData>? other, double t) {
    if (other is! ToggleButtonThemeData) return this;
    return ToggleButtonThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      style: ButtonStyle.lerp(style, other.style, t) ?? style,
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
    return other is ToggleButtonThemeData && mapEquals(other.toMap(), toMap());
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
