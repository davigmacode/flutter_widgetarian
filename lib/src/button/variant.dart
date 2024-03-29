import 'package:flutter/widgets.dart';
import 'style.dart';
import 'widget.dart';

/// Buttons allow users to take actions, and make choices, with a single tap
class DrivenButton extends Button {
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
  const DrivenButton({
    super.key,
    super.variant,
    super.severity,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block variant button
  DrivenButton.block({
    super.key,
    super.variant,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon variant button
  DrivenButton.icon({
    super.key,
    super.variant,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}

/// Text buttons are typically used for less-pronounced actions.
class TextButton extends DrivenButton {
  @override
  get variant => ButtonVariant.text;

  /// Create a text button
  const TextButton({
    super.key,
    super.severity,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block text button
  TextButton.block({
    super.key,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon text button
  TextButton.icon({
    super.key,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
class TonalButton extends DrivenButton {
  @override
  get variant => ButtonVariant.tonal;

  /// Create a tonal button
  const TonalButton({
    super.key,
    super.severity,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block tonal button
  TonalButton.block({
    super.key,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon tonal button
  TonalButton.icon({
    super.key,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}

/// Filled buttons are high-emphasis,
/// distinguished by their use of elevation and fill.
/// They contain actions that are primary to your app.
class FilledButton extends DrivenButton {
  @override
  get variant => ButtonVariant.filled;

  /// Create a filled button
  const FilledButton({
    super.key,
    super.severity,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block filled button
  FilledButton.block({
    super.key,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon filled button
  FilledButton.icon({
    super.key,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}

/// Elevated buttons are high-emphasis,
/// distinguished by their use of elevation and fill.
/// They contain actions that are primary to your app.
class ElevatedButton extends DrivenButton {
  @override
  get variant => ButtonVariant.elevated;

  /// Create an elevated button
  const ElevatedButton({
    super.key,
    super.severity,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block elevated button
  ElevatedButton.block({
    super.key,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon elevated button
  ElevatedButton.icon({
    super.key,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}

/// Outlined buttons are medium-emphasis buttons.
/// They contain actions that are important
/// but aren't the primary action in an app.
class OutlinedButton extends DrivenButton {
  @override
  get variant => ButtonVariant.outlined;

  /// Create a outlined button
  const OutlinedButton({
    super.key,
    super.severity,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  });

  /// Create a block outlined button
  OutlinedButton.block({
    super.key,
    super.severity,
    super.alignChildren,
    super.justifyChildren,
    super.expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block();

  /// Create an icon outlined button
  OutlinedButton.icon({
    super.key,
    super.severity,
    super.shape = BoxShape.circle,
    super.size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
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
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon();
}
