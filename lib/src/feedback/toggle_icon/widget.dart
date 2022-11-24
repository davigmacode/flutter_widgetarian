import 'package:flutter/widgets.dart';
import 'package:widgetarian/animation.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/anchor.dart';
import 'style.dart';

class ToggleIcon extends StatefulWidget {
  const ToggleIcon({
    Key? key,
    this.selected = false,
    this.disabled = false,
    this.eventsController,
    this.onPressed,
    this.onSelected,
    this.style,
    required this.outerIcon,
    required this.innerIcon,
  }) : super(key: key);

  final bool selected;
  final bool disabled;
  final WidgetEventController? eventsController;
  final VoidCallback? onPressed;
  final ValueChanged<bool>? onSelected;
  final ToggleIconStyle? style;
  final IconData outerIcon;
  final IconData innerIcon;

  @override
  State<ToggleIcon> createState() => _ToggleIconState();
}

class _ToggleIconState extends State<ToggleIcon> with WidgetEventMixin {
  ToggleIconStyle style = const ToggleIconStyle();

  void onTap() {
    widgetEvents.toggle(WidgetEvent.pressed, false);
    widget.onPressed?.call();
    widget.onSelected?.call(!widget.selected);
  }

  void onTapCancel() {
    widgetEvents.toggle(WidgetEvent.pressed, false);
  }

  void onTapDown(TapDownDetails details) {
    widgetEvents.toggle(WidgetEvent.pressed, true);
  }

  void onHover(bool value) {
    widgetEvents.toggle(WidgetEvent.hovered, value);
  }

  void onFocus(bool value) {
    widgetEvents.toggle(WidgetEvent.focused, value);
  }

  @protected
  void setStyle() {
    final resolved = ToggleIconStyle.evaluate(widget.style, widgetEvents.value);
    style = ToggleIconStyle.from(resolved);
    setState(() {});
  }

  @override
  void initState() {
    initWidgetEvents(widget.eventsController);
    widgetEvents.toggle(WidgetEvent.disabled, widget.disabled);
    widgetEvents.toggle(WidgetEvent.selected, widget.selected);
    setStyle();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    didUpdateWidget(widget);
  }

  @override
  void didUpdateWidget(ToggleIcon oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(WidgetEvent.disabled, widget.disabled);
      widgetEvents.toggle(WidgetEvent.selected, widget.selected);
      setStyle();
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void didChangeWidgetEvents() {
    if (mounted) {
      setStyle();
      super.didChangeWidgetEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Anchor(
      shape: BoxShape.circle,
      overlayColor: style.overlayColor,
      radius: style.overlayRadius ?? 20,
      onTap: onTap,
      onTapDown: onTapDown,
      onTapCancel: onTapCancel,
      onHover: onHover,
      onFocus: onFocus,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedIconTheme(
            data: IconThemeData(
              color: style.outerColor,
              opacity: style.outerOpacity,
              size: style.size,
            ),
            child: Icon(widget.outerIcon),
          ),
          AnimatedIcon(
            color: style.innerColor,
            opacity: style.innerOpacity,
            scale: style.innerScale,
            size: style.size,
            icon: widget.innerIcon,
          ),
        ],
      ),
    );
  }
}
