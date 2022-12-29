import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/theme.dart';
import 'style.dart';
import 'theme.dart';
import 'event.dart';
import 'render.dart';

/// A Toggle Button can be used to group related options.
class ToggleButton extends StatelessWidget {
  /// Create a toggle button
  const ToggleButton({
    Key? key,
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
  })  : _postStyle = null,
        super(key: key);

  /// Create a block toggle button
  ToggleButton.block({
    Key? key,
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
    this.style,
    this.tooltip,
    this.leading,
    this.trailing,
    required this.child,
  })  : _postStyle = const ButtonStyle().block(
          alignChildren: alignChildren,
          justifyChildren: justifyChildren,
          expanded: expanded,
        ),
        super(key: key);

  /// Create an icon toggle button
  ToggleButton.icon({
    Key? key,
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
    this.style,
    this.tooltip,
    this.leading,
    this.trailing,
    required this.child,
  })  : _postStyle = const ButtonStyle().icon(
          shape: shape,
          size: size,
        ),
        super(key: key);

  /// {@macro widgetarian.button.child}
  final Widget child;

  /// {@macro widgetarian.button.leading}
  final Widget? leading;

  /// {@macro widgetarian.button.trailing}
  final Widget? trailing;

  /// {@macro widgetarian.button.tooltip}
  final String? tooltip;

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

  /// Internally use, style to be merge to style to create icon or block button.
  final ButtonStyle? _postStyle;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final buttonTheme = ButtonTheme.of(context);
    final buttonStyle = buttonTheme.style.merge(style);
    final fallbackStyle = buttonTheme.fallback.copyWith(
      backgroundColor: appTheme.unselectedWidgetColor,
    );
    return ButtonRender(
      curve: curve ?? buttonTheme.curve,
      duration: duration ?? buttonTheme.duration,
      fallback: fallbackStyle,
      style: buttonStyle.merge(_postStyle),
      selected: selected,
      loading: loading,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      onPressed: null,
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
