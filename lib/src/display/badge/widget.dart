import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/layout.dart';
import 'style.dart';
import 'theme.dart';

typedef BadgeTransitionBuilder = ExpansionTransitionBuilder;
typedef BadgeLayoutBuilder = ExpansionLayoutBuilder;
typedef BadgeTransition = ExpansionTransition;
typedef BadgeLayout = ExpansionLayout;

/// Display element at the corner of another element
class Badge extends StatelessWidget {
  /// Create a badge widget
  const Badge({
    Key? key,
    this.duration,
    this.curve,
    this.transitionBuilder = BadgeTransition.scale,
    this.layoutBuilder = BadgeLayout.defaults,
    this.hidden = false,
    this.alignment,
    this.offset,
    this.style,
    this.content,
    required this.child,
  }) : super(key: key);

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

  /// A function that wraps a new [content] with an animation that transitions the [content] in when the animation runs in the forward direction and out when the animation runs in the reverse direction. This is only called when a new [content] is set (not for each build), or when a new [transitionBuilder] is set. If a new [transitionBuilder] is set, then the transition is rebuilt for the current content and all previous children using the new [transitionBuilder]. The function must not return null.
  final BadgeTransitionBuilder transitionBuilder;

  /// A function that wraps all of the children that are transitioning out, and the [child] that's transitioning in, with a widget that lays all of them out. This is called every time this widget is built. The function must not return null.
  final BadgeLayoutBuilder layoutBuilder;

  /// Whether or not this badge is hidden.
  ///
  /// Must not be null. Defaults to false.
  final bool hidden;

  /// How to align the badge with the [child].
  final AlignmentGeometry? alignment;

  /// Translate the badge with this offset.
  final Offset? offset;

  /// The style to be applied to the badge.
  final BadgeStyle? style;

  ///  The primary content of the badge.
  final String? content;

  /// The widget below this widget in the tree.
  final Widget child;

  bool get visible => !hidden;

  bool get hasContent => content != null;

  @override
  Widget build(BuildContext context) {
    final badgeTheme = BadgeTheme.of(context);
    final badgeStyle = badgeTheme.style.merge(style);
    final effectiveAlignment = alignment ?? badgeTheme.alignment;
    final effectiveOffset = offset ?? badgeTheme.offset;
    final effectiveCurve = curve ?? badgeTheme.curve;
    final effectiveDuration = duration ?? badgeTheme.duration;
    return Stack(
      alignment: effectiveAlignment,
      clipBehavior: Clip.none,
      children: <Widget>[
        child,
        Positioned(
          child: Transform.translate(
            offset: effectiveOffset,
            child: Expansion(
              duration: effectiveDuration,
              curve: effectiveCurve,
              transitionBuilder: transitionBuilder,
              layoutBuilder: layoutBuilder,
              value: visible,
              child: Sheet(
                key: ValueKey(content),
                curve: effectiveCurve,
                duration: effectiveDuration,
                style: badgeStyle,
                child: hasContent ? Text(content!) : null,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Curve?>('curve', curve));
    properties.add(DiagnosticsProperty<Duration?>('duration', duration));
    properties.add(DiagnosticsProperty<bool>('hidden', hidden));
    properties
        .add(DiagnosticsProperty<AlignmentGeometry?>('alignment', alignment));
    properties.add(DiagnosticsProperty<Offset?>('offset', offset));
    properties.add(DiagnosticsProperty<BadgeStyle?>('style', style));
    properties.add(StringProperty('content', content));
  }
}
