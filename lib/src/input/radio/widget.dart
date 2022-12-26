import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/anchor.dart';
import 'event.dart';
import 'style.dart';
import 'theme.dart';

/// Radio allow the user to select one item from a set.
class Radio extends StatelessWidget {
  const Radio({
    Key? key,
    this.style,
    this.tooltip,
    this.selected = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.curve,
    this.duration,
    this.eventsController,
  }) : super(key: key);

  /// The style to be applied to the radio.
  ///
  /// If [style] is an event driven [RadioStyle]
  /// by [DrivenRadioStyle.driven], then [DrivenRadioStyle.evaluate]
  /// is used for the following [RadioEvent]s:
  ///
  ///  * [RadioEvent.disabled].
  ///  * [RadioEvent.selected].
  ///  * [RadioEvent.hovered].
  ///  * [RadioEvent.focused].
  ///  * [RadioEvent.pressed].
  final RadioStyle? style;

  /// Tooltip string to be used for the body area of the radio.
  final String? tooltip;

  /// Whether or not this radio is selected.
  ///
  /// Must not be null. Defaults to false.
  final bool selected;

  /// Whether or not this radio is disabled for input.
  ///
  /// Defaults to false. Cannot be null.
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// Called when the radio should change between selected and de-selected
  /// states.
  ///
  /// When the radio is tapped, then the [onChanged] callback, if set, will be
  /// applied to `!selected` (see [selectedStyle]).
  ///
  /// The radio passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the radio with the new
  /// value.
  ///
  /// The callback provided to [onChanged] should update the state of the
  /// parent [StatefulWidget] using the [State.setState] method, so that the
  /// parent gets rebuilt.
  ///
  /// {@tool snippet}
  ///
  /// A [StatefulWidget] that illustrates use of onSelected in an [Radio].
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

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  final RadioEventController? eventsController;

  @override
  Widget build(BuildContext context) {
    final radioTheme = RadioTheme.of(context);
    return _RadioRender(
      tooltip: tooltip,
      onChanged: onChanged,
      selected: selected,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      eventsController: eventsController,
      duration: duration ?? radioTheme.duration,
      curve: curve ?? radioTheme.curve,
      style: radioTheme.style.merge(style),
      fallback: radioTheme.fallback,
    );
  }
}

/// Chip widget with smooth animation, event driven style, and many more.
class _RadioRender extends StatefulWidget {
  const _RadioRender({
    Key? key,
    this.tooltip,
    this.onChanged,
    this.selected = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.eventsController,
    required this.duration,
    required this.curve,
    required this.style,
    required this.fallback,
  }) : super(key: key);

  final String? tooltip;
  final bool selected;
  final bool disabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onChanged;
  final RadioEventController? eventsController;
  final Duration duration;
  final Curve curve;
  final RadioStyle style;
  final RadioStyle fallback;

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
  RadioStyle fallback = const RadioStyle();

  @protected
  void setStyle() {
    final rawStyle = widget.style;
    final resStyle = DrivenRadioStyle.evaluate(rawStyle, widgetEvents.value);
    style = RadioStyle.from(resStyle);

    final rawFallback = widget.fallback;
    final resFallback =
        DrivenRadioStyle.evaluate(rawFallback, widgetEvents.value);
    fallback = RadioStyle.from(resFallback);
    setState(() {});
  }

  Color? get thumbColor => Colors.withTransparency(
        style.thumbColor ?? fallback.thumbColor,
        opacity: style.thumbOpacity,
        alpha: style.thumbAlpha,
      );

  Color? get backgroundColor => Colors.withTransparency(
        style.backgroundColor,
        opacity: style.backgroundOpacity,
        alpha: style.backgroundAlpha,
      );

  Color get borderColor => Colors.withTransparency(
        style.borderColor ?? fallback.borderColor,
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
  void didUpdateWidget(_RadioRender oldWidget) {
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
      setStyle();
      super.didChangeWidgetEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget result = AnimatedRadiomark(
      duration: widget.duration,
      curve: widget.curve,
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
