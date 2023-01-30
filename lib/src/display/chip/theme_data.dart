import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Map of [ChipStyle] by [ChipVariant] as key
typedef ChipStyleByVariant = Map<ChipVariant, ChipStyle?>;

extension ChipStyleByVariantUtils on ChipStyleByVariant {
  /// Creates a copy of this [ChipStyleByVariant] but with
  /// the given fields replaced with the new values.
  ChipStyleByVariant merge(ChipStyleByVariant? variants) {
    final entries = ChipVariant.values.map((key) {
      final other = variants?[key];
      final style = this[key]?.merge(other) ?? other;
      return MapEntry(key, style);
    });
    return Map.fromEntries(entries);
  }

  /// Linearly interpolate with another [ChipStyleByVariant] object.
  ChipStyleByVariant lerp(ChipStyleByVariant? other, double t) {
    final entries = ChipVariant.values.map((key) {
      final style = ChipStyle.lerp(this[key], other?[key], t);
      return MapEntry(key, style);
    });
    return Map.fromEntries(entries);
  }
}

/// Defines the visual properties of [Chip].
///
/// Descendant widgets obtain the current [ChipThemeData] object using
/// `ChipTheme.of(context)`. Instances of [ChipThemeData]
/// can be customized with [ChipThemeData.copyWith] or [ChipThemeData.merge].
@immutable
class ChipThemeData extends ThemeExtension<ChipThemeData> with Diagnosticable {
  /// The curve to apply when animating the parameters of [Chip] widget.
  final Curve curve;

  /// The duration over which to animate the parameters of [Chip] widget.
  final Duration duration;

  /// The icon displayed when [onDeleted] is set.
  final IconData deleteIcon;

  /// The [ChipStyle] to be applied to the [Chip] widget
  final ChipStyle style;

  /// The [ChipStyle] to be applied to the variant sheet widget
  final ChipStyleByVariant variantStyle;

  /// The [ChipStyle] to be applied to the sheet widget with danger severity
  final ChipStyleByVariant dangerStyle;

  /// The [ChipStyle] to be applied to the sheet widget with warning severity
  final ChipStyleByVariant warningStyle;

  /// The [ChipStyle] to be applied to the sheet widget with success severity
  final ChipStyleByVariant successStyle;

  /// The [ChipStyle] to be applied to the sheet widget with info severity
  final ChipStyleByVariant infoStyle;

  /// The [ChipStyle] to be applied to the sheet widget with severity
  Map<ChipSeverity, ChipStyleByVariant> get severityStyle => {
        ChipSeverity.danger: dangerStyle,
        ChipSeverity.warning: warningStyle,
        ChipSeverity.success: successStyle,
        ChipSeverity.info: infoStyle,
      };

  /// Creates a theme data that can be used for [ChipTheme].
  const ChipThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    this.deleteIcon = fallbackDeleteIcon,
    this.variantStyle = const {},
    this.dangerStyle = const {},
    this.warningStyle = const {},
    this.successStyle = const {},
    this.infoStyle = const {},
  });

  /// The default icon displayed when [onDeleted] is set.
  static const fallbackDeleteIcon =
      IconData(0xe16a, fontFamily: 'MaterialIcons');

  /// Create a [ChipThemeData] with some reasonable default values.
  static const fallback = ChipThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: ChipStyle(),
    deleteIcon: fallbackDeleteIcon,
    variantStyle: {},
    dangerStyle: {},
    warningStyle: {},
    successStyle: {},
    infoStyle: {},
  );

  /// Creates a [ChipThemeData] from another one that probably null.
  ChipThemeData.from([ChipThemeData? other])
      : curve = other?.curve ?? fallback.curve,
        duration = other?.duration ?? fallback.duration,
        style = other?.style ?? fallback.style,
        deleteIcon = other?.deleteIcon ?? fallback.deleteIcon,
        variantStyle = other?.variantStyle ?? fallback.variantStyle,
        dangerStyle = other?.dangerStyle ?? fallback.dangerStyle,
        warningStyle = other?.warningStyle ?? fallback.warningStyle,
        successStyle = other?.successStyle ?? fallback.successStyle,
        infoStyle = other?.infoStyle ?? fallback.infoStyle;

  /// A [ChipThemeData] with default values.
  factory ChipThemeData.defaults(BuildContext context) =>
      ChipThemeDefaults(context);

  /// A [ChipThemeData] with material 2 default values.
  factory ChipThemeData.m2(BuildContext context) => ChipThemeM2(context);

  /// A [ChipThemeData] with material 3 default values.
  factory ChipThemeData.m3(BuildContext context) => ChipThemeM3(context);

  /// Return [ChipStyle] that depends on [variant] and [severity]
  ChipStyle resolve({ChipVariant? variant, ChipSeverity? severity}) {
    variant ??= style.variant;
    severity ??= style.severity;
    return const ChipStyle()
        .merge(style)
        .merge(variantStyle[variant])
        .merge(severityStyle[severity]?[variant]);
  }

  /// Creates a copy of this [ChipThemeData] but with
  /// the given fields replaced with the new values.
  @override
  ChipThemeData copyWith({
    Curve? curve,
    Duration? duration,
    IconData? deleteIcon,
    ChipStyle? style,
    ChipStyleByVariant? variantStyle,
    ChipStyleByVariant? dangerStyle,
    ChipStyleByVariant? warningStyle,
    ChipStyleByVariant? successStyle,
    ChipStyleByVariant? infoStyle,
  }) {
    return ChipThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      deleteIcon: deleteIcon ?? this.deleteIcon,
      style: this.style.merge(style),
      variantStyle: this.variantStyle.merge(variantStyle),
      dangerStyle: this.dangerStyle.merge(dangerStyle),
      warningStyle: this.warningStyle.merge(warningStyle),
      successStyle: this.successStyle.merge(successStyle),
      infoStyle: this.infoStyle.merge(infoStyle),
    );
  }

  /// Creates a copy of this [ChipThemeData] but with
  /// the given fields replaced with the new values.
  ChipThemeData merge(ChipThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      deleteIcon: other.deleteIcon,
      style: other.style,
      variantStyle: other.variantStyle,
      dangerStyle: other.dangerStyle,
      warningStyle: other.warningStyle,
      successStyle: other.successStyle,
      infoStyle: other.infoStyle,
    );
  }

  @override
  ChipThemeData lerp(ThemeExtension<ChipThemeData>? other, double t) {
    if (other is! ChipThemeData) return this;
    return ChipThemeData(
      curve: lerpEnum(curve, other.curve, t) ?? curve,
      duration: lerpEnum(duration, other.duration, t) ?? duration,
      deleteIcon: lerpEnum(deleteIcon, other.deleteIcon, t) ?? deleteIcon,
      style: ChipStyle.lerp(style, other.style, t) ?? style,
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
        'deleteIcon': deleteIcon,
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
    return other is ChipThemeData && mapEquals(other.toMap(), toMap());
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
