import 'package:flutter/widgets.dart';
import 'style.dart';
import 'theme.dart';
import 'event.dart';
import 'render.dart';

/// Chips are compact elements that represent an input, attribute, or action.
class Chip extends StatelessWidget {
  const Chip({
    super.key,
    required this.label,
    this.avatarImage,
    this.avatarText,
    this.leading,
    this.trailing,
    this.tooltip,
    this.deleteIcon,
    this.deleteTooltip,
    this.variant,
    this.severity,
    this.style,
    this.selected = false,
    this.disabled = false,
    this.checkmark = false,
    this.autofocus = false,
    this.focusNode,
    this.onPressed,
    this.onDeleted,
    this.onSelected,
    this.eventsController,
    this.curve,
    this.duration,
  });

  /// {@macro widgetarian.chip.label}
  final Widget label;

  /// {@macro widgetarian.chip.avatarImage}
  final ImageProvider? avatarImage;

  /// {@macro widgetarian.chip.avatarText}
  final Widget? avatarText;

  /// {@macro widgetarian.chip.leading}
  final Widget? leading;

  /// {@macro widgetarian.chip.trailing}
  final Widget? trailing;

  /// {@macro widgetarian.chip.tooltip}
  final String? tooltip;

  /// {@macro widgetarian.chip.deleteIcon}
  final Widget? deleteIcon;

  /// {@macro widgetarian.chip.deleteTooltip}
  final String? deleteTooltip;

  /// {@macro widgetarian.chip.selected}
  final bool selected;

  /// {@macro widgetarian.chip.disabled}
  final bool disabled;

  /// {@macro widgetarian.chip.checkmark}
  final bool checkmark;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro widgetarian.chip.onPressed}
  final VoidCallback? onPressed;

  /// {@macro widgetarian.chip.onDeleted}
  final VoidCallback? onDeleted;

  /// {@macro widgetarian.chip.onSelected}
  final ValueChanged<bool>? onSelected;

  /// {@macro widgetarian.chip.variant}
  final ChipVariant? variant;

  /// {@macro widgetarian.chip.severity}
  final ChipSeverity? severity;

  /// {@macro widgetarian.chip.style}
  final ChipStyle? style;

  /// {@macro widgetarian.chip.eventsController}
  final ChipEventController? eventsController;

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

  bool get enabled => !disabled;

  bool get canTap => enabled && hasCallback;

  bool get canDelete => onDeleted != null;

  bool get hasCallback {
    return onPressed != null || onSelected != null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ChipTheme.of(context);
    return ChipRender(
      curve: curve ?? theme.curve,
      duration: duration ?? theme.duration,
      theme: theme,
      style: style,
      variant: variant,
      severity: severity,
      label: label,
      avatarImage: avatarImage,
      avatarText: avatarText,
      leading: leading,
      trailing: trailing,
      tooltip: tooltip,
      deleteIcon: deleteIcon,
      deleteTooltip: deleteTooltip,
      selected: selected,
      disabled: disabled,
      checkmark: checkmark,
      autofocus: autofocus,
      focusNode: focusNode,
      onPressed: onPressed,
      onDeleted: onDeleted,
      onSelected: onSelected,
      eventsController: eventsController,
    );
  }
}
