import 'package:flutter/material.dart';

class Anchor extends StatelessWidget {
  const Anchor({
    Key? key,
    this.onTap,
    this.onTapUp,
    this.onTapDown,
    this.onTapCancel,
    this.onLongTap,
    this.onDoubleTap,
    this.onHover,
    this.onFocus,
    this.overlayColor,
    this.splashColor,
    this.splashFactory,
    this.mouseCursor,
    this.radius,
    this.padding,
    this.margin,
    this.focusNode,
    this.autofocus = false,
    this.useMaterial = true,
    this.disabled = false,
    this.shape = BoxShape.rectangle,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onTap;
  final GestureTapUpCallback? onTapUp;
  final GestureTapDownCallback? onTapDown;
  final VoidCallback? onTapCancel;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongTap;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocus;
  final Color? overlayColor;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final MouseCursor? mouseCursor;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool useMaterial;
  final FocusNode? focusNode;
  final bool autofocus;
  final BoxShape shape;
  final bool disabled;
  final Widget child;

  bool get enabled => !disabled;

  @override
  Widget build(BuildContext context) {
    Widget result = child;

    if (padding != null) {
      result = Padding(padding: padding!, child: result);
    }

    result = InkResponse(
      containedInkWell: shape == BoxShape.rectangle,
      mouseCursor: mouseCursor ?? MaterialStateMouseCursor.clickable,
      overlayColor: MaterialStateProperty.all<Color?>(overlayColor),
      splashColor: splashColor,
      splashFactory: splashFactory,
      onTap: enabled ? onTap : null,
      onTapCancel: enabled ? onTapCancel : null,
      onTapDown: enabled ? onTapDown : null,
      onTapUp: enabled ? onTapUp : null,
      onDoubleTap: enabled ? onDoubleTap : null,
      onLongPress: enabled ? onLongTap : null,
      onHover: onHover,
      onFocusChange: onFocus,
      canRequestFocus: enabled,
      autofocus: autofocus,
      focusNode: focusNode,
      highlightShape: shape,
      radius: radius,
      child: result,
    );

    if (useMaterial) {
      result = Material(
        type: MaterialType.transparency,
        child: result,
      );
    }

    if (margin != null) {
      result = Padding(padding: margin!, child: result);
    }

    return result;
  }
}
