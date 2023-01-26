import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [Tile].
///
/// Descendant widgets obtain the current [TileThemeData] object using
/// `TileTheme.of(context)`. Instances of [TileThemeData]
/// can be customized with [TileThemeData.copyWith] or [TileThemeData.merge].
@immutable
class TileThemeData extends ThemeExtension<TileThemeData> with Diagnosticable {
  /// The [TileStyle] to be applied to the [Tile] widget
  final TileStyle style;

  /// Creates a theme data that can be used for [TileTheme].
  const TileThemeData({required this.style});

  /// An [TileThemeData] with some reasonable default values.
  static const fallback = TileThemeData(style: TileStyle());

  /// Creates a [TileThemeData] from another one that probably null.
  TileThemeData.from([TileThemeData? other])
      : style = other?.style ?? fallback.style;

  /// A [TileThemeData] with default values.
  factory TileThemeData.defaults(BuildContext context) =>
      TileThemeDefaults(context);

  /// Creates a copy of this [TileThemeData] but with
  /// the given fields replaced with the new values.
  @override
  TileThemeData copyWith({TileStyle? style}) {
    return TileThemeData(
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [TileThemeData] but with
  /// the given fields replaced with the new values.
  TileThemeData merge(TileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      style: other.style,
    );
  }

  @override
  TileThemeData lerp(ThemeExtension<TileThemeData>? other, double t) {
    if (other is! TileThemeData) return this;
    return TileThemeData(
      style: TileStyle.lerp(style, other.style, t) ?? style,
    );
  }

  Map<String, dynamic> toMap() => {'style': style};

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is TileThemeData && mapEquals(other.toMap(), toMap());
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
