import 'package:flutter/animation.dart';
import 'style.dart';
import 'theme_data.dart';

/// An interpolation between two [ListTileStyle]s.
///
/// This class specializes the interpolation of [Tween] to use [ListTileStyle.lerp].
class ListTileStyleTween extends Tween<ListTileStyle?> {
  /// Creates a [ListTileStyle] tween.
  ///
  /// the [begin] and [end] properties may be null; see [ListTileStyle.lerp] for
  /// the null handling semantics.
  ListTileStyleTween({ListTileStyle? begin, ListTileStyle? end})
      : super(begin: begin, end: end);

  /// Returns the value this tween has at the given animation clock value.
  @override
  ListTileStyle? lerp(double t) {
    return ListTileStyle.lerp(begin, end, t);
  }
}

/// An interpolation between two [ListTileThemeData]s.
///
/// This class specializes the interpolation of [Tween] to use [ListTileThemeData.lerp].
class ListTileThemeDataTween extends Tween<ListTileThemeData?> {
  /// Creates a [TileThemeData] tween.
  ///
  /// the [begin] and [end] properties may be null; see [TileThemeData.lerp] for
  /// the null handling semantics.
  ListTileThemeDataTween({ListTileThemeData? begin, ListTileThemeData? end})
      : super(begin: begin, end: end);

  /// Returns the value this tween has at the given animation clock value.
  @override
  ListTileThemeData? lerp(double t) {
    return begin?.lerp(end, t) ?? end;
  }
}
