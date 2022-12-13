import 'package:flutter/widgets.dart';
import 'package:widgetarian/layout.dart';
import 'style.dart';
import 'theme.dart';

typedef BadgeTransitionBuilder = AnimatedSwitcherTransitionBuilder;
typedef BadgeLayoutBuilder = AnimatedSwitcherLayoutBuilder;

abstract class BadgeTransition {
  /// The new child is given a [FadeTransition] which increases opacity as
  /// the animation goes from 0.0 to 1.0, and decreases when the animation is
  /// reversed.
  static const fade = AnimatedSwitcher.defaultTransitionBuilder;

  static const scale = _scale;
  static Widget _scale(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }
}

abstract class BadgeLayout {
  /// The new child is placed in a [Stack] that sizes itself to match the
  /// largest of the child or a previous child. The children are centered on
  /// each other.
  static const defaults = AnimatedSwitcher.defaultLayoutBuilder;
}

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    this.duration = Badge.defaultDuration,
    this.curve = Curves.linear,
    this.transitionBuilder = BadgeTransition.scale,
    this.layoutBuilder = BadgeLayout.defaults,
    this.hidden = false,
    this.style,
    this.content,
    required this.child,
  }) : super(key: key);

  static const defaultDuration = Duration(milliseconds: 200);

  final Duration duration;
  final Curve curve;
  final BadgeTransitionBuilder transitionBuilder;
  final BadgeLayoutBuilder layoutBuilder;
  final bool hidden;
  final BadgeStyle? style;
  final String? content;
  final Widget child;

  bool get visible => !hidden;

  bool get hasContent => content != null;

  @override
  Widget build(BuildContext context) {
    final themedStyle = BadgeTheme.of(context).style.merge(style);
    return Stack(
      alignment: themedStyle.alignment!,
      clipBehavior: Clip.none,
      children: <Widget>[
        child,
        Positioned(
          child: Transform.translate(
            offset: themedStyle.offset!,
            child: AnimatedSwitcher(
              duration: duration,
              switchInCurve: curve,
              switchOutCurve: curve,
              transitionBuilder: transitionBuilder,
              layoutBuilder: layoutBuilder,
              child: visible
                  ? Sheet(
                      key: ValueKey(content),
                      curve: curve,
                      duration: duration,
                      style: themedStyle.sheetStyle,
                      child: hasContent ? Text(content!) : null,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ),
      ],
    );
  }
}
