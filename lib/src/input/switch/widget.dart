import 'package:flutter/widgets.dart';
import 'event.dart';
import 'style.dart';
import 'theme.dart';
import 'render.dart';

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
    return SwitchRender(
      tooltip: tooltip,
      selected: selected,
      onChanged: onChanged,
      indeterminate: indeterminate,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      eventsController: eventsController,
      duration: duration,
      curve: curve,
      style: style,
      theme: SwitchTheme.of(context),
    );
  }
}
