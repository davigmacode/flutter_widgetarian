import 'package:flutter/widgets.dart';
import 'package:widgetarian/anchor.dart';
import 'package:widgetarian/animation.dart';
import 'package:widgetarian/layout.dart';

typedef ExpansionBuilder = Widget Function(
  BuildContext context,
  ExpansionController state,
  Widget? child,
);

//--------------------------------------------------------

class ExpansionController extends ChangeNotifier {
  ExpansionController({
    required bool expanded,
    ValueChanged<bool>? onChanged,
  })  : _expanded = expanded,
        _onChanged = onChanged;

  bool _expanded;
  final ValueChanged<bool>? _onChanged;

  bool get expanded => _expanded;
  bool get collapsed => !expanded;

  void assign(bool expanded) {
    if (_expanded != expanded) {
      _expanded = expanded;
      notifyListeners();
      _onChanged?.call(_expanded);
    }
  }

  void toggle([bool? expanded]) {
    if (expanded == null) {
      assign(!_expanded);
      return;
    }
    assign(expanded);
  }

  void expand() {
    toggle(true);
  }

  void collapse() {
    toggle(false);
  }
}

//--------------------------------------------------------

class ExpansionProvider extends InheritedNotifier<ExpansionController> {
  const ExpansionProvider({
    Key? key,
    required ExpansionController controller,
    required Widget child,
  }) : super(key: key, notifier: controller, child: child);

  static ExpansionController of(BuildContext context) {
    final ExpansionProvider? result =
        context.dependOnInheritedWidgetOfExactType<ExpansionProvider>();
    assert(result != null, 'No Expansion found in context');
    return result!.notifier!;
  }
}

//--------------------------------------------------------

class ExpansionConsumer extends StatelessWidget {
  const ExpansionConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  /// Builder that gets called when the expansion changes
  final ExpansionBuilder builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ExpansionProvider.of(context), child);
  }
}

//--------------------------------------------------------

typedef ExpansionButtonStyle = AnchorStyle;
typedef ExpansionButtonCallback = VoidCallback Function(
    ExpansionController state);

abstract class ExpansionButtonAction {
  static const ExpansionButtonCallback toggle = _toggle;
  static VoidCallback _toggle(ExpansionController state) => state.toggle;

  static const ExpansionButtonCallback expand = _expand;
  static VoidCallback _expand(ExpansionController state) => state.expand;

  static const ExpansionButtonCallback collapse = _collapse;
  static VoidCallback _collapse(ExpansionController state) => state.collapse;
}

class ExpansionButton extends StatelessWidget {
  const ExpansionButton({
    Key? key,
    this.action,
    this.style,
    this.padding,
    this.margin,
    this.borderRadius,
    this.overlayDisabled,
    this.disabled = false,
    required this.child,
  })  : shape = null,
        radius = null,
        super(key: key);

  const ExpansionButton.circle({
    Key? key,
    this.action,
    this.style,
    this.padding,
    this.margin,
    this.radius,
    this.overlayDisabled,
    this.disabled = false,
    required this.child,
  })  : shape = BoxShape.circle,
        borderRadius = null,
        super(key: key);

  final ExpansionButtonCallback? action;
  final ExpansionButtonStyle? style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool? overlayDisabled;
  final BoxShape? shape;
  final BorderRadius? borderRadius;
  final double? radius;
  final bool disabled;
  final Widget child;

  ExpansionButtonStyle get effectiveStyle =>
      ExpansionButtonStyle.from(style).copyWith(
        shape: shape,
        radius: radius,
        borderRadius: borderRadius,
        overlayDisabled: overlayDisabled,
        padding: padding,
        margin: margin,
      );

  @override
  Widget build(BuildContext context) {
    return ExpansionConsumer(
      child: child,
      builder: (context, state, child) {
        final callback = action ?? ExpansionButtonAction.toggle;
        return Anchor(
          style: effectiveStyle,
          onTap: callback(state),
          disabled: disabled,
          child: child,
        );
      },
    );
  }
}

class ExpansionToggle extends ExpansionButton {
  const ExpansionToggle({
    Key? key,
    super.style,
    super.padding,
    super.margin,
    super.borderRadius,
    super.overlayDisabled,
    super.disabled = false,
    required super.child,
  }) : super(key: key, action: ExpansionButtonAction.toggle);

  const ExpansionToggle.circle({
    Key? key,
    super.style,
    super.padding,
    super.margin,
    super.radius,
    super.overlayDisabled,
    super.disabled = false,
    required super.child,
  }) : super.circle(key: key, action: ExpansionButtonAction.toggle);
}

class ExpansionExpand extends ExpansionButton {
  const ExpansionExpand({
    Key? key,
    super.style,
    super.padding,
    super.margin,
    super.borderRadius,
    super.overlayDisabled,
    super.disabled = false,
    required super.child,
  }) : super(key: key, action: ExpansionButtonAction.expand);

  const ExpansionExpand.circle({
    Key? key,
    super.style,
    super.padding,
    super.margin,
    super.radius,
    super.overlayDisabled,
    super.disabled = false,
    required super.child,
  }) : super.circle(key: key, action: ExpansionButtonAction.expand);
}

