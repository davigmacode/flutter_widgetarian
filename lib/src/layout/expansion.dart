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

class ExpansionButton extends StatelessWidget {
  const ExpansionButton({
    Key? key,
    this.style,
    required this.child,
  }) : super(key: key);

  final ExpansionButtonStyle? style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ExpansionConsumer(
      child: child,
      builder: (context, state, child) {
        return Anchor(
          style: style,
          onTap: state.toggle,
          child: child,
        );
      },
    );
  }
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

class Expansion extends StatelessWidget {
  const Expansion({
    Key? key,
    this.value = true,
    this.onChanged,
    this.duration = defaultDuration,
    this.curve = defaultCurve,
    this.header,
    this.divider,
    this.collapsed,
    required this.child,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool>? onChanged;
  final Duration duration;
  final Curve curve;

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
              AnimatedCrossFade(
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
