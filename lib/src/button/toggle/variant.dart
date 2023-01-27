import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/button/style.dart';
import 'widget.dart';

/// Buttons allow users to take actions, and make choices, with a single tap
class VariantToggleButton extends ToggleButton {
  /// Create a variant button
  VariantToggleButton({
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
  VariantToggleButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
  VariantToggleButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
class TextToggleButton extends VariantToggleButton {
  /// Create a text button
  TextToggleButton({
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
  TextToggleButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
  TextToggleButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
class TonalToggleButton extends VariantToggleButton {
  /// Create a tonal button
  TonalToggleButton({
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
  TonalToggleButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
  TonalToggleButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
class FilledToggleButton extends VariantToggleButton {
  /// Create a filled button
  FilledToggleButton({
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
  FilledToggleButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
  FilledToggleButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
class ElevatedToggleButton extends VariantToggleButton {
  /// Create an elevated button
  ElevatedToggleButton({
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
  ElevatedToggleButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
  ElevatedToggleButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
class OutlinedToggleButton extends VariantToggleButton {
  /// Create a outlined button
  OutlinedToggleButton({
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
  OutlinedToggleButton.block({
    super.key,
    super.severity,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
  OutlinedToggleButton.icon({
    super.key,
    super.severity,
    BoxShape shape = BoxShape.circle,
    double? size,
    super.selected = false,
    super.loading = false,
    super.disabled = false,
    super.autofocus = false,
    super.focusNode,
    super.onSelected,
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
