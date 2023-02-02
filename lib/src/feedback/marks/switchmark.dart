import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';

class AnimatedSwitchmark extends ImplicitlyAnimatedWidget {
  const AnimatedSwitchmark({
    Key? key,
    this.value,
    this.thumbInset,
    this.trackBorderColor,
    this.trackBorderWidth,
    this.trackBorderRadius,
    this.trackColor,
    this.trackHeight,
    this.trackShadow,
    this.trackElevation,
    this.thumbShape,
    this.thumbColor,
    this.thumbSize,
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

  final Color? trackBorderColor;
  final double? trackBorderWidth;
  final BorderRadiusGeometry? trackBorderRadius;
  final Color? trackColor;
  final double? trackHeight;
  final Color? trackShadow;
  final double? trackElevation;

  final ShapeBorder? thumbShape;
  final Color? thumbColor;
  final double? thumbInset;
  final double? thumbSize;
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

  ColorTween? trackBorderColor;
  Tween<double?>? trackBorderWidth;
  BorderRadiusTween? trackBorderRadius;
  ColorTween? trackColor;
  Tween<double?>? trackHeight;
  ColorTween? trackShadow;
  Tween<double?>? trackElevation;

  ShapeBorderTween? thumbShape;
  ColorTween? thumbColor;
  Tween<double?>? thumbInset;
  Tween<double?>? thumbSize;
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

    trackBorderColor = visitor(
      trackBorderColor,
      widget.trackBorderColor,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    trackBorderWidth = visitor(
      trackBorderWidth,
      widget.trackBorderWidth,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    trackBorderRadius = visitor(
      trackBorderRadius,
      widget.trackBorderRadius,
      (dynamic value) => BorderRadiusTween(begin: value),
    ) as BorderRadiusTween?;

    trackColor = visitor(
      trackColor,
      widget.trackColor,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    trackHeight = visitor(
      trackHeight,
      widget.trackHeight,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    trackShadow = visitor(
      trackShadow,
      widget.trackShadow,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    trackElevation = visitor(
      trackElevation,
      widget.trackElevation ?? 1.0,
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

    thumbInset = visitor(
      thumbInset,
      widget.thumbInset,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    thumbSize = visitor(
      thumbSize,
      widget.thumbSize,
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
      trackBorderColor: trackBorderColor?.evaluate(animation),
      trackBorderWidth: trackBorderWidth?.evaluate(animation),
      trackBorderRadius: trackBorderRadius?.evaluate(animation),
      trackColor: trackColor?.evaluate(animation),
      trackHeight: trackHeight?.evaluate(animation),
      trackShadow: trackShadow?.evaluate(animation),
      trackElevation: trackElevation?.evaluate(animation),
      thumbShape: thumbShape?.evaluate(animation),
      thumbColor: thumbColor?.evaluate(animation),
      thumbInset: thumbInset?.evaluate(animation),
      thumbSize: thumbSize?.evaluate(animation),
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
    Color? trackBorderColor,
    double? trackBorderWidth,
    BorderRadiusGeometry? trackBorderRadius,
    Color? trackColor,
    double? trackHeight,
    Color? trackShadow,
    double? trackElevation,
    ShapeBorder? thumbShape,
    Color? thumbColor,
    double? thumbInset,
    double? thumbSize,
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
            trackBorderColor: trackBorderColor,
            trackBorderWidth: trackBorderWidth,
            trackBorderRadius: trackBorderRadius,
            trackColor: trackColor,
            trackHeight: trackHeight,
            trackShadow: trackShadow,
            trackElevation: trackElevation,
            thumbShape: thumbShape,
            thumbColor: thumbColor,
            thumbInset: thumbInset,
            thumbSize: thumbSize,
            thumbShadow: thumbShadow,
            thumbElevation: thumbElevation,
            overlayColor: overlayColor,
            overlayOpacity: overlayOpacity,
            overlayRadius: overlayRadius,
          ),
        );
}

class SwitchmarkPainter extends CustomPainter with Diagnosticable {
  SwitchmarkPainter({
    double? progress,
    Color? trackBorderColor,
    double? trackBorderWidth,
    this.trackBorderRadius,
    Color? trackColor,
    this.trackHeight,
    Color? trackShadow,
    double? trackElevation,
    ShapeBorder? thumbShape,
    Color? thumbColor,
    this.thumbInset,
    this.thumbSize,
    Color? thumbShadow,
    double? thumbElevation,
    Color? overlayColor,
    double? overlayOpacity,
    double? overlayRadius,
  })  : progress = progress ?? 0.0,
        trackBorderColor = trackBorderColor ?? const Color(0xFF000000),
        trackBorderWidth = trackBorderWidth ?? 0.0,
        trackColor = trackColor ?? const Color(0xFF000000),
        trackElevation = trackElevation ?? 0.0,
        trackShadow = trackShadow ?? const Color(0xFF000000),
        thumbShape = thumbShape ?? const CircleBorder(),
        thumbColor = thumbColor ?? const Color(0xFFFFFFFF),
        thumbElevation = thumbElevation ?? 1.0,
        thumbShadow = thumbShadow ?? const Color(0xFF000000),
        overlayColor = overlayColor ?? const Color(0xFF000000),
        overlayOpacity = overlayOpacity ?? .15,
        overlayRadius = overlayRadius ?? 0.0;

  final double progress;

  final Color trackBorderColor;
  final double trackBorderWidth;
  final BorderRadiusGeometry? trackBorderRadius;
  final Color trackColor;
  final double? trackHeight;
  final double trackElevation;
  final Color trackShadow;

  final ShapeBorder thumbShape;
  final Color thumbColor;
  final double? thumbInset;
  final double? thumbSize;
  final double thumbElevation;
  final Color thumbShadow;

  final Color overlayColor;
  final double overlayOpacity;
  final double overlayRadius;

  @override
  bool shouldRepaint(SwitchmarkPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.thumbShape != thumbShape ||
        oldDelegate.thumbColor != thumbColor ||
        oldDelegate.thumbInset != thumbInset ||
        oldDelegate.thumbSize != thumbSize ||
        oldDelegate.thumbShadow != thumbShadow ||
        oldDelegate.thumbElevation != thumbElevation ||
        oldDelegate.overlayColor != overlayColor ||
        oldDelegate.overlayOpacity != overlayOpacity ||
        oldDelegate.overlayRadius != overlayRadius ||
        oldDelegate.trackBorderColor != trackBorderColor ||
        oldDelegate.trackBorderWidth != trackBorderWidth ||
        oldDelegate.trackBorderRadius != trackBorderRadius ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.trackShadow != trackShadow ||
        oldDelegate.trackElevation != trackElevation ||
        oldDelegate.trackHeight != trackHeight;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawTrack(canvas, size);
    _drawThumb(canvas, size);
  }

  void _drawTrack(Canvas canvas, Size size) {
    final effectiveTrackHeight = trackHeight ?? size.height;
    final track = Size(size.width, effectiveTrackHeight);
    final dy = size.height / 2 - effectiveTrackHeight / 2;
    final offset = Offset(0, dy);
    final outer = offset & track;

    final side = BorderSide(
      color: trackBorderColor,
      width: trackBorderWidth,
      style: trackBorderWidth > 0 ? BorderStyle.solid : BorderStyle.none,
    );
    final shape = trackBorderRadius != null
        ? RoundedRectangleBorder(side: side, borderRadius: trackBorderRadius!)
        : StadiumBorder(side: side);

    if (trackElevation > 0) {
      canvas.drawShadow(
        shape.getInnerPath(outer),
        trackShadow,
        trackElevation,
        true,
      );
    }

    // draw fill
    final paint = Paint()..color = trackColor;
    canvas.drawPath(shape.getOuterPath(outer), paint);

    // draw border
    shape.paint(canvas, outer);
  }

  void _drawThumb(Canvas canvas, Size size) {
    final effectiveThumbSize = thumbSize ?? trackHeight ?? size.height;
    final thumb = Size.square(effectiveThumbSize);
    final inset = thumbInset ?? ((size.height - thumb.height) / 2);

    final dxMin = inset;
    final dxMax = size.width - thumb.width - inset;
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('progress', progress));
    properties.add(DoubleProperty('thumbScale', thumbSize));
    properties.add(DoubleProperty('thumbInset', thumbInset));
  }
}
