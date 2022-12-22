import 'package:flutter/animation.dart';
import 'style.dart';

/// An interpolation between two [OverlayStyle]s.
///
/// This class specializes the interpolation of [Tween] to use [ShapeBorder.lerp].
class OverlayStyleTween extends Tween<OverlayStyle?> {
  /// Creates a [OverlayStyle] tween.
  ///
  /// the [begin] and [end] properties may be null; see [OverlayStyle.lerp] for
  /// the null handling semantics.
  OverlayStyleTween({OverlayStyle? begin, OverlayStyle? end})
      : super(begin: begin, end: end);

  /// Returns the value this tween has at the given animation clock value.
  @override
  OverlayStyle? lerp(double t) {
    return OverlayStyle.lerp(begin, end, t);
  }
}
