import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart'
    show Theme, ThemeData, InteractiveInkFeatureFactory, Brightness;

import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/src/anchor/widget.dart';
import 'style.dart';
import 'event.dart';

/// Chip widget with smooth animation, event driven style, and many more.
class Radio extends StatelessWidget {
  const Radio({
    Key? key,
    this.label,
    this.tooltip,
    this.style,
    this.checked = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.splashColor,
    this.splashFactory,
    this.onChanged,
    this.eventsController,
    this.curve = Radio.defaultCurve,
    this.duration = Radio.defaultDuration,
  }) : super(key: key);

  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  final Widget? label;

  /// Tooltip string to be used for the body area (where the label and avatar
  /// are) of the chip.
  final String? tooltip;

  final bool checked;

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

  /// The splash color of the ink response. If this property is null then the
  /// splash color of the theme, [ThemeData.splashColor], will be used.
  final Color? splashColor;

  /// Defines the appearance of the splash.
  ///
  /// Defaults to the value of the theme's splash factory: [ThemeData.splashFactory].
  final InteractiveInkFeatureFactory? splashFactory;

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

  /// The style to be applied to the chip.
  ///
  /// If [style] is an event driven [RadioStyle]
  /// by [DrivenButtonStyle.driven], then [RadioStyle.evaluate]
  /// is used for the following [RadioEvent]s:
  ///
  ///  * [RadioEvent.disabled].
  ///  * [RadioEvent.selected].
  ///  * [RadioEvent.hovered].
  ///  * [RadioEvent.focused].
  ///  * [RadioEvent.pressed].
  final RadioStyle? style;

  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  final RadioEventController? eventsController;

  /// The curve to apply when animating the parameters of this widget.
  final Curve curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration duration;

  static const defaultDuration = Duration(milliseconds: 200);

  static const defaultCurve = Curves.linear;

  static RadioStyle defaultStyleOf(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color =
        isDark ? theme.colorScheme.inversePrimary : theme.colorScheme.primary;
    return RadioStyle.when(
      enabled: const RadioStyle(
          size: RadioStyle.defaultSize,
          padding: 1,
          thumbColor: Colors.transparent,
          borderWidth: RadioStyle.defaultBorderWidth,
          borderStyle: RadioStyle.defaultBorderStyle,
          borderRadius: RadioStyle.defaultBorderRadius,
          borderShape: BoxShape.circle),
      selected: RadioStyle(
        borderColor: color,
        thumbColor: color,
        padding: .45,
      ),
      disabled: const RadioStyle(
        fillAlpha: RadioStyle.disabledBackgroundAlpha,
        borderAlpha: RadioStyle.disabledBorderAlpha,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _RadioRender(
      label: label,
      tooltip: tooltip,
      onChanged: onChanged,
      checked: checked,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      splashColor: splashColor,
      splashFactory: splashFactory,
      eventsController: eventsController,
      duration: duration,
      curve: curve,
      style: style ?? defaultStyleOf(context),
      theme: Theme.of(context),
    );
  }
}

/// Chip widget with smooth animation, event driven style, and many more.
class _RadioRender extends StatefulWidget {
  const _RadioRender({
    Key? key,
    this.label,
    this.tooltip,
    this.onChanged,
    this.checked = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.splashColor,
    this.splashFactory,
    this.eventsController,
    this.duration = Radio.defaultDuration,
    this.curve = Radio.defaultCurve,
    required this.style,
    required this.theme,
  }) : super(key: key);

  final Widget? label;
  final String? tooltip;
  final bool checked;
  final bool disabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final ValueChanged<bool>? onChanged;
  final RadioEventController? eventsController;
  final Duration duration;
  final Curve curve;
  final RadioStyle style;
  final ThemeData theme;

  bool get enabled => !disabled;

  bool get canTap => enabled && hasCallback;

  bool get hasCallback {
    return onChanged != null;
  }

  @override
  _RadioRenderState createState() => _RadioRenderState();
}

class _RadioRenderState extends State<_RadioRender>
    with WidgetEventMixin<_RadioRender> {
  RadioStyle style = const RadioStyle();

  @protected
  void setStyle() {
    final raw = widget.style;
    final resolved = RadioStyle.evaluate(raw, widgetEvents.value);
    style = RadioStyle.from(resolved);
    setState(() {});
  }

  Color get thumbColor {
    return style.thumbColor ?? borderColor;
  }

  Color? get fillColor {
    Color? color = style.fillColor;
    if (color != null) {
      color = Colors.colorWithOpacity(color, style.fillOpacity);
      color = Colors.colorWithAlpha(color, style.fillAlpha);
    }
    return color;
  }

  ShapeBorder get border {
    return borderShape == BoxShape.rectangle
        ? RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: borderSide,
          )
        : CircleBorder(side: borderSide);
  }

  BoxShape get borderShape {
    return style.borderShape ?? RadioStyle.defaultBorderShape;
  }

  Color get borderColor {
    Color defaultColor = widget.theme.colorScheme.outline;
    Color color = style.borderColor ?? defaultColor;
    color = Colors.colorWithOpacity(color, style.borderOpacity);
    color = Colors.colorWithAlpha(color, style.borderAlpha);
    return color;
  }

  BorderSide get borderSide {
    return BorderSide(
      color: borderColor,
      width: style.borderWidth ?? RadioStyle.defaultBorderWidth,
      style: style.borderStyle ?? RadioStyle.defaultBorderStyle,
    );
  }

  BorderRadiusGeometry get borderRadius {
    return style.borderRadius ?? RadioStyle.defaultBorderRadius;
  }

  void onTap() {
    widgetEvents.toggle(RadioEvent.pressed, false);
    widget.onChanged?.call(!widget.checked);
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
    widgetEvents.toggle(RadioEvent.selected, widget.checked);
    widgetEvents.toggle(RadioEvent.disabled, widget.disabled);
    setStyle();
    super.initState();
  }

  @override
  void didUpdateWidget(_RadioRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(RadioEvent.selected, widget.checked);
      widgetEvents.toggle(RadioEvent.disabled, widget.disabled);
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
    final radiomark = AnimatedRadiomark(
      duration: widget.duration,
      curve: widget.curve,
      color: thumbColor,
      fill: fillColor,
      shape: border,
      padding: style.padding,
      size: style.size,
    );

    if (widget.label != null) {
      return Button(
        onPressed: onTap,
        style: style.buttonStyle,
        disabled: widget.disabled,
        leading: radiomark,
        child: widget.label!,
      );
    }

    return Anchor(
      shape: BoxShape.circle,
      useMaterial: false,
      radius: 20,
      onTap: onTap,
      child: radiomark,
    );
  }
}
