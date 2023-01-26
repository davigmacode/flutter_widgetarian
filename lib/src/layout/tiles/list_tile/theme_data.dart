import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'style.dart';
import 'theme_preset.dart';

/// Defines the visual properties of [ListTile].
///
/// Descendant widgets obtain the current [ListTileThemeData] object using
/// `ListTileTheme.of(context)`. Instances of [ListTileThemeData]
/// can be customized with [ListTileThemeData.copyWith] or [ListTileThemeData.merge].
@immutable
class ListTileThemeData extends ThemeExtension<ListTileThemeData>
    with Diagnosticable {
  /// The [ListTileStyle] to be applied to the [ListTile] widget
  final ListTileStyle style;

  /// Creates a theme data that can be used for [ListTileTheme].
  const ListTileThemeData({required this.style});

  /// An [ListTileThemeData] with some reasonable default values.
  static const fallback = ListTileThemeData(style: ListTileStyle());

  /// Creates a [ListTileThemeData] from another one that probably null.
  ListTileThemeData.from([ListTileThemeData? other])
      : style = other?.style ?? fallback.style;

  /// A [ListTileThemeData] with default values.
  factory ListTileThemeData.defaults(BuildContext context) =>
      ListTileThemeDefaults(context);

  /// Creates a copy of this [ListTileThemeData] but with
  /// the given fields replaced with the new values.
  @override
  ListTileThemeData copyWith({ListTileStyle? style}) {
    return ListTileThemeData(
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [ListTileThemeData] but with
  /// the given fields replaced with the new values.
  ListTileThemeData merge(ListTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      style: other.style,
    );
  }

  @override
  ListTileThemeData lerp(ThemeExtension<ListTileThemeData>? other, double t) {
    if (other is! ListTileThemeData) return this;
    return ListTileThemeData(
      style: ListTileStyle.lerp(style, other.style, t) ?? style,
    );
  }

  Map<String, dynamic> toMap() => {'style': style};

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ListTileThemeData && mapEquals(other.toMap(), toMap());
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
