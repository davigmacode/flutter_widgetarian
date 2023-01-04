import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/anchor.dart';
import 'event.dart';
import 'style.dart';
import 'theme.dart';

/// Switches toggle the state of a single setting on or off.
class Switch extends StatelessWidget {
  const Switch({
    Key? key,
    this.style,
    this.tooltip,
    this.onChanged,
    this.selected = false,
    this.indeterminate = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.eventsController,
    this.curve,
    this.duration,
  }) : super(key: key);

  /// {@template widgetarian.switch.style}
  /// The style to be applied to the switch.
  ///
  /// If [style] is an event driven [SwitchStyle]
  /// by [DrivenSwitchStyle.driven], then [DrivenSwitchStyle.evaluate]
  /// is used for the following [SwitchEvent]s:
  ///
  ///  * [SwitchEvent.selected].
  ///  * [SwitchEvent.indeterminate].
  ///  * [SwitchEvent.focused].
  ///  * [SwitchEvent.hovered].
  ///  * [SwitchEvent.pressed].
  ///  * [SwitchEvent.disabled].
  /// {@endtemplate}
  final SwitchStyle? style;

  /// {@template widgetarian.switch.tooltip}
  /// Tooltip string to be used for the body area of the switch.
  /// {@endtemplate}
  final String? tooltip;

  /// {@template widgetarian.switch.onChanged}
  /// Called when the chip should change between selected and de-selected
  /// states.
  ///
  /// When the chip is tapped, then the [onChanged] callback, if set, will be
  /// applied to `!selected` (see [selectedStyle]).
  ///
  /// The chip passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the chip with the new
  /// value.
  ///
  /// The callback provided to [onChanged] should update the state of the
  /// parent [StatefulWidget] using the [State.setState] method, so that the
  /// parent gets rebuilt.
  ///
  /// {@tool snippet}
  ///
  /// A [StatefulWidget] that illustrates use of onSelected in an [InputChip].
  ///
  /// ```dart
  /// class Wood extends StatefulWidget {
  ///   const Wood({Key? key}) : super(key: key);
  ///
  ///   @override
  ///   State<StatefulWidget> createState() => WoodState();
  /// }
  ///
  /// class WoodState extends State<Wood> {
  ///   bool _useChisel = false;
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return Chip(
  ///       label: const Text('Use Chisel'),
  ///       selected: _useChisel,
  ///       onSelected: (bool newValue) {
  ///         setState(() {
  ///           _useChisel = newValue;
  ///         });
  ///       },
  ///     );
  ///   }
  /// }
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  final ValueChanged<bool>? onChanged;

  /// {@template widgetarian.switch.selected}
  /// Whether or not this switch is selected.
  ///
  /// Must not be null. Defaults to false.
  /// {@endtemplate}
  final bool selected;

  /// {@template widgetarian.switch.indeterminate}
  /// Whether or not this switch is indeterminate.
  ///
  /// Must not be null. Defaults to false.
  /// {@endtemplate}
  final bool indeterminate;

  /// {@template widgetarian.switch.disabled}
  /// Whether or not this switch is disabled for input.
  ///
  /// Defaults to false. Cannot be null.
  /// {@endtemplate}
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@template widgetarian.switch.eventsController}
  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  /// {@endtemplate}
  final SwitchEventController? eventsController;

  /// {@template widgetarian.switch.curve}
  /// The curve to apply when animating the parameters of this widget.
  /// {@endtemplate}
  final Curve? curve;

  /// {@template widgetarian.switch.duration}
  /// The duration over which to animate the parameters of this widget.
  /// {@endtemplate}
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    final theme = SwitchTheme.of(context);
    return _SwitchRender(
      tooltip: tooltip,
      selected: selected,
      onChanged: onChanged,
      indeterminate: indeterminate,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      eventsController: eventsController,
      duration: duration ?? theme.duration,
      curve: curve ?? theme.curve,
      style: theme.style.merge(style),
      fallback: theme.fallback,
    );
  }
}

/// Chip widget with smooth animation, event driven style, and many more.
class _SwitchRender extends StatefulWidget {
  const _SwitchRender({
    Key? key,
    this.tooltip,
    this.selected = false,
    this.indeterminate = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.eventsController,
    required this.duration,
    required this.curve,
    required this.style,
    required this.fallback,
  }) : super(key: key);

  final String? tooltip;
  final bool selected;
  final bool indeterminate;
  final bool disabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onChanged;
  final SwitchEventController? eventsController;
  final Curve curve;
  final Duration duration;
  final SwitchStyle style;
  final SwitchStyle fallback;

  bool get enabled => !disabled;

  bool get canTap => enabled && hasCallback;

  bool get hasCallback {
    return onChanged != null;
  }

  @override
  _SwitchRenderState createState() => _SwitchRenderState();
}

class _SwitchRenderState extends State<_SwitchRender>
    with WidgetEventMixin<_SwitchRender> {
  SwitchStyle style = const SwitchStyle();
  SwitchStyle fallback = const SwitchStyle();

  @protected
  void setStyle() {
    final rawStyle = widget.style;
    final resStyle = DrivenSwitchStyle.evaluate(rawStyle, widgetEvents.value);
    style = SwitchStyle.from(resStyle);

    final rawFallback = widget.fallback;
    final resFallback =
        DrivenSwitchStyle.evaluate(rawFallback, widgetEvents.value);
    fallback = SwitchStyle.from(resFallback);
    setState(() {});
  }

  Color? get trackColor => Colors.withTransparency(
        style.trackColor ?? fallback.trackColor,
        opacity: style.trackOpacity,
        alpha: style.trackAlpha,
      );

  Color? get thumbColor => Colors.withTransparency(
        style.thumbColor ?? fallback.thumbColor,
        opacity: style.thumbOpacity,
        alpha: style.thumbAlpha,
      );

  ShapeBorder get trackShape {
    return style.trackShape ?? const StadiumBorder();
  }

  ShapeBorder get thumbShape {
    return style.trackShape ?? const CircleBorder();
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
    setStyle();
    super.initState();
  }

  @override
  void didUpdateWidget(_SwitchRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(SwitchEvent.indeterminate, widget.indeterminate);
      widgetEvents.toggle(SwitchEvent.selected, widget.selected);
      widgetEvents.toggle(SwitchEvent.disabled, widget.disabled);
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
    Widget result = AnimatedSwitchmark(
      duration: widget.duration,
      curve: widget.curve,
      padding: style.thumbInset,
      trackShape: trackShape,
      trackColor: trackColor,
      trackHeight: style.trackHeight,
      thumbShape: thumbShape,
      thumbColor: thumbColor,
      thumbScale: style.thumbScale,
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
