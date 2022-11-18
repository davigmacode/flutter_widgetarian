import 'package:flutter/widgets.dart';
import 'package:widgetarian/tween.dart';

class AnimatedSwitchmark extends ImplicitlyAnimatedWidget {
  const AnimatedSwitchmark({
    Key? key,
    this.value,
    this.padding,
    this.trackShape,
    this.trackColor,
    this.trackHeight,
    this.thumbShape,
    this.thumbColor,
    this.thumbScale,
    this.thumbShadow,
    this.thumbElevation,
    this.overlayColor,
    this.overlayOpacity,
    this.overlayRadius,
    this.size,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.linear,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  /// Whether to show the checkmark.
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to [true].
  final bool? value;

  final double? padding;

  final ShapeBorder? trackShape;
  final Color? trackColor;
  final double? trackHeight;

  final ShapeBorder? thumbShape;
  final Color? thumbColor;
  final double? thumbScale;
  final Color? thumbShadow;
  final double? thumbElevation;

  final Color? overlayColor;
  final double? overlayOpacity;
  final double? overlayRadius;

  /// Expand to parent if the value is [Size.zero].
  ///
  /// Changing triggers animation.
  ///
  /// Defaults to parent size.
  final Size? size;

  @override
  AnimatedSwitchmarkState createState() => AnimatedSwitchmarkState();
}

class AnimatedSwitchmarkState
    extends AnimatedWidgetBaseState<AnimatedSwitchmark> {
  SizeTween? size;

  Tween<double?>? progress;
  Tween<double?>? padding;

  ShapeBorderTween? trackShape;
  ColorTween? trackColor;
  Tween<double?>? trackHeight;

  ShapeBorderTween? thumbShape;
  ColorTween? thumbColor;
  Tween<double?>? thumbScale;
  ColorTween? thumbShadow;
  Tween<double?>? thumbElevation;

  ColorTween? overlayColor;
  Tween<double?>? overlayOpacity;
  Tween<double?>? overlayRadius;

  ShapeBorder get defaultTrackShape {
    return const StadiumBorder();
  }

  ShapeBorder get defaultThumbShape {
    return const CircleBorder();
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    progress = visitor(
      progress,
      widget.value == null
          ? 0.5
          : widget.value == true
              ? 1.0
              : 0.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    size = visitor(
      size,
      widget.size,
      (dynamic value) => SizeTween(begin: value),
    ) as SizeTween?;

    padding = visitor(
      padding,
      widget.padding ?? 0.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    trackShape = visitor(
      trackShape,
      widget.trackShape ?? defaultTrackShape,
      (dynamic value) => ShapeBorderTween(begin: value),
    ) as ShapeBorderTween?;

    trackColor = visitor(
      trackColor,
      widget.trackColor,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    trackHeight = visitor(
      trackHeight,
      widget.trackHeight ?? 1.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    thumbShape = visitor(
      thumbShape,
      widget.thumbShape ?? defaultThumbShape,
      (dynamic value) => ShapeBorderTween(begin: value),
    ) as ShapeBorderTween?;

    thumbColor = visitor(
      thumbColor,
      widget.thumbColor,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    thumbScale = visitor(
      thumbScale,
      widget.thumbScale ?? 1.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    thumbShadow = visitor(
      thumbShadow,
      widget.thumbShadow,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    thumbElevation = visitor(
      thumbElevation,
      widget.thumbElevation ?? 1.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    overlayColor = visitor(
      overlayColor,
      widget.overlayColor,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    overlayOpacity = visitor(
      overlayOpacity,
      widget.overlayOpacity ?? .15,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    overlayRadius = visitor(
      overlayRadius,
      widget.overlayRadius ?? 0.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;
  }

  @override
  Widget build(BuildContext context) {
    return Switchmark(
      progress: progress?.evaluate(animation),
      padding: padding?.evaluate(animation),
      trackShape: trackShape?.evaluate(animation),
      trackColor: trackColor?.evaluate(animation),
      trackHeight: trackHeight?.evaluate(animation),
      thumbShape: thumbShape?.evaluate(animation),
      thumbColor: thumbColor?.evaluate(animation),
      thumbScale: thumbScale?.evaluate(animation),
      thumbShadow: thumbShadow?.evaluate(animation),
      thumbElevation: thumbElevation?.evaluate(animation),
      overlayColor: overlayColor?.evaluate(animation),
      overlayOpacity: overlayOpacity?.evaluate(animation),
      overlayRadius: overlayRadius?.evaluate(animation),
      size: size?.evaluate(animation),
    );
  }
}

class Switchmark extends CustomPaint {
  Switchmark({
    Key? key,
    double? progress,
    double? padding,
    ShapeBorder? trackShape,
    Color? trackColor,
    double? trackHeight,
    ShapeBorder? thumbShape,
    Color? thumbColor,
    double? thumbScale,
    Color? thumbShadow,
    double? thumbElevation,
    Color? overlayColor,
    double? overlayOpacity,
    double? overlayRadius,
    Size? size,
  }) : super(
          key: key,
          size: size ?? Size.zero,
          painter: SwitchmarkPainter(
            progress: progress,
            padding: padding,
            trackShape: trackShape,
            trackColor: trackColor,
            trackHeight: trackHeight,
            thumbShape: thumbShape,
            thumbColor: thumbColor,
            thumbScale: thumbScale,
            thumbShadow: thumbShadow,
            thumbElevation: thumbElevation,
            overlayColor: overlayColor,
            overlayOpacity: overlayOpacity,
            overlayRadius: overlayRadius,
          ),
        );
}

class SwitchmarkPainter extends CustomPainter {
  SwitchmarkPainter({
    double? progress,
    double? padding,
    ShapeBorder? trackShape,
    Color? trackColor,
    double? trackHeight,
    ShapeBorder? thumbShape,
    Color? thumbColor,
    double? thumbScale,
    Color? thumbShadow,
    double? thumbElevation,
    Color? overlayColor,
    double? overlayOpacity,
    double? overlayRadius,
  })  : progress = progress ?? 0.0,
        padding = padding ?? 0.0,
        trackShape = trackShape ?? const StadiumBorder(),
        trackColor = trackColor ?? const Color(0xFF000000),
        trackHeight = trackHeight ?? 1.0,
        thumbShape = thumbShape ?? const CircleBorder(),
        thumbColor = thumbColor ?? const Color(0xFFFFFFFF),
        thumbScale = thumbScale ?? 1.0,
        thumbShadow = thumbShadow ?? const Color(0xFF000000),
        thumbElevation = thumbElevation ?? 1.0,
        overlayColor = overlayColor ?? const Color(0xFF000000),
        overlayOpacity = overlayOpacity ?? .15,
        overlayRadius = overlayRadius ?? 0.0;

  final double progress;
  final double padding;

  final ShapeBorder trackShape;
  final Color trackColor;
  final double trackHeight;

  final ShapeBorder thumbShape;
  final Color thumbColor;
  final double thumbScale;
  final Color thumbShadow;
  final double thumbElevation;

  final Color overlayColor;
  final double overlayOpacity;
  final double overlayRadius;

  @override
  bool shouldRepaint(SwitchmarkPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.padding != padding ||
        oldDelegate.thumbShape != thumbShape ||
        oldDelegate.thumbColor != thumbColor ||
        oldDelegate.thumbScale != thumbScale ||
        oldDelegate.thumbShadow != thumbShadow ||
        oldDelegate.thumbElevation != thumbElevation ||
        oldDelegate.overlayColor != overlayColor ||
        oldDelegate.overlayOpacity != overlayOpacity ||
        oldDelegate.overlayRadius != overlayRadius ||
        oldDelegate.trackShape != trackShape ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.trackHeight != trackHeight;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawTrack(canvas, size);
    _drawThumb(canvas, size);
  }

  void _drawTrack(Canvas canvas, Size size) {
    final track = Size(size.width, size.height * trackHeight);
    final dy = size.height / 2 - track.height / 2;
    final offset = Offset(0, dy);
    final outer = offset & track;

    // draw fill
    final paint = Paint()..color = trackColor;
    canvas.drawPath(trackShape.getOuterPath(outer), paint);

    // draw border
    trackShape.paint(canvas, outer);
  }

  void _drawThumb(Canvas canvas, Size size) {
    final thumb = Size.square((size.height - padding) * thumbScale);

    final dxMin = padding;
    final dxMax = size.width - thumb.width - padding;
    final dxRange = dxMax - dxMin;
    final dx = dxMin + dxRange * progress;
    final dy = size.height / 2 - thumb.height / 2;

    final offset = Offset(dx, dy);
    final outer = offset & thumb;

    _drawOverlay(
      canvas,
      outer.center,
      overlayColor.withOpacity(overlayOpacity),
    );

    if (thumbElevation > 0) {
      canvas.drawShadow(
        thumbShape.getInnerPath(outer),
        thumbShadow,
        thumbElevation,
        true,
      );
    }

    // draw fill
    final paint = Paint()..color = thumbColor;
    canvas.drawPath(thumbShape.getInnerPath(outer), paint);

    // draw border
    thumbShape.paint(canvas, outer);
  }

  /// Used by subclasses to paint the radial ink reaction for this control.
  ///
  /// The reaction is painted on the given canvas at the given offset. The
  /// origin is the center point of the reaction (usually distinct from the
  /// [downPosition] at which the user interacted with the control).
  void _drawOverlay(Canvas canvas, Offset origin, Color color) {
    const offset = Offset.zero;
    final Paint paint = Paint()..color = color;
    if (overlayRadius > 0.0) {
      canvas.drawCircle(origin + offset, overlayRadius, paint);
    }
  }
}
