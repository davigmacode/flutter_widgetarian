import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [TextTile].
///
/// Descendant widgets obtain the current [TextTileThemeData] object using
/// `TextTileTheme.of(context)`. Instances of [TextTileThemeData]
/// can be customized with [TextTileThemeData.copyWith] or [TextTileThemeData.merge].
@immutable
class TextTileThemeData extends ThemeExtension<TextTileThemeData>
    with Diagnosticable {
  /// The [TextTileStyle] to be applied to the [TextTile] widget
  final TextTileStyle style;

  /// Creates a theme data that can be used for [TextTileTheme].
  const TextTileThemeData({required this.style});

  /// An [TextTileThemeData] with some reasonable default values.
  static const fallback = TextTileThemeData(style: TextTileStyle());

  /// Creates a [TextTileThemeData] from another one that probably null.
  TextTileThemeData.from([TextTileThemeData? other])
      : style = other?.style ?? fallback.style;

  /// A [TextTileThemeData] with default values.
  factory TextTileThemeData.defaults(BuildContext context) =>
      TextTileThemeDefaults(context);

  /// Creates a copy of this [TextTileThemeData] but with
  /// the given fields replaced with the new values.
  @override
  TextTileThemeData copyWith({TextTileStyle? style}) {
    return TextTileThemeData(
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [TextTileThemeData] but with
  /// the given fields replaced with the new values.
  TextTileThemeData merge(TextTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      style: other.style,
    );
  }

  @override
  TextTileThemeData lerp(ThemeExtension<TextTileThemeData>? other, double t) {
    if (other is! TextTileThemeData) return this;
    return TextTileThemeData(
      style: TextTileStyle.lerp(style, other.style, t) ?? style,
    );
  }

  Map<String, dynamic> toMap() => {'style': style};

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is TextTileThemeData && mapEquals(other.toMap(), toMap());
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
