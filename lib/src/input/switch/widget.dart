import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' show Theme, ThemeData, Brightness;

import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/button.dart';
import 'style.dart';
import 'event.dart';

/// Chip widget with smooth animation, event driven style, and many more.
class Switch extends StatelessWidget {
  const Switch({
    Key? key,
    this.label,
    this.tooltip,
    this.style,
    this.onChanged,
    this.checked = false,
    this.indeterminate = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.eventsController,
    this.curve = Curves.linear,
    this.duration = defaultDuration,
  }) : super(key: key);

  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  final Widget? label;

  /// Tooltip string to be used for the body area (where the label and avatar
  /// are) of the chip.
  final String? tooltip;

  /// Called when the chip should change between selected and de-selected
  /// states.
  ///
  /// When the chip is tapped, then the [onChanged] callback, if set, will be
  /// applied to `!selected` (see [selected]).
  ///
  /// The chip passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the chip with the new
  /// value.
  ///
  /// The callback provided to [onChanged] should update the state of the
  /// parent [StatefulWidget] using the [State.setState] method, so that the
  /// parent gets rebuilt.
  ///
  /// The [onChanged] and [onPressed] callbacks must not
  /// both be specified at the same time.
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
  final ValueChanged<bool>? onChanged;

  final bool checked;

  final bool indeterminate;

  /// Whether or not this chip is disabled for input.
  ///
  /// Defaults to false. Cannot be null.
  final bool disabled;

  /// True if this widget will be selected as the initial focus
  /// when no other node in its scope is currently focused.
  ///
  /// Ideally, there is only one widget with autofocus set in each [FocusScope].
  /// If there is more than one widget with autofocus set,
  /// then the first one added to the tree will get focus.
  ///
  /// Must not be null. Defaults to false.
  final bool autofocus;

  /// An optional focus node to use as the focus node for this widget.
  ///
  /// If one is not supplied, then one will be automatically allocated, owned,
  /// and managed by this widget. The widget will be focusable even if a [focusNode] is not supplied.
  /// If supplied, the given focusNode will be hosted by this widget, but not owned.
  /// See [FocusNode] for more information on what being hosted and/or owned implies.
  ///
  /// Supplying a focus node is sometimes useful if an ancestor
  /// to this widget wants to control when this widget has the focus.
  /// The owner will be responsible for calling [FocusNode.dispose]
  /// on the focus node when it is done with it, but this widget
  /// will attach/detach and reparent the node when needed.
  final FocusNode? focusNode;

  /// The style to be applied to the chip.
  ///
  /// If [style] is an event driven [SwitchStyle]
  /// by [DrivenButtonStyle.driven], then [SwitchStyle.evaluate]
  /// is used for the following [SwitchEvent]s:
  ///
  ///  * [SwitchEvent.disabled].
  ///  * [SwitchEvent.selected].
  ///  * [SwitchEvent.hovered].
  ///  * [SwitchEvent.focused].
  ///  * [SwitchEvent.pressed].
  final SwitchStyle? style;

  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  final SwitchEventController? eventsController;

  /// The curve to apply when animating the parameters of this widget.
  final Curve curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration duration;

  static const defaultDuration = Duration(milliseconds: 200);

  static const defaultCurve = Curves.linear;

  static SwitchStyle defaultStyleOf(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color =
        isDark ? theme.colorScheme.inversePrimary : theme.colorScheme.primary;
    return SwitchStyle.when(
      enabled: SwitchStyle(
        size: const Size(40, 14),
        padding: -3,
        trackColor: theme.unselectedWidgetColor,
        trackOpacity: .5,
        thumbColor: Colors.white,
        thumbScale: 1.3,
        thumbElevation: 2,
      ),
      selected: SwitchStyle(
        trackColor: color,
        thumbColor: color,
      ),
      hovered: const SwitchStyle(
        overlayRadius: 20.0,
      ),
      pressed: const SwitchStyle(
        overlayRadius: 0.0,
      ),
      disabled: const SwitchStyle(
        trackAlpha: SwitchStyle.disabledBackgroundAlpha,
        thumbAlpha: SwitchStyle.disabledBorderAlpha,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _SwitchRender(
      label: label,
      tooltip: tooltip,
      checked: checked,
      onChanged: onChanged,
      indeterminate: indeterminate,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      eventsController: eventsController,
      duration: duration,
      curve: curve,
      style: style ?? defaultStyleOf(context),
      theme: Theme.of(context),
    );
  }
}

/// Chip widget with smooth animation, event driven style, and many more.
class _SwitchRender extends StatefulWidget {
  const _SwitchRender({
    Key? key,
    this.label,
    this.tooltip,
    this.checked = false,
    this.indeterminate = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.eventsController,
    this.duration = Switch.defaultDuration,
    this.curve = Switch.defaultCurve,
    required this.style,
    required this.theme,
  }) : super(key: key);

  final Widget? label;
  final String? tooltip;
  final bool checked;
  final bool indeterminate;
  final bool disabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onChanged;
  final SwitchEventController? eventsController;
  final Curve curve;
  final Duration duration;
  final SwitchStyle style;
  final ThemeData theme;

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

  @protected
  void setStyle() {
    final raw = widget.style;
    final resolved = SwitchStyle.evaluate(raw, widgetEvents.value);
    style = SwitchStyle.from(resolved);
  }

  Color? get trackColor {
    Color? color = style.trackColor;
    if (color != null) {
      color = Colors.colorWithOpacity(color, style.trackOpacity);
      color = Colors.colorWithAlpha(color, style.trackAlpha);
    }
    return color;
  }

  Color? get thumbColor {
    Color? color = style.thumbColor;
    if (color != null) {
      color = Colors.colorWithOpacity(color, style.thumbOpacity);
      color = Colors.colorWithAlpha(color, style.thumbAlpha);
    }
    return color;
  }

  ShapeBorder get trackShape {
    return style.trackShape ?? const StadiumBorder();
  }

  ShapeBorder get thumbShape {
    return style.trackShape ?? const CircleBorder();
  }

  void onTap() {
    widgetEvents.toggle(SwitchEvent.pressed, false);
    widget.onChanged?.call(!widget.checked);
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
    widgetEvents.toggle(SwitchEvent.selected, widget.checked);
    widgetEvents.toggle(SwitchEvent.disabled, widget.disabled);
    setStyle();
    super.initState();
  }

  @override
  void didUpdateWidget(_SwitchRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(SwitchEvent.indeterminate, widget.indeterminate);
      widgetEvents.toggle(SwitchEvent.selected, widget.checked);
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
    final checkmark = AnimatedSwitchmark(
      duration: widget.duration,
      curve: widget.curve,
      padding: style.padding,
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
      value: widget.indeterminate ? null : widget.checked,
    );

    if (widget.label != null) {
      return Button(
        onPressed: onTap,
        style: style.buttonStyle,
        disabled: widget.disabled,
        leading: checkmark,
        child: widget.label!,
      );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onHover(true),
      onExit: (event) => onHover(false),
      child: GestureDetector(
        onTap: onTap,
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        child: checkmark,
      ),
    );
  }
}
