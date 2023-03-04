import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/anchor.dart';
import 'event.dart';
import 'style.dart';
import 'theme_data.dart';

/// Chip widget with smooth animation, event driven style, and many more.
class RadioRender extends StatefulWidget {
  const RadioRender({
    Key? key,
    this.tooltip,
    this.onChanged,
    this.selected = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.eventsController,
    this.duration,
    this.curve,
    this.style,
    required this.theme,
  }) : super(key: key);

  final String? tooltip;
  final bool selected;
  final bool disabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onChanged;
  final RadioEventController? eventsController;
  final Duration? duration;
  final Curve? curve;
  final RadioStyle? style;
  final RadioThemeData theme;

  bool get enabled => !disabled;

  bool get canTap => enabled && hasCallback;

  bool get hasCallback {
    return onChanged != null;
  }

  @override
  RadioRenderState createState() => RadioRenderState();
}

class RadioRenderState extends State<RadioRender>
    with WidgetEventMixin<RadioRender> {
  Curve get curve => widget.curve ?? widget.theme.curve;
  Duration get duration => widget.duration ?? widget.theme.duration;

  RadioStyle style = const RadioStyle();

  void setStyle() {
    final raw = widget.style;
    final fallback = widget.theme.style;
    final driven = fallback.merge(raw);
    final evaluated = DrivenRadioStyle.evaluate(driven, widgetEvents.value);

    style = RadioStyle.from(evaluated);
    setState(() {});
  }

  Color? get thumbColor => Colors.withTransparency(
        style.thumbColor,
        opacity: style.thumbOpacity,
        alpha: style.thumbAlpha,
      );

  Color? get backgroundColor => Colors.withTransparency(
        style.backgroundColor,
        opacity: style.backgroundOpacity,
        alpha: style.backgroundAlpha,
      );

  Color get borderColor => Colors.withTransparency(
        style.borderColor,
        opacity: style.borderOpacity,
        alpha: style.borderAlpha,
      )!;

  BorderSide get borderSide {
    return BorderSide(
      color: borderColor,
      width: style.borderWidth!,
      style: style.borderStyle!,
    );
  }

  ShapeBorder get border {
    return style.shape == BoxShape.rectangle
        ? RoundedRectangleBorder(
            borderRadius: style.borderRadius!,
            side: borderSide,
          )
        : CircleBorder(side: borderSide);
  }

  void onTap() {
    widgetEvents.toggle(RadioEvent.pressed, false);
    widget.onChanged?.call(!widget.selected);
  }

  void onTapCancel() {
    widgetEvents.toggle(RadioEvent.pressed, false);
  }

  void onTapDown(TapDownDetails details) {
    widgetEvents.toggle(RadioEvent.pressed, true);
  }

  void onHover(bool value) {
    widgetEvents.toggle(RadioEvent.hovered, value);
  }

  void onFocus(bool value) {
    widgetEvents.toggle(RadioEvent.focused, value);
  }

  @override
  void initState() {
    initWidgetEvents(widget.eventsController);
    widgetEvents.toggle(RadioEvent.selected, widget.selected);
    widgetEvents.toggle(RadioEvent.disabled, widget.disabled);
    setStyle();
    super.initState();
  }

  @override
  void didUpdateWidget(RadioRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(RadioEvent.selected, widget.selected);
      widgetEvents.toggle(RadioEvent.disabled, widget.disabled);
      setStyle();
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void didChangeWidgetEvents() {
    if (mounted) {
      super.didChangeWidgetEvents();
      didUpdateWidget(widget);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget result = AnimatedRadiomark(
      duration: duration,
      curve: curve,
      color: thumbColor,
      fill: backgroundColor,
      shape: border,
      padding: style.thumbInset,
      size: style.size,
    );

    if (style.padding != null) {
      result = Padding(
        padding: style.padding!,
        child: result,
      );
    }

    if (widget.hasCallback) {
      result = Anchor(
        shape: BoxShape.circle,
        overlayColor: style.overlayColor,
        overlayOpacity: style.overlayOpacity,
        overlayDisabled: style.overlayDisabled,
        radius: style.overlayRadius,
        onTap: onTap,
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        onHover: onHover,
        child: result,
      );
    }

    if (style.margin != null) {
      result = Padding(
        padding: style.margin!,
        child: result,
      );
    }

    return result;
  }
}
