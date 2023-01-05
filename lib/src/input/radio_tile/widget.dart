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
  RadioTile({
    Key? key,
    this.radioStyle,
    ButtonStyle? buttonStyle,
    bool? overlayDisabled,
    bool? loosen = false,
    double? spacing,
    EdgeInsetsGeometry? padding,
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
  })  : buttonStyle = ButtonStyle(
          foregroundLoosen: loosen,
          foregroundSpacing: spacing,
          overlayDisabled: overlayDisabled,
          padding: padding,
        ).merge(buttonStyle),
        super(key: key);

  /// Create a tiled radio widget for list item
  RadioTile.list({
    Key? key,
    this.radioStyle,
    ButtonStyle? buttonStyle,
    bool? overlayDisabled,
    bool? loosen = false,
    double? spacing,
    EdgeInsetsGeometry? padding,
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
  })  : buttonStyle = ButtonStyle(
          width: double.infinity,
          borderRadius: BorderRadius.zero,
          foregroundExpanded: true,
          foregroundLoosen: loosen,
          foregroundSpacing: spacing,
          overlayDisabled: overlayDisabled,
          padding: padding,
        ).merge(buttonStyle),
        super(key: key);

  /// {@macro widgetarian.radio.onChanged}
  final ValueChanged<bool>? onChanged;

  /// {@macro widgetarian.radio.selected}
  final bool selected;

  /// {@macro widgetarian.radio.disabled}
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro widgetarian.radio.style}
  final RadioStyle? radioStyle;

  /// {@macro widgetarian.button.style}
  final ButtonStyle? buttonStyle;

  /// Where to place the control next to a label.
  final ControlAffinity? controlAffinity;

  /// {@macro widgetarian.radio.curve}
  final Curve? curve;

  /// {@macro widgetarian.radio.duration}
  final Duration? duration;

  /// {@macro widgetarian.radio.tooltip}
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
