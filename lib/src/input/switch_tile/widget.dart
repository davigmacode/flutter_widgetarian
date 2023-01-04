import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/switch/style.dart';
import 'package:widgetarian/src/input/switch/widget.dart';
import 'theme.dart';

/// A tiled switch. In other words, a switch with a label.
class SwitchTile extends StatelessWidget {
  /// Create a tiled switch widget
  const SwitchTile({
    Key? key,
    this.switchStyle,
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

  /// Create a tiled switch widget for list item
  SwitchTile.list({
    Key? key,
    this.switchStyle,
    ButtonStyle? buttonStyle,
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
  })  : buttonStyle = const ButtonStyle(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          borderRadius: BorderRadius.zero,
          foregroundExpanded: true,
          foregroundSpacing: 15,
        ).merge(buttonStyle),
        super(key: key);

  /// {@macro widgetarian.switch.onChanged}
  final ValueChanged<bool>? onChanged;

  /// {@macro widgetarian.switch.selected}
  final bool selected;

  /// {@macro widgetarian.switch.indeterminate}
  final bool indeterminate;

  /// {@macro widgetarian.switch.disabled}
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro widgetarian.switch.style}
  final SwitchStyle? switchStyle;

  /// {@macro widgetarian.button.disabled}
  final ButtonStyle? buttonStyle;

  /// Where to place the control next to a label.
  final ControlAffinity? controlAffinity;

  /// {@macro widgetarian.switch.curve}
  final Curve? curve;

  /// {@macro widgetarian.switch.duration}
  final Duration? duration;

  /// {@macro widgetarian.switch.tooltip}
  final String? tooltip;

  /// A widget to display on the opposite side of the tile from the switch.
  final Widget? secondary;

  /// The primary content of the switch tile.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final switchTileTheme = SwitchTileTheme.of(context);
    final effectiveCurve = curve ?? switchTileTheme.curve;
    final effectiveDuration = duration ?? switchTileTheme.duration;
    final effectiveControlAffinity =
        controlAffinity ?? switchTileTheme.controlAffinity;
    final effectiveSwitchStyle = switchTileTheme.switchStyle.merge(switchStyle);
    final effectiveButtonStyle = switchTileTheme.buttonStyle.merge(buttonStyle);

    final control = Switch(
      curve: effectiveCurve,
      duration: effectiveDuration,
      style: effectiveSwitchStyle,
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
    properties
        .add(DiagnosticsProperty<SwitchStyle?>('switchStyle', switchStyle));
    properties
        .add(DiagnosticsProperty<ButtonStyle?>('buttonStyle', buttonStyle));
  }
}
