import 'style.dart';
import 'widget.dart';

/// Chips allow users to take actions, and make choices, with a single tap
class DrivenChip extends Chip {
  /// The style to be applied when no events occurs.
  final ChipStyle? enabledStyle;

  /// The style to be applied when events includes [WidgetEvent.selected].
  final ChipStyle? selectedStyle;

  /// The style to be applied when events includes [WidgetEvent.focused].
  final ChipStyle? focusedStyle;

  /// The style to be applied when events includes [WidgetEvent.hovered].
  final ChipStyle? hoveredStyle;

  /// The style to be applied when events includes [WidgetEvent.pressed].
  final ChipStyle? pressedStyle;

  /// The style to be applied when events includes [WidgetEvent.disabled].
  final ChipStyle? disabledStyle;

  @override
  get style => DrivenChipStyle.from(
        enabledStyle,
        selectedStyle: selectedStyle,
        focusedStyle: focusedStyle,
        hoveredStyle: hoveredStyle,
        pressedStyle: pressedStyle,
        disabledStyle: disabledStyle,
      );

  /// Create a variant chip
  const DrivenChip({
    super.key,
    super.variant,
    super.severity,
    super.selected = false,
    super.disabled = false,
    super.checkmark = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.onDeleted,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    this.enabledStyle,
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    super.avatarImage,
    super.avatarText,
    super.deleteIcon,
    super.deleteTooltip,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.label,
  });
}

/// A tonal chip is an alternative middle ground between filled and outlined chips.
/// They’re useful in contexts where a lower-priority chip requires slightly more emphasis
/// than an outline would give, such as "Next" in an onboarding flow.
/// Tonal chips use the secondary color mapping.
class TonalChip extends DrivenChip {
  @override
  get variant => ChipVariant.tonal;

  /// Create a tonal chip
  const TonalChip({
    super.key,
    super.severity,
    super.selected = false,
    super.disabled = false,
    super.checkmark = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.onDeleted,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.avatarImage,
    super.avatarText,
    super.deleteIcon,
    super.deleteTooltip,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.label,
  });
}

/// Filled chips are high-emphasis,
/// distinguished by their use of elevation and fill.
/// They contain actions that are primary to your app.
class FilledChip extends DrivenChip {
  @override
  get variant => ChipVariant.filled;

  /// Create a filled chip
  const FilledChip({
    super.key,
    super.severity,
    super.selected = false,
    super.disabled = false,
    super.checkmark = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.onDeleted,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.avatarImage,
    super.avatarText,
    super.deleteIcon,
    super.deleteTooltip,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.label,
  });
}

/// Elevated chips are high-emphasis,
/// distinguished by their use of elevation and fill.
/// They contain actions that are primary to your app.
class ElevatedChip extends DrivenChip {
  @override
  get variant => ChipVariant.elevated;

  /// Create an elevated chip
  const ElevatedChip({
    super.key,
    super.severity,
    super.selected = false,
    super.disabled = false,
    super.checkmark = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.onDeleted,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.avatarImage,
    super.avatarText,
    super.deleteIcon,
    super.deleteTooltip,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.label,
  });
}

/// Outlined chips are medium-emphasis chips.
/// They contain actions that are important
/// but aren't the primary action in an app.
class OutlinedChip extends DrivenChip {
  @override
  get variant => ChipVariant.outlined;

  /// Create a outlined chip
  const OutlinedChip({
    super.key,
    super.severity,
    super.selected = false,
    super.disabled = false,
    super.checkmark = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.onDeleted,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.avatarImage,
    super.avatarText,
    super.deleteIcon,
    super.deleteTooltip,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.label,
  }) : super();
}
