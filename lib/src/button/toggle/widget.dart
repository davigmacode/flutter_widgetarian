import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/button/style.dart';
import 'package:widgetarian/src/button/event.dart';
import 'package:widgetarian/src/button/render.dart';
import 'package:widgetarian/src/button/theme_data.dart';
import 'theme.dart';

/// A Toggle Button can be used to group related options.
class ToggleButton extends StatelessWidget {
  /// Create a toggle button
  const ToggleButton({
    super.key,
    this.severity,
    this.selected = false,
    this.loading = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onSelected,
    this.eventsController,
    this.curve,
    this.duration,
    this.style,
    this.tooltip,
    this.leading,
    this.trailing,
    required this.child,
  });

  /// Create a block toggle button
  ToggleButton.block({
    super.key,
    this.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    this.selected = false,
    this.loading = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onSelected,
    this.eventsController,
    this.curve,
    this.duration,
    ButtonStyle? style,
    this.tooltip,
    this.leading,
    this.trailing,
    required this.child,
  }) : style = DrivenButtonStyle.from(style).block(
          alignChildren: alignChildren,
          justifyChildren: justifyChildren,
          expanded: expanded,
        );

  /// Create an icon toggle button
  ToggleButton.icon({
    super.key,
    this.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    this.selected = false,
    this.loading = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onSelected,
    this.eventsController,
    this.curve,
    this.duration,
    ButtonStyle? style,
    this.tooltip,
    this.leading,
    this.trailing,
    required this.child,
  }) : style = DrivenButtonStyle.from(style).icon(
          shape: shape,
          size: size,
        );

  /// {@macro widgetarian.button.child}
  final Widget child;

  /// {@macro widgetarian.button.leading}
  final Widget? leading;

  /// {@macro widgetarian.button.trailing}
  final Widget? trailing;

  /// {@macro widgetarian.button.tooltip}
  final String? tooltip;

  /// {@macro widgetarian.button.tooltip}
  final ButtonSeverity? severity;

  /// {@macro widgetarian.button.selected}
  final bool selected;

  /// {@macro widgetarian.button.loading}
  final bool loading;

  /// {@macro widgetarian.button.disabled}
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro widgetarian.button.onSelected}
  final ValueChanged<bool>? onSelected;

  /// {@macro widgetarian.button.style}
  final ButtonStyle? style;

  /// {@macro widgetarian.button.eventsController}
  final ButtonEventController? eventsController;

  /// {@macro widgetarian.button.curve}
  final Curve? curve;

  /// {@macro widgetarian.button.duration}
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    final buttonTheme = ToggleButtonTheme.of(context);
    final buttonStyle = buttonTheme.style.merge(style);
    return ButtonRender(
      curve: curve,
      duration: duration,
      severity: severity,
      theme: ButtonThemeData(
        curve: buttonTheme.curve,
        duration: buttonTheme.duration,
        style: buttonTheme.style,
        variantStyle: buttonTheme.variantStyle,
        dangerStyle: buttonTheme.dangerStyle,
        warningStyle: buttonTheme.warningStyle,
        successStyle: buttonTheme.successStyle,
        infoStyle: buttonTheme.infoStyle,
      ),
      style: buttonStyle,
      selected: selected,
      loading: loading,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      onSelected: onSelected,
      eventsController: eventsController,
      leading: leading,
      trailing: trailing,
      tooltip: tooltip,
      child: child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('selected', selected));
    properties.add(DiagnosticsProperty<bool>('loading', loading));
    properties.add(DiagnosticsProperty<bool>('disabled', disabled));
    properties.add(DiagnosticsProperty<bool>('autofocus', autofocus));
    properties.add(DiagnosticsProperty<ButtonStyle?>('style', style));
  }
}
