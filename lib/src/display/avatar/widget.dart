import 'package:flutter/material.dart' show Theme;
import 'package:flutter/widgets.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/animation.dart';
import 'style.dart';

class Avatar extends StatefulWidget {
  const Avatar({
    Key? key,
    this.curve = Curves.linear,
    this.duration = const Duration(milliseconds: 200),
    this.style,
    this.tooltip,
    this.onImageError,
    this.image,
    this.alt,
    this.child,
  }) : super(key: key);

  /// The curve to apply when animating the parameters of this widget.
  final Curve curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration duration;

  /// The style to be applied to the avatar.
  final AvatarStyle? style;

  /// Tooltip string to be used for the body area of the button.
  final String? tooltip;

  /// An optional error callback for errors emitted when loading [image].
  final ImageErrorListener? onImageError;

  /// The background image of the circle. Changing the background
  /// image will cause the avatar to animate to the new image.
  ///
  /// If the [Avatar] is to have the user's initials, use [child] instead.
  final ImageProvider? image;

  /// If there is an error loading the avatar image,
  /// the component falls back to an alternative widget.
  final Widget? alt;

  /// The widget below this widget in the tree.
  final Widget? child;

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  AvatarStyle get style => const AvatarStyle().merge(widget.style);

  Size get size => Size.square(style.size ?? AvatarStyle.defaultSize);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget? result = widget.child;

    if (result != null) {
      result = Center(
        child: MediaQuery(
          // Need to ignore the ambient textScaleFactor here so that the
          // text doesn't escape the avatar when the textScaleFactor is large.
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: AnimatedDefaultTextStyle(
            curve: widget.curve,
            duration: widget.duration,
            style: style.effectiveForegroundStyle,
            child: AnimatedIconTheme(
              data: theme.iconTheme.copyWith(
                color: style.effectiveForegroundStyle.color,
                size: style.effectiveForegroundStyle.fontSize,
              ),
              curve: widget.curve,
              duration: widget.duration,
              child: result,
            ),
          ),
        ),
      );
    }

    if (widget.image != null) {
      result = DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: widget.image!,
            onError: widget.onImageError,
            fit: BoxFit.cover,
          ),
        ),
        child: result,
      );
    }

    return AnimatedBox(
      curve: widget.curve,
      duration: widget.duration,
      width: size.width,
      height: size.height,
      margin: style.margin,
      clipBehavior: style.clipBehavior ?? AvatarStyle.defaultClipBehavior,
      shadowColor: style.shadowColor,
      elevation: style.elevation,
      color: style.effectiveBackgroundColor ?? Colors.transparent,
      shape: style.shape ?? AvatarStyle.defaultShape,
      borderColor: style.effectiveBorderColor,
      borderWidth: style.borderWidth ?? AvatarStyle.defaultBorderWidth,
      borderStyle: style.borderStyle ?? AvatarStyle.defaultBorderStyle,
      borderRadius: style.borderRadius ?? AvatarStyle.defaultBorderRadius,
      tooltip: widget.tooltip,
      child: result,
    );
  }
}
