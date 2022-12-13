import 'package:flutter/animation.dart';
import 'style.dart';

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
