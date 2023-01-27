import 'package:flutter/widgets.dart';
import 'style.dart';
import 'widget.dart';

/// Buttons allow users to take actions, and make choices, with a single tap
class VariantButton extends Button {
  /// Create a variant button
  VariantButton({
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
    ButtonStyle? style,
    ButtonStyle? variantStyle,
    ButtonStyle? selectedStyle,
    ButtonStyle? focusedStyle,
    ButtonStyle? hoveredStyle,
    ButtonStyle? pressedStyle,
    ButtonStyle? disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super(
          style: DrivenButtonStyle.from(style).merge(variantStyle).copyWith(
                selectedStyle: selectedStyle,
                focusedStyle: focusedStyle,
                hoveredStyle: hoveredStyle,
                pressedStyle: pressedStyle,
                disabledStyle: disabledStyle,
              ),
        );

  /// Create a block variant button
  VariantButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    ButtonStyle? style,
    ButtonStyle? variantStyle,
    ButtonStyle? selectedStyle,
    ButtonStyle? focusedStyle,
    ButtonStyle? hoveredStyle,
    ButtonStyle? pressedStyle,
    ButtonStyle? disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super(
          style: DrivenButtonStyle.from(style)
              .merge(variantStyle)
              .copyWith(
                selectedStyle: selectedStyle,
                focusedStyle: focusedStyle,
                hoveredStyle: hoveredStyle,
                pressedStyle: pressedStyle,
                disabledStyle: disabledStyle,
              )
              .block(
                alignChildren: alignChildren,
                justifyChildren: justifyChildren,
                expanded: expanded,
              ),
        );

  /// Create an icon variant button
  VariantButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    ButtonStyle? style,
    ButtonStyle? variantStyle,
    ButtonStyle? selectedStyle,
    ButtonStyle? focusedStyle,
    ButtonStyle? hoveredStyle,
    ButtonStyle? pressedStyle,
    ButtonStyle? disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super(
          style: DrivenButtonStyle.from(style)
              .merge(variantStyle)
              .copyWith(
                selectedStyle: selectedStyle,
                focusedStyle: focusedStyle,
                hoveredStyle: hoveredStyle,
                pressedStyle: pressedStyle,
                disabledStyle: disabledStyle,
              )
              .icon(
                shape: shape,
                size: size,
              ),
        );
}

/// Text buttons are typically used for less-pronounced actions.
class TextButton extends VariantButton {
  /// Create a text button
  TextButton({
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
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super(variantStyle: const DrivenButtonStyle.text());

  /// Create a block text button
  TextButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block(
          variantStyle: const DrivenButtonStyle.text(),
          alignChildren: alignChildren,
          justifyChildren: justifyChildren,
          expanded: expanded,
        );

  /// Create an icon text button
  TextButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon(
          variantStyle: const DrivenButtonStyle.text(),
          shape: shape,
          size: size,
        );
}

/// A tonal button is an alternative middle ground between filled and outlined buttons.
/// They’re useful in contexts where a lower-priority button requires slightly more emphasis
/// than an outline would give, such as "Next" in an onboarding flow.
/// Tonal buttons use the secondary color mapping.
class TonalButton extends VariantButton {
  /// Create a tonal button
  TonalButton({
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
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super(variantStyle: const DrivenButtonStyle.tonal());

  /// Create a block tonal button
  TonalButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block(
          variantStyle: const DrivenButtonStyle.tonal(),
          alignChildren: alignChildren,
          justifyChildren: justifyChildren,
          expanded: expanded,
        );

  /// Create an icon tonal button
  TonalButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon(
          variantStyle: const DrivenButtonStyle.tonal(),
          shape: shape,
          size: size,
        );
}

/// Filled buttons are high-emphasis,
/// distinguished by their use of elevation and fill.
/// They contain actions that are primary to your app.
class FilledButton extends VariantButton {
  /// Create a filled button
  FilledButton({
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
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super(variantStyle: const DrivenButtonStyle.filled());

  /// Create a block filled button
  FilledButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block(
          variantStyle: const DrivenButtonStyle.filled(),
          alignChildren: alignChildren,
          justifyChildren: justifyChildren,
          expanded: expanded,
        );

  /// Create an icon filled button
  FilledButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon(
          variantStyle: const DrivenButtonStyle.filled(),
          shape: shape,
          size: size,
        );
}

/// Elevated buttons are high-emphasis,
/// distinguished by their use of elevation and fill.
/// They contain actions that are primary to your app.
class ElevatedButton extends VariantButton {
  /// Create an elevated button
  ElevatedButton({
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
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super(variantStyle: const DrivenButtonStyle.elevated());

  /// Create a block elevated button
  ElevatedButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block(
          variantStyle: const DrivenButtonStyle.elevated(),
          alignChildren: alignChildren,
          justifyChildren: justifyChildren,
          expanded: expanded,
        );

  /// Create an icon elevated button
  ElevatedButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon(
          variantStyle: const DrivenButtonStyle.elevated(),
          shape: shape,
          size: size,
        );
}

/// Outlined buttons are medium-emphasis buttons.
/// They contain actions that are important
/// but aren't the primary action in an app.
class OutlinedButton extends VariantButton {
  /// Create a outlined button
  OutlinedButton({
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
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super(variantStyle: const DrivenButtonStyle.outlined());

  /// Create a block outlined button
  OutlinedButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.block(
          variantStyle: const DrivenButtonStyle.outlined(),
          alignChildren: alignChildren,
          justifyChildren: justifyChildren,
          expanded: expanded,
        );

  /// Create an icon outlined button
  OutlinedButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onPressed,
    super.eventsController,
    super.curve,
    super.duration,
    super.style,
    super.selectedStyle,
    super.focusedStyle,
    super.hoveredStyle,
    super.pressedStyle,
    super.disabledStyle,
    super.tooltip,
    super.leading,
    super.trailing,
    required super.child,
  }) : super.icon(
          variantStyle: const DrivenButtonStyle.outlined(),
          shape: shape,
          size: size,
        );
}
