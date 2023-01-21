import 'package:flutter/widgets.dart';
import 'style.dart';
import 'theme.dart';
import 'event.dart';
import 'render.dart';

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
    return CheckboxRender(
      tooltip: tooltip,
      onChanged: onChanged,
      selected: selected,
      indeterminate: indeterminate,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      eventsController: eventsController,
      duration: duration,
      curve: curve,
      style: style,
      theme: CheckboxTheme.of(context),
    );
  }
}
