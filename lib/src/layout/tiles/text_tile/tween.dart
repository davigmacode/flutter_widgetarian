import 'package:flutter/animation.dart';
import 'style.dart';

/// An interpolation between two [TextTileStyle]s.
///
/// This class specializes the interpolation of [Tween] to use [TextTileStyle.lerp].
class TextTileStyleTween extends Tween<TextTileStyle?> {
  /// Creates a [TextTileStyle] tween.
  ///
  /// the [begin] and [end] properties may be null; see [TextTileStyle.lerp] for
  /// the null handling semantics.
  TextTileStyleTween({TextTileStyle? begin, TextTileStyle? end})
      : super(begin: begin, end: end);

  /// Returns the value this tween has at the given animation clock value.
  @override
  TextTileStyle? lerp(double t) {
    return TextTileStyle.lerp(begin, end, t);
  }
}
