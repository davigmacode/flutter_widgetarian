import 'package:flutter/widgets.dart';

/// An interpolation between two [IconThemeData]s.
///
/// This class specializes the interpolation of [Tween<IconThemeData>] to call the
/// [IconThemeData.lerp] method.
///
/// See [Tween] for a discussion on how to use interpolation objects.
class IconThemeDataTween extends Tween<IconThemeData> {
  /// Creates a [IconThemeData] tween.
  ///
  /// The [begin] and [end] properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  IconThemeDataTween({IconThemeData? begin, IconThemeData? end})
      : super(begin: begin, end: end);

  @override
  IconThemeData lerp(double t) => IconThemeData.lerp(begin!, end!, t);
}
