import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/animation.dart';
import 'theme.dart';
import 'style.dart';

/// Display user profile image, initials or fallback icon
class Avatar extends StatefulWidget {
  /// Create an avatar widget
  const Avatar({
    Key? key,
    this.curve,
    this.duration,
    this.style,
    this.tooltip,
    this.onImageError,
    this.image,
    this.alt,
    this.child,
  }) : super(key: key);

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AvatarStyle?>('style', style));
  }
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    final theme = AvatarTheme.of(context);
    final style = theme.style.merge(widget.style);
    final curve = widget.curve ?? theme.curve;
    final duration = widget.duration ?? theme.duration;
    Widget? result = widget.child;

    if (result != null) {
      result = Center(
        child: MediaQuery(
          // Need to ignore the ambient textScaleFactor here so that the
          // text doesn't escape the avatar when the textScaleFactor is large.
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: AnimatedDefaultTextStyle(
            curve: curve,
            duration: duration,
            style: style.effectiveForegroundStyle,
            child: AnimatedIconTheme.merge(
              data: IconThemeData(
                color: style.effectiveForegroundStyle.color,
                size: style.effectiveForegroundStyle.fontSize,
              ),
              curve: curve,
              duration: duration,
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
      curve: curve,
      duration: duration,
      width: style.effectiveSize.width,
      height: style.effectiveSize.height,
      margin: style.margin,
      clipBehavior: style.clipBehavior,
      shadowColor: style.shadowColor,
      elevation: style.elevation,
      color: style.effectiveBackgroundColor,
      shape: style.shape,
      borderColor: style.effectiveBorderColor,
      borderWidth: style.borderWidth,
      borderStyle: style.borderStyle,
      borderRadius: style.borderRadius,
      tooltip: widget.tooltip,
      child: result,
    );
  }
}
