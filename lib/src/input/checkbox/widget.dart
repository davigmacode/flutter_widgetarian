import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/anchor.dart';
import 'style.dart';
import 'theme.dart';
import 'event.dart';

/// Checkboxes allow the user to select one or more items from a set.
class Checkbox extends StatelessWidget {
  /// Create a checkbox widget
  const Checkbox({
    Key? key,
    this.tooltip,
    this.style,
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

  /// {@template widgetarian.checkbox.onChanged}
  /// Called when the checkbox should change
  /// between selected and de-selected states.
  ///
  /// When the checkbox is tapped, then the [onChanged] callback, if set, will be
  /// applied to `!selected` (see [selectedStyle]).
  ///
  /// The checkbox passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the checkbox with the new value.
  ///
  /// The callback provided to [onChanged] should update the state of the
  /// parent [StatefulWidget] using the [State.setState] method, so that the
  /// parent gets rebuilt.
  ///
  /// {@tool snippet}
  ///
  /// A [StatefulWidget] that illustrates use of onSelected in an [Checkbox].
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
  ///     return Checkbox(
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

  /// {@template widgetarian.checkbox.tooltip}
  /// Tooltip string to be used for the body area of the checkbox.
  /// {@endtemplate}
  final String? tooltip;

  /// {@template widgetarian.checkbox.selected}
  /// Whether or not this checkbox is selected.
  ///
  /// Must not be null. Defaults to false.
  /// {@endtemplate}
  final bool selected;

  /// {@template widgetarian.checkbox.indeterminate}
  /// Whether or not this checkbox is indeterminate.
  ///
  /// Must not be null. Defaults to false.
  /// {@endtemplate}
  final bool indeterminate;

  /// {@template widgetarian.checkbox.disabled}
  /// Whether or not this checkbox is disabled for input.
  ///
  /// Defaults to false. Cannot be null.
  /// {@endtemplate}
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@template widgetarian.checkbox.style}
  /// The style to be applied to the checkbox.
  ///
  /// If [style] is an event driven [CheckboxStyle]
  /// by [DrivenCheckboxStyle], then [CheckboxStyle.evaluate]
  /// is used for the following [CheckboxEvent]s:
  ///
  ///  * [CheckboxEvent.selected].
  ///  * [CheckboxEvent.focused].
  ///  * [CheckboxEvent.hovered].
  ///  * [CheckboxEvent.pressed].
  ///  * [CheckboxEvent.disabled].
  /// {@endtemplate}
  final CheckboxStyle? style;

  /// {@template widgetarian.checkbox.eventsController}
  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  /// {@endtemplate}
  final CheckboxEventController? eventsController;

  /// {@template widgetarian.checkbox.curve}
  /// The curve to apply when animating the parameters of this widget.
  /// {@endtemplate}
  final Curve? curve;

  /// {@template widgetarian.checkbox.duration}
  /// The duration over which to animate the parameters of this widget.
  /// {@endtemplate}
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    final checkboxTheme = CheckboxTheme.of(context);
    return _CheckboxRender(
      tooltip: tooltip,
      onChanged: onChanged,
      selected: selected,
      indeterminate: indeterminate,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      eventsController: eventsController,
      duration: duration ?? checkboxTheme.duration,
      curve: curve ?? checkboxTheme.curve,
      style: checkboxTheme.style.merge(style),
      fallback: checkboxTheme.fallback,
    );
  }
}

class _CheckboxRender extends StatefulWidget {
  const _CheckboxRender({
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
  final CheckboxEventController? eventsController;
  final Duration duration;
  final Curve curve;
  final CheckboxStyle style;
  final CheckboxStyle fallback;

  bool get enabled => !disabled;

  bool get hasCallback {
    return onChanged != null;
  }

  @override
  _CheckboxRenderState createState() => _CheckboxRenderState();
}

class _CheckboxRenderState extends State<_CheckboxRender>
    with WidgetEventMixin<_CheckboxRender> {
  CheckboxStyle style = const CheckboxStyle();
  CheckboxStyle fallback = const CheckboxStyle();

  @protected
  void setStyle() {
    final rawStyle = widget.style;
    final resStyle = DrivenCheckboxStyle.evaluate(rawStyle, widgetEvents.value);
    style = CheckboxStyle.from(resStyle);

    final rawFallback = widget.fallback;
    final resFallback =
        DrivenCheckboxStyle.evaluate(rawFallback, widgetEvents.value);
    fallback = CheckboxStyle.from(resFallback);
    setState(() {});
  }

  Color? get checkmarkColor => Colors.withTransparency(
        style.checkmarkColor ?? Colors.onSurface(backgroundColor),
        opacity: style.checkmarkOpacity,
        alpha: style.checkmarkAlpha,
      );

  Color? get backgroundColor => Colors.withTransparency(
        style.backgroundColor ?? fallback.backgroundColor,
        opacity: style.backgroundOpacity,
        alpha: style.backgroundAlpha,
      );

  Color get borderColor {
    return Colors.withTransparency(
      style.borderColor ?? fallback.borderColor,
      opacity: style.borderOpacity,
      alpha: style.borderAlpha,
    )!;
  }

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
  void didUpdateWidget(_CheckboxRender oldWidget) {
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
      setStyle();
      super.didChangeWidgetEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget result = AnimatedCheckmark(
      duration: widget.duration,
      curve: widget.curve,
      color: checkmarkColor,
      weight: style.checkmarkWeight,
      size: style.size,
      fill: backgroundColor,
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
