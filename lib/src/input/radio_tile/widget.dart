import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/radio/style.dart';
import 'package:widgetarian/src/input/radio/widget.dart';
import 'theme.dart';

/// A tiled radio. In other words, a radio with a label.
class RadioTile extends StatelessWidget {
  /// Create a tiled radio widget
  const RadioTile({
    Key? key,
    this.radioStyle,
    this.buttonStyle,
    this.controlAffinity,
    this.onChanged,
    this.selected = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.curve,
    this.duration,
    this.tooltip,
    this.secondary,
    required this.child,
  }) : super(key: key);

  /// Called when the radio should change
  /// between selected and de-selected states.
  ///
  /// When the radio is tapped, then the [onChanged] callback, if set, will be
  /// applied to `!selected` (see [selectedStyle]).
  ///
  /// The radio passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the radio with the new value.
  ///
  /// The callback provided to [onChanged] should update the state of the
  /// parent [StatefulWidget] using the [State.setState] method, so that the
  /// parent gets rebuilt.
  ///
  /// {@tool snippet}
  ///
  /// A [StatefulWidget] that illustrates use of onSelected in an [RadioTile].
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
  ///     return Radio(
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

  /// The style to be applied to the radio.
  ///
  /// If [radioStyle] is an event driven [RadioStyle]
  /// by [DrivenRadioStyle], then [RadioStyle.evaluate]
  /// is used for the following [RadioEvent]s:
  ///
  ///  * [RadioEvent.selected].
  ///  * [RadioEvent.indeterminate].
  ///  * [RadioEvent.focused].
  ///  * [RadioEvent.hovered].
  ///  * [RadioEvent.pressed].
  ///  * [RadioEvent.disabled].
  final RadioStyle? radioStyle;

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

  /// Tooltip string to be used for the body area of the radio.
  final String? tooltip;

  /// A widget to display on the opposite side of the tile from the radio.
  final Widget? secondary;

  /// The primary content of the radio tile.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final radioTileTheme = RadioTileTheme.of(context);
    final effectiveCurve = curve ?? radioTileTheme.curve;
    final effectiveDuration = duration ?? radioTileTheme.duration;
    final effectiveControlAffinity =
        controlAffinity ?? radioTileTheme.controlAffinity;
    final effectiveRadioStyle = radioTileTheme.radioStyle.merge(radioStyle);
    final effectiveButtonStyle = radioTileTheme.buttonStyle.merge(buttonStyle);

    final control = Radio(
      curve: effectiveCurve,
      duration: effectiveDuration,
      style: effectiveRadioStyle,
      selected: selected,
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
    properties.add(DiagnosticsProperty<RadioStyle?>('radioStyle', radioStyle));
    properties
        .add(DiagnosticsProperty<ButtonStyle?>('buttonStyle', buttonStyle));
  }
}
