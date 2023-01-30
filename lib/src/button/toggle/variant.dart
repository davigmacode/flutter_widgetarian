import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/button/style.dart';
import 'widget.dart';

/// Buttons allow users to take actions, and make choices, with a single tap
class DrivenToggleButton extends ToggleButton {
  /// The style to be applied when no events occurs.
  final ButtonStyle? enabledStyle;

  /// The style to be applied when events includes [WidgetEvent.selected].
  final ButtonStyle? selectedStyle;

  /// The style to be applied when events includes [WidgetEvent.focused].
  final ButtonStyle? focusedStyle;

  /// The style to be applied when events includes [WidgetEvent.hovered].
  final ButtonStyle? hoveredStyle;

  /// The style to be applied when events includes [WidgetEvent.pressed].
  final ButtonStyle? pressedStyle;

  /// The style to be applied when events includes [WidgetEvent.disabled].
  final ButtonStyle? disabledStyle;

  @override
  get style => DrivenButtonStyle.from(
        enabledStyle,
        selectedStyle: selectedStyle,
        focusedStyle: focusedStyle,
        hoveredStyle: hoveredStyle,
        pressedStyle: pressedStyle,
        disabledStyle: disabledStyle,
      );

  /// Create a variant button
  const DrivenToggleButton({
    super.key,
    super.variant,
    super.severity,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    this.enabledStyle,
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block variant button
  DrivenToggleButton.block({
    super.key,
    super.variant,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    this.enabledStyle,
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon variant button
  DrivenToggleButton.icon({
    super.key,
    super.variant,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    this.enabledStyle,
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}

/// Text buttons are typically used for less-pronounced actions.
class TextToggleButton extends DrivenToggleButton {
  @override
  get variant => ButtonVariant.text;

  /// Create a text button
  const TextToggleButton({
    super.key,
    super.severity,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block text button
  TextToggleButton.block({
    super.key,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon text button
  TextToggleButton.icon({
    super.key,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}

/// A tonal button is an alternative middle ground between filled and outlined buttons.
/// They’re useful in contexts where a lower-priority button requires slightly more emphasis
/// than an outline would give, such as "Next" in an onboarding flow.
/// Tonal buttons use the secondary color mapping.
class TonalToggleButton extends DrivenToggleButton {
  @override
  get variant => ButtonVariant.tonal;

  /// Create a tonal button
  const TonalToggleButton({
    super.key,
    super.severity,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block tonal button
  TonalToggleButton.block({
    super.key,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon tonal button
  TonalToggleButton.icon({
    super.key,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}

/// Filled buttons are high-emphasis,
/// distinguished by their use of elevation and fill.
/// They contain actions that are primary to your app.
class FilledToggleButton extends DrivenToggleButton {
  @override
  get variant => ButtonVariant.filled;

  /// Create a filled button
  const FilledToggleButton({
    super.key,
    super.severity,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block filled button
  FilledToggleButton.block({
    super.key,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon filled button
  FilledToggleButton.icon({
    super.key,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}

/// Elevated buttons are high-emphasis,
/// distinguished by their use of elevation and fill.
/// They contain actions that are primary to your app.
class ElevatedToggleButton extends DrivenToggleButton {
  @override
  get variant => ButtonVariant.elevated;

  /// Create an elevated button
  const ElevatedToggleButton({
    super.key,
    super.severity,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block elevated button
  ElevatedToggleButton.block({
    super.key,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon elevated button
  ElevatedToggleButton.icon({
    super.key,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}

/// Outlined buttons are medium-emphasis buttons.
/// They contain actions that are important
/// but aren't the primary action in an app.
class OutlinedToggleButton extends DrivenToggleButton {
  @override
  get variant => ButtonVariant.outlined;

  /// Create a outlined button
  const OutlinedToggleButton({
    super.key,
    super.severity,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block outlined button
  OutlinedToggleButton.block({
    super.key,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon outlined button
  OutlinedToggleButton.icon({
    super.key,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
    super.eventsController,
    super.curve,
    super.duration,
    super.enabledStyle,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}
