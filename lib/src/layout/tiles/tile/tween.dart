import 'package:flutter/animation.dart';
import 'style.dart';
import 'theme_data.dart';

/// An interpolation between two [TileStyle]s.
///
/// This class specializes the interpolation of [Tween] to use [TileStyle.lerp].
class TileStyleTween extends Tween<TileStyle?> {
  /// Creates a [TextTileStyle] tween.
  ///
  /// the [begin] and [end] properties may be null; see [TileStyle.lerp] for
  /// the null handling semantics.
  TileStyleTween({TileStyle? begin, TileStyle? end})
      : super(begin: begin, end: end);

  /// Returns the value this tween has at the given animation clock value.
  @override
  TileStyle? lerp(double t) {
    return TileStyle.lerp(begin, end, t);
  }
}

/// An interpolation between two [TileThemeData]s.
///
/// This class specializes the interpolation of [Tween] to use [TileThemeData.lerp].
class TileThemeDataTween extends Tween<TileThemeData?> {
  /// Creates a [TileThemeData] tween.
  ///
  /// the [begin] and [end] properties may be null; see [TileThemeData.lerp] for
  /// the null handling semantics.
  TileThemeDataTween({TileThemeData? begin, TileThemeData? end})
      : super(begin: begin, end: end);

  /// Returns the value this tween has at the given animation clock value.
  @override
  TileThemeData? lerp(double t) {
    return begin?.lerp(end, t) ?? end;
  }
}
