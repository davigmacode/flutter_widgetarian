import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/checkbox/style.dart';
import 'package:widgetarian/src/input/checkbox/widget.dart';
import 'theme.dart';

/// A tiled checkbox. In other words, a checkbox with a label.
class CheckboxTile extends StatelessWidget {
  /// Create a tiled checkbox widget
  const CheckboxTile({
    Key? key,
    this.checkboxStyle,
    this.buttonStyle,
    this.controlAffinity,
    this.onChanged,
    this.selected = false,
    this.indeterminate = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.curve,
    this.duration,
    this.tooltip,
    this.secondary,
    required this.child,
  }) : super(key: key);

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
  /// A [StatefulWidget] that illustrates use of onSelected in an [CheckboxTile].
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
  final ValueChanged<bool>? onChanged;

  /// Whether or not this checkbox is selected.
  ///
  /// Must not be null. Defaults to false.
  final bool selected;

  /// Whether or not this checkbox is indeterminate.
  ///
  /// Must not be null. Defaults to false.
  final bool indeterminate;

  /// Whether or not this checkbox is disabled for input.
  ///
  /// Defaults to false. Cannot be null.
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// The style to be applied to the checkbox.
  ///
  /// If [checkboxStyle] is an event driven [CheckboxStyle]
  /// by [DrivenCheckboxStyle], then [CheckboxStyle.evaluate]
  /// is used for the following [CheckboxEvent]s:
  ///
  ///  * [CheckboxEvent.selected].
  ///  * [CheckboxEvent.indeterminate].
  ///  * [CheckboxEvent.focused].
  ///  * [CheckboxEvent.hovered].
  ///  * [CheckboxEvent.pressed].
  ///  * [CheckboxEvent.disabled].
  final CheckboxStyle? checkboxStyle;

  /// The style to be applied to the clickable area.
  ///
  /// If [buttonStyle] is an event driven [ButtonStyle]
  /// by [DrivenButtonStyle], then [DrivenButtonStyle.evaluate]
  /// is used for the following [ButtonEvent]s:
  ///
  ///  * [ButtonEvent.selected].
  ///  * [ButtonEvent.indeterminate].
  ///  * [ButtonEvent.focused].
  ///  * [ButtonEvent.hovered].
  ///  * [ButtonEvent.pressed].
  ///  * [ButtonEvent.disabled].
  final ButtonStyle? buttonStyle;

  /// Where to place the control next to a label.
  final ControlAffinity? controlAffinity;

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

  /// Tooltip string to be used for the body area of the checkbox.
  final String? tooltip;

  /// A widget to display on the opposite side of the tile from the checkbox.
  final Widget? secondary;

  /// The primary content of the checkbox tile.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final checkboxTileTheme = CheckboxTileTheme.of(context);
    final effectiveCurve = curve ?? checkboxTileTheme.curve;
    final effectiveDuration = duration ?? checkboxTileTheme.duration;
    final effectiveControlAffinity =
        controlAffinity ?? checkboxTileTheme.controlAffinity;
    final effectiveCheckboxStyle =
        checkboxTileTheme.checkboxStyle.merge(checkboxStyle);
    final effectiveButtonStyle =
        checkboxTileTheme.buttonStyle.merge(buttonStyle);

    final control = Checkbox(
      curve: effectiveCurve,
      duration: effectiveDuration,
      style: effectiveCheckboxStyle,
      selected: selected,
      indeterminate: indeterminate,
      disabled: disabled,
    );

    return ToggleButton(
      curve: effectiveCurve,
      duration: effectiveDuration,
      style: effectiveButtonStyle,
      selected: selected,
      disabled: disabled,
      onSelected: onChanged,
      leading: effectiveControlAffinity.isLeading ? control : secondary,
      trailing: effectiveControlAffinity.isTrailing ? control : secondary,
      autofocus: autofocus,
      focusNode: focusNode,
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        EnumProperty<ControlAffinity?>('controlAffinity', controlAffinity));
    properties.add(
        DiagnosticsProperty<CheckboxStyle?>('checkboxStyle', checkboxStyle));
    properties
        .add(DiagnosticsProperty<ButtonStyle?>('buttonStyle', buttonStyle));
  }
}
