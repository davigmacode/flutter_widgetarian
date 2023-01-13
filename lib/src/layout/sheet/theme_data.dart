import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'style.dart';
import 'types.dart';

/// Defines the visual properties of [Sheet].
///
/// Descendant widgets obtain the current [SheetThemeData] object using
/// `SheetTheme.of(context)`. Instances of [SheetThemeData]
/// can be customized with [SheetThemeData.copyWith] or [SheetThemeData.merge].
@immutable
class SheetThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of sheet widget.
  final Curve curve;

  /// The duration over which to animate the parameters of sheet widget.
  final Duration duration;

  /// The [SheetStyle] to be applied to the sheet widget
  final SheetStyle style;

  /// The [SheetStyle] to be applied to the variant sheet widget
  final Map<SheetVariant, SheetStyle?> variants;

  /// The [SheetStyle] to be applied to the sheet widget with severity
  final Map<SheetSeverity, SheetStyle?> severities;

  /// Creates a theme data that can be used for [SheetTheme].
  const SheetThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    this.variants = const {},
    this.severities = const {},
  });

  SheetStyle resolve({SheetVariant? variant, SheetSeverity? severity}) {
    return SheetStyle.from(style)
        .merge(variants[variant])
        .merge(severities[severity]);
  }

  /// Creates a copy of this [SheetThemeData] but with
  /// the given fields replaced with the new values.
  SheetThemeData copyWith({
    Curve? curve,
    Duration? duration,
    SheetStyle? style,
    Map<SheetVariant, SheetStyle?>? variants,
    Map<SheetSeverity, SheetStyle?>? severities,
  }) {
    return SheetThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
      variants: {...this.variants, ...?variants},
      severities: {...this.severities, ...?severities},
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
      variants: other.variants,
      severities: other.severities,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'style': style,
        'variant': variants,
        'severity': severities,
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
