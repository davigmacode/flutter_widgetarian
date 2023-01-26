import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/animation.dart';
import 'package:widgetarian/event.dart';
import 'style.dart';
import 'theme.dart';

class ToggleIcon extends StatelessWidget {
  const ToggleIcon(
    this.icon, {
    Key? key,
    this.backIcon,
    this.selected = false,
    this.disabled = false,
    this.style,
    this.curve,
    this.duration,
    this.eventsController,
  }) : super(key: key);

  /// The icon to display. The available icons are described in [Icons].
  final IconData icon;

  /// The alternate icon to display back of the main icon.
  /// Usually for outlined version of the main icon.
  final IconData? backIcon;

  /// Whether or not this toggle icon is selected.
  ///
  /// Must not be null. Defaults to false.
  final bool selected;

  /// Whether or not this toggle icon is indeterminate.
  ///
  /// Must not be null. Defaults to false.
  final bool disabled;

  /// The style to be applied to the toggle icon.
  ///
  /// If [style] is an event driven [ToggleIconStyle]
  /// by [DrivenToggleIconStyle], then [ToggleIconStyle.evaluate]
  /// is used for the following [ToggleIconEvent]s:
  ///
  ///  * [ToggleIconEvent.selected].
  ///  * [ToggleIconEvent.disabled].
  final ToggleIconStyle? style;

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  final WidgetEventController? eventsController;

  @override
  Widget build(BuildContext context) {
    final theme = ToggleIconTheme.of(context);
    return _RenderToggleIcon(
      icon,
      backIcon: backIcon,
      curve: curve ?? theme.curve,
      duration: duration ?? theme.duration,
      style: theme.style.merge(style),
      selected: selected,
      disabled: disabled,
      eventsController: eventsController,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<IconData>('icon', icon));
    properties.add(DiagnosticsProperty<IconData>('backIcon', backIcon));
    properties.add(DiagnosticsProperty<ToggleIconStyle?>('style', style));
    properties.add(DiagnosticsProperty<bool>('selected', selected));
    properties.add(DiagnosticsProperty<bool>('disabled', disabled));
  }
}

class _RenderToggleIcon extends StatefulWidget {
  const _RenderToggleIcon(
    this.icon, {
    Key? key,
    required this.curve,
    required this.duration,
    required this.style,
    this.backIcon,
    this.selected = false,
    this.disabled = false,
    this.eventsController,
  }) : super(key: key);

  final Curve curve;
  final Duration duration;
  final IconData icon;
  final IconData? backIcon;
  final ToggleIconStyle style;
  final bool selected;
  final bool disabled;
  final WidgetEventController? eventsController;

  @override
  State<_RenderToggleIcon> createState() => _RenderToggleIconState();
}

class _RenderToggleIconState extends State<_RenderToggleIcon>
    with WidgetEventMixin {
  ToggleIconStyle get style {
    final raw = widget.style;
    final res = DrivenToggleIconStyle.evaluate(raw, widgetEvents.value);
    return ToggleIconStyle.from(res);
  }

  @override
  void initState() {
    initWidgetEvents(widget.eventsController);
    widgetEvents.toggle(WidgetEvent.selected, widget.selected);
    widgetEvents.toggle(WidgetEvent.disabled, widget.disabled);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    didUpdateWidget(widget);
  }

  @override
  void didUpdateWidget(_RenderToggleIcon oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(WidgetEvent.selected, widget.selected);
      widgetEvents.toggle(WidgetEvent.disabled, widget.disabled);
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void didChangeWidgetEvents() {
    if (mounted) {
      super.didChangeWidgetEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedIconTheme(
          curve: widget.curve,
          duration: widget.duration,
          data: IconThemeData(
            color: style.backColor,
            opacity: style.backOpacity,
            size: style.size,
          ),
          child: Icon(widget.backIcon ?? widget.icon),
        ),
        AnimatedIcon(
          curve: widget.curve,
          duration: widget.duration,
          color: style.color,
          opacity: style.opacity,
          scale: style.scale,
          size: style.size,
          icon: widget.icon,
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    style.debugFillProperties(properties);
  }
}
