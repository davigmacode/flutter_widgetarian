import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/anchor.dart';
import 'event.dart';
import 'style.dart';
import 'theme_data.dart';

/// Chip widget with smooth animation, event driven style, and many more.
class SwitchRender extends StatefulWidget {
  const SwitchRender({
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
  final SwitchEventController? eventsController;
  final Curve? curve;
  final Duration? duration;
  final SwitchStyle? style;
  final SwitchThemeData theme;

  bool get enabled => !disabled;

  bool get canTap => enabled && hasCallback;

  bool get hasCallback {
    return onChanged != null;
  }

  @override
  SwitchRenderState createState() => SwitchRenderState();
}

class SwitchRenderState extends State<SwitchRender>
    with WidgetEventMixin<SwitchRender> {
  Curve get curve => widget.curve ?? widget.theme.curve;

  Duration get duration => widget.duration ?? widget.theme.duration;

  SwitchStyle get style {
    final raw = widget.style;
    final fallback = widget.theme.style;
    final driven = fallback.merge(raw);
    final evaluated = DrivenSwitchStyle.evaluate(driven, widgetEvents.value);
    return SwitchStyle.from(evaluated);
  }

  Color? get trackBorderColor => Colors.withTransparency(
        style.trackBorderColor,
        opacity: style.trackBorderOpacity,
        alpha: style.trackBorderAlpha,
      );

  Color? get trackColor => Colors.withTransparency(
        style.trackColor,
        opacity: style.trackOpacity,
        alpha: style.trackAlpha,
      );

  Color? get thumbColor => Colors.withTransparency(
        style.thumbColor,
        opacity: style.thumbOpacity,
        alpha: style.thumbAlpha,
      );

  ShapeBorder get thumbShape {
    return style.thumbShape ?? const CircleBorder();
  }

  void onTap() {
    widgetEvents.toggle(SwitchEvent.pressed, false);
    widget.onChanged?.call(!widget.selected);
  }

  void onTapCancel() {
    widgetEvents.toggle(SwitchEvent.pressed, false);
  }

  void onTapDown(TapDownDetails details) {
    widgetEvents.toggle(SwitchEvent.pressed, true);
  }

  void onHover(bool value) {
    widgetEvents.toggle(SwitchEvent.hovered, value);
  }

  void onFocus(bool value) {
    widgetEvents.toggle(SwitchEvent.focused, value);
  }

  @override
  void initState() {
    initWidgetEvents(widget.eventsController);
    widgetEvents.toggle(SwitchEvent.indeterminate, widget.indeterminate);
    widgetEvents.toggle(SwitchEvent.selected, widget.selected);
    widgetEvents.toggle(SwitchEvent.disabled, widget.disabled);
    super.initState();
  }

  @override
  void didUpdateWidget(SwitchRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(SwitchEvent.indeterminate, widget.indeterminate);
      widgetEvents.toggle(SwitchEvent.selected, widget.selected);
      widgetEvents.toggle(SwitchEvent.disabled, widget.disabled);
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
    Widget result = AnimatedSwitchmark(
      duration: duration,
      curve: curve,
      trackColor: trackColor,
      trackBorderColor: trackBorderColor,
      trackBorderWidth: style.trackBorderWidth,
      trackBorderRadius: style.trackBorderRadius,
      trackHeight: style.trackHeight,
      thumbShape: thumbShape,
      thumbColor: thumbColor,
      thumbInset: style.thumbInset,
      thumbSize: style.thumbSize,
      thumbShadow: style.thumbShadow,
      thumbElevation: style.thumbElevation,
      overlayColor: style.overlayColor,
      overlayOpacity: style.overlayOpacity,
      overlayRadius: style.overlayRadius,
      size: style.size,
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
        shape: BoxShape.circle,
        overlayDisabled: true,
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