class ExpansionCollapse extends ExpansionButton {
  const ExpansionCollapse({
    Key? key,
    super.style,
    super.padding,
    super.margin,
    super.borderRadius,
    super.overlayDisabled,
    super.disabled = false,
    required super.child,
  }) : super(key: key, action: ExpansionButtonAction.collapse);

  const ExpansionCollapse.circle({
    Key? key,
    super.style,
    super.padding,
    super.margin,
    super.radius,
    super.overlayDisabled,
    super.disabled = false,
    required super.child,
  }) : super.circle(key: key, action: ExpansionButtonAction.collapse);
}

//--------------------------------------------------------

class ExpansionIcon extends StatelessWidget {
  const ExpansionIcon({
    Key? key,
    this.icon,
    this.color,
    this.size,
    this.duration = defaultDuration,
    this.curve = defaultCurve,
  }) : super(key: key);

  static const defaultIcon = IconData(0xe246, fontFamily: 'MaterialIcons');
  static const defaultDuration = Duration(milliseconds: 200);
  static const defaultCurve = Curves.linear;

  final IconData? icon;
  final Color? color;
  final double? size;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return ExpansionConsumer(builder: (context, state, child) {
      return AnimatedIcon(
        icon: icon ?? defaultIcon,
        rotation: state.expanded ? 180 : 0,
        color: color,
        size: size,
      );
    });
  }
}

//--------------------------------------------------------

class ExpansionHeader extends StatelessWidget {
  const ExpansionHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.buttonStyle,
    this.tileStyle,
  }) : super(key: key);

  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final ExpansionButtonStyle? buttonStyle;
  final ListTileStyle? tileStyle;

  @override
  Widget build(BuildContext context) {
    return ExpansionButton(
      style: buttonStyle,
      child: ListTile(
        title: title,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
        style: tileStyle,
      ),
    );
  }
}

//--------------------------------------------------------

class ExpansionView extends StatelessWidget {
  const ExpansionView({
    Key? key,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.constraints,
    this.padding,
    required this.child,
  }) : super(key: key);

  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  BoxConstraints get effectiveConstraints {
    return (constraints ?? const BoxConstraints()).copyWith(
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: effectiveConstraints,
      child: SingleChildScrollView(
        padding: padding,
        child: child,
      ),
    );
  }
}

//--------------------------------------------------------

typedef ExpansionTransitionBuilder = AnimatedSwitcherTransitionBuilder;
typedef ExpansionLayoutBuilder = AnimatedSwitcherLayoutBuilder;

abstract class ExpansionTransition {
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

  static const ExpansionTransitionBuilder? crossFade = null;
}

abstract class ExpansionLayout {
  /// The new child is placed in a [Stack] that sizes itself to match the
  /// largest of the child or a previous child. The children are centered on
  /// each other.
  static const defaults = AnimatedSwitcher.defaultLayoutBuilder;
}

//--------------------------------------------------------

class Expansion extends StatelessWidget {
  const Expansion({
    Key? key,
    this.value = true,
    this.onChanged,
    this.duration = defaultDuration,
    this.curve = defaultCurve,
    this.transitionBuilder = ExpansionTransition.crossFade,
    this.layoutBuilder = ExpansionLayout.defaults,
    this.header,
    this.divider,
    this.collapsed,
    required this.child,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Duration duration;
  final Curve curve;

  /// A function that wraps a new [content] with an animation that transitions the [content] in when the animation runs in the forward direction and out when the animation runs in the reverse direction. This is only called when a new [content] is set (not for each build), or when a new [transitionBuilder] is set. If a new [transitionBuilder] is set, then the transition is rebuilt for the current content and all previous children using the new [transitionBuilder]. The function must not return null.
  final ExpansionTransitionBuilder? transitionBuilder;

  /// A function that wraps all of the children that are transitioning out, and the [child] that's transitioning in, with a widget that lays all of them out. This is called every time this widget is built. The function must not return null.
  final ExpansionLayoutBuilder layoutBuilder;

  final Widget? header;
  final Widget? divider;
  final Widget? collapsed;
  final Widget child;

  static const defaultDuration = Duration(milliseconds: 200);
  static const defaultCurve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return ExpansionProvider(
      controller: ExpansionController(
        expanded: value,
        onChanged: onChanged,
      ),
      child: ExpansionConsumer(
        builder: (context, state, _) {
          final needDivider =
              header != null && (state.expanded || collapsed != null);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              header,
              if (needDivider) divider,
              transitionBuilder != null
                  ? AnimatedSwitcher(
                      duration: duration,
                      switchInCurve: curve,
                      switchOutCurve: curve,
                      transitionBuilder: transitionBuilder!,
                      layoutBuilder: layoutBuilder,
                      child: state.expanded
                          ? child
                          : (collapsed ?? const SizedBox.shrink()),
                    )
                  : AnimatedCrossFade(
                      firstChild: collapsed ?? const Box(),
                      secondChild: child,
                      crossFadeState: state.expanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: duration,
                      sizeCurve: curve,
                      firstCurve: curve,
                      secondCurve: curve,
                    ),
            ].whereType<Widget>().toList(growable: false),
          );
        },
      ),
    );
  }
}
