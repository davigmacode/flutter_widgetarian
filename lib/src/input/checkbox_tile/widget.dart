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

  /// Create a tiled checkbox widget to list item
  CheckboxTile.list({
    Key? key,
    this.checkboxStyle,
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

  /// {@macro widgetarian.checkbox.onChanged}
  final ValueChanged<bool>? onChanged;

  /// {@macro widgetarian.checkbox.selected}
  final bool selected;

  /// {@macro widgetarian.checkbox.indeterminate}
  final bool indeterminate;

  /// {@macro widgetarian.checkbox.disabled}
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro widgetarian.checkbox.style}
  final CheckboxStyle? checkboxStyle;

  /// {@macro widgetarian.button.style}
  final ButtonStyle? buttonStyle;

  /// Where to place the control next to a label.
  final ControlAffinity? controlAffinity;

  /// {@macro widgetarian.checkbox.curve}
  final Curve? curve;

  /// {@macro widgetarian.checkbox.duration}
  final Duration? duration;

  /// {@macro widgetarian.checkbox.tooltip}
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
