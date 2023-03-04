import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/anchor.dart';
import 'style.dart';
import 'theme_data.dart';
import 'event.dart';

class CheckboxRender extends StatefulWidget {
  const CheckboxRender({
    Key? key,
    this.tooltip,
    this.selected = false,
    this.indeterminate = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.eventsController,
    this.duration,
    this.curve,
    this.style,
    required this.theme,
  }) : super(key: key);

  final String? tooltip;
  final bool selected;
  final bool indeterminate;
  final bool disabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onChanged;
  final CheckboxEventController? eventsController;
  final Duration? duration;
  final Curve? curve;
  final CheckboxStyle? style;
  final CheckboxThemeData theme;

  bool get enabled => !disabled;

  bool get hasCallback {
    return onChanged != null;
  }

  @override
  CheckboxRenderState createState() => CheckboxRenderState();
}

class CheckboxRenderState extends State<CheckboxRender>
    with WidgetEventMixin<CheckboxRender> {
  Curve get curve => widget.curve ?? widget.theme.curve;
  Duration get duration => widget.duration ?? widget.theme.duration;

  CheckboxStyle style = const CheckboxStyle();

  void setStyle() {
    final raw = widget.style;
    final fallback = widget.theme.style;
    final driven = fallback.merge(raw);
    final evaluated = DrivenCheckboxStyle.evaluate(driven, widgetEvents.value);

    style = CheckboxStyle.from(evaluated);
    setState(() {});
  }

  Color? get checkmarkColor => Colors.withTransparency(
        style.checkmarkColor ?? Colors.onSurface(backgroundColor),
        opacity: style.checkmarkOpacity,
        alpha: style.checkmarkAlpha,
      );

  Color? get backgroundColor => Colors.withTransparency(
        style.backgroundColor,
        opacity: style.backgroundOpacity,
        alpha: style.backgroundAlpha,
      );

  Color? get borderColor {
    return Colors.withTransparency(
      style.borderColor,
      opacity: style.borderOpacity,
      alpha: style.borderAlpha,
    );
  }

  BorderSide get borderSide {
    return BorderSide(
      color: borderColor ?? Colors.black,
      width: style.borderWidth ?? 0,
      style: style.borderStyle ?? BorderStyle.none,
    );
  }

  ShapeBorder get border {
    return style.shape == BoxShape.rectangle
        ? RoundedRectangleBorder(
            borderRadius: style.borderRadius ?? BorderRadius.zero,
            side: borderSide,
          )
        : CircleBorder(side: borderSide);
  }

  void onTap() {
    widgetEvents.toggle(CheckboxEvent.pressed, false);
    widget.onChanged?.call(!widget.selected);
  }

  void onTapCancel() {
    widgetEvents.toggle(CheckboxEvent.pressed, false);
  }

  void onTapDown(TapDownDetails details) {
    widgetEvents.toggle(CheckboxEvent.pressed, true);
  }

  void onHover(bool value) {
    widgetEvents.toggle(CheckboxEvent.hovered, value);
  }

  void onFocus(bool value) {
    widgetEvents.toggle(CheckboxEvent.focused, value);
  }

  @override
  void initState() {
    initWidgetEvents(widget.eventsController);
    widgetEvents.toggle(CheckboxEvent.indeterminate, widget.indeterminate);
    widgetEvents.toggle(CheckboxEvent.selected, widget.selected);
    widgetEvents.toggle(CheckboxEvent.disabled, widget.disabled);
    setStyle();
    super.initState();
  }

  @override
  void didUpdateWidget(CheckboxRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(CheckboxEvent.indeterminate, widget.indeterminate);
      widgetEvents.toggle(CheckboxEvent.selected, widget.selected);
      widgetEvents.toggle(CheckboxEvent.disabled, widget.disabled);
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
    Widget result = AnimatedCheckmark(
      duration: duration,
      curve: curve,
      fill: backgroundColor,
      color: checkmarkColor,
      weight: style.checkmarkWeight,
      padding: style.checkmarkInset,
      size: style.size,
      shape: border,
      value: widget.indeterminate ? null : widget.selected,
    );

    if (style.padding != null) {
      result = Padding(
        padding: style.padding!,
        child: result,
      );
    }

    if (widget.hasCallback) {
      result = Anchor(
        disabled: widget.disabled,
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
