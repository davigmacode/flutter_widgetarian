import 'package:flutter/widgets.dart';
import 'event.dart';
import 'style.dart';
import 'theme.dart';
import 'render.dart';

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

  /// {@template widgetarian.radio.style}
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
  /// {@endtemplate}
  final RadioStyle? style;

  /// {@template widgetarian.radio.tooltip}
  /// Tooltip string to be used for the body area of the radio.
  /// {@endtemplate}
  final String? tooltip;

  /// {@template widgetarian.radio.selected}
  /// Whether or not this radio is selected.
  ///
  /// Must not be null. Defaults to false.
  /// {@endtemplate}
  final bool selected;

  /// {@template widgetarian.radio.disabled}
  /// Whether or not this radio is disabled for input.
  ///
  /// Defaults to false. Cannot be null.
  /// {@endtemplate}
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@template widgetarian.radio.onChanged}
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
  /// {@endtemplate}
  final ValueChanged<bool>? onChanged;

  /// {@template widgetarian.radio.curve}
  /// The curve to apply when animating the parameters of this widget.
  /// {@endtemplate}
  final Curve? curve;

  /// {@template widgetarian.radio.duration}
  /// The duration over which to animate the parameters of this widget.
  /// {@endtemplate}
  final Duration? duration;

  /// {@template widgetarian.radio.eventsController}
  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  /// {@endtemplate}
  final RadioEventController? eventsController;

  @override
  Widget build(BuildContext context) {
    return RadioRender(
      tooltip: tooltip,
      onChanged: onChanged,
      selected: selected,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      eventsController: eventsController,
      duration: duration,
      curve: curve,
      style: style,
      theme: RadioTheme.of(context),
    );
  }
}
