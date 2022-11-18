import 'package:flutter/material.dart';
import 'border.dart';

class AnimatedBox extends ImplicitlyAnimatedWidget {
  const AnimatedBox({
    Key? key,
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = Curves.linear,
    this.width,
    this.height,
    this.constraints,
    this.padding,
    this.margin,
    this.alignment,
    this.color,
    this.shadowColor,
    this.elevation,
    this.border,
    this.borderColor,
    this.borderWidth,
    this.borderStyle,
    this.borderSide,
    this.borderRadius,
    this.clipBehavior,
    this.shape,
    required this.tooltip,
    required this.child,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  final Widget? child;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? shadowColor;
  final double? elevation;
  final ShapeBorder? border;
  final Color? borderColor;
  final double? borderWidth;
  final BorderStyle? borderStyle;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final Clip? clipBehavior;
  final String? tooltip;

  @override
  AnimatedBoxState createState() => AnimatedBoxState();
}

class AnimatedBoxState extends AnimatedWidgetBaseState<AnimatedBox> {
  BorderSide get borderSide {
    return BorderSide.none
        .copyWith(
          color: widget.borderSide?.color,
          width: widget.borderSide?.width,
          style: widget.borderSide?.style,
        )
        .copyWith(
          color: widget.borderColor,
          width: widget.borderWidth,
          style: widget.borderStyle,
        );
  }

  ShapeBorder get borderShape {
    switch (widget.shape) {
      case BoxShape.circle:
        return CircleBorder(side: borderSide);
      default:
        return RoundedRectangleBorder(
          side: borderSide,
          borderRadius: widget.borderRadius ?? BorderRadius.zero,
        );
    }
  }

  ShapeBorder get border => widget.border ?? borderShape;

  AlignmentGeometryTween? alignmentTween;
  EdgeInsetsGeometryTween? paddingTween;
  EdgeInsetsGeometryTween? marginTween;
  ColorTween? colorTween;
  ColorTween? shadowColorTween;
  Tween<double?>? elevationTween;
  ShapeBorderTween? borderTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    alignmentTween = visitor(
      alignmentTween,
      widget.alignment,
      (dynamic value) => AlignmentGeometryTween(begin: value),
    ) as AlignmentGeometryTween?;

    paddingTween = visitor(
      paddingTween,
      widget.padding,
      (value) => EdgeInsetsGeometryTween(begin: value),
    ) as EdgeInsetsGeometryTween?;

    marginTween = visitor(
      marginTween,
      widget.margin,
      (value) => EdgeInsetsGeometryTween(begin: value),
    ) as EdgeInsetsGeometryTween?;

    colorTween = visitor(
      colorTween,
      widget.color,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    shadowColorTween = visitor(
      shadowColorTween,
      widget.shadowColor,
      (dynamic value) => ColorTween(begin: value),
    ) as ColorTween?;

    elevationTween = visitor(
      elevationTween,
      widget.elevation ?? 0.0,
      (dynamic value) => Tween<double?>(begin: value),
    ) as Tween<double?>?;

    borderTween = visitor(
      borderTween,
      border,
      (dynamic value) => ShapeBorderTween(begin: value),
    ) as ShapeBorderTween?;
  }

  @override
  Widget build(BuildContext context) {
    return Box(
      width: widget.width,
      height: widget.height,
      constraints: widget.constraints,
      alignment: alignmentTween?.evaluate(animation),
      padding: paddingTween?.evaluate(animation),
      margin: marginTween?.evaluate(animation),
      color: colorTween?.evaluate(animation),
      shadowColor: shadowColorTween?.evaluate(animation),
      elevation: elevationTween?.evaluate(animation),
      border: borderTween?.evaluate(animation),
      clipBehavior: widget.clipBehavior,
      tooltip: widget.tooltip,
      child: widget.child,
    );
  }
}

class Box extends StatelessWidget {
  const Box({
    Key? key,
    this.width,
    this.height,
    this.constraints,
    this.alignment,
    this.padding,
    this.margin,
    this.color,
    this.border,
    this.borderColor,
    this.borderWidth,
    this.borderStyle,
    this.borderSide,
    this.borderRadius,
    this.shape,
    this.shadowColor,
    this.clipBehavior,
    this.elevation,
    this.tooltip,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? shadowColor;
  final double? elevation;
  final ShapeBorder? border;
  final Color? borderColor;
  final double? borderWidth;
  final BorderStyle? borderStyle;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;
  final BoxShape? shape;
  final Clip? clipBehavior;
  final String? tooltip;

  bool get hasCustomShape => border != null;

  BorderSide? get effectiveBorderSide {
    return BorderSide.none
        .copyWith(
          color: borderSide?.color,
          width: borderSide?.width,
          style: borderSide?.style,
        )
        .copyWith(
          color: borderColor,
          width: borderWidth,
          style: borderStyle,
        );
  }

  ShapeBorder get borderShape {
    switch (shape) {
      case BoxShape.circle:
        return CircleBorder(
          side: effectiveBorderSide ?? BorderSide.none,
        );
      default:
        return RoundedRectangleBorder(
          side: effectiveBorderSide ?? BorderSide.none,
          borderRadius: borderRadius ?? BorderRadius.zero,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? result = child;

    final constraints = width != null || height != null
        ? this.constraints?.tighten(width: width, height: height) ??
            BoxConstraints.tightFor(width: width, height: height)
        : this.constraints;

    if (child == null && (constraints == null || !constraints.isTight)) {
      result = LimitedBox(
        maxWidth: 0.0,
        maxHeight: 0.0,
        child: ConstrainedBox(constraints: const BoxConstraints.expand()),
      );
    } else if (alignment != null) {
      result = Align(alignment: alignment!, child: result);
    }

    if (padding != null) {
      result = Padding(padding: padding!, child: result);
    }

    if (constraints != null) {
      result = ConstrainedBox(constraints: constraints, child: result);
    }

    final border = this.border ?? borderShape;
    final textDirection = Directionality.maybeOf(context);
    final clipper = ShapeBorderClipper(
      textDirection: textDirection,
      shape: border,
    );

    result = ShapeBorderPaint(
      textDirection: textDirection,
      shape: border,
      child: result,
    );

    if (color == null) {
      result = ClipPath(
        clipper: clipper,
        clipBehavior: clipBehavior ?? Clip.antiAlias,
        child: result,
      );
    } else {
      if (hasCustomShape) {
        result = PhysicalShape(
          color: color!,
          elevation: elevation ?? 0.0,
          shadowColor: shadowColor ?? Colors.black,
          clipBehavior: clipBehavior ?? Clip.antiAlias,
          clipper: clipper,
          child: result,
        );
      } else {
        result = PhysicalModel(
          color: color!,
          elevation: elevation ?? 0.0,
          shadowColor: shadowColor ?? Colors.black,
          clipBehavior: clipBehavior ?? Clip.antiAlias,
          borderRadius: borderRadius,
          shape: shape ?? BoxShape.rectangle,
          child: result,
        );
      }
    }

    if (margin != null) {
      result = Padding(padding: margin!, child: result);
    }

    if (tooltip != null) {
      return Tooltip(
        message: tooltip,
        child: child,
      );
    }

    return result;
  }
}
