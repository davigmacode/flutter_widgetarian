import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'style.dart';
import 'theme.dart';
import 'event.dart';
import 'render.dart';

/// Buttons allow users to take actions, and make choices, with a single tap
class VariantButton extends StatelessWidget {
  /// Create a variant button
  const VariantButton({
    Key? key,
    this.loading = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onPressed,
    this.eventsController,
    this.curve,
    this.duration,
    this.style,
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.preStyle,
    this.postStyle,
    this.tooltip,
    this.leading,
    this.trailing,
    required this.child,
  }) : super(key: key);

  /// Create a block variant button
  VariantButton.block({
    Key? key,
    CrossAxisAlignment? alignChildren,
    MainAxisAlignment? justifyChildren,
    bool expanded = true,
    this.loading = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onPressed,
    this.eventsController,
    this.curve,
    this.duration,
    this.style,
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.preStyle,
    this.tooltip,
    this.leading,
    this.trailing,
    required this.child,
  })  : postStyle = const ButtonStyle().block(
          alignChildren: alignChildren,
          justifyChildren: justifyChildren,
          expanded: expanded,
        ),
        super(key: key);

  /// Create an icon variant button
  VariantButton.icon({
    Key? key,
    BoxShape shape = BoxShape.circle,
    double? size,
    this.loading = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onPressed,
    this.eventsController,
    this.curve,
    this.duration,
    this.style,
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.preStyle,
    this.tooltip,
    this.leading,
    this.trailing,
    required this.child,
  })  : postStyle = const ButtonStyle().icon(
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

  /// {@macro widgetarian.button.loading}
  final bool loading;

  /// {@macro widgetarian.button.disabled}
  final bool disabled;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro widgetarian.button.onPressed}
  final VoidCallback? onPressed;

  /// The style to be applied to the button.
  final ButtonStyle? style;

  /// The style to be applied to the button.
  final ButtonStyle? selectedStyle;

  /// {@macro widgetarian.button.style}
  final ButtonStyle? focusedStyle;

  /// {@macro widgetarian.button.style}
  final ButtonStyle? hoveredStyle;

  /// {@macro widgetarian.button.style}
  final ButtonStyle? pressedStyle;

  /// {@macro widgetarian.button.style}
  final ButtonStyle? disabledStyle;

  /// {@macro widgetarian.button.eventsController}
  final ButtonEventController? eventsController;

  /// {@macro widgetarian.button.curve}
  final Curve? curve;

  /// {@macro widgetarian.button.duration}
  final Duration? duration;

  /// Internally use, style to be merge to style to create variant button.
  final ButtonStyle? preStyle;

  /// Internally use, style to be merge to style to create icon or block button.
  final ButtonStyle? postStyle;

  @override
  Widget build(BuildContext context) {
    final buttonTheme = ButtonTheme.of(context);
    final buttonStyle = buttonTheme.style.merge(style);
    return ButtonRender(
      curve: curve ?? buttonTheme.curve,
      duration: duration ?? buttonTheme.duration,
      fallback: buttonTheme.fallback,
      style: buttonStyle.merge(preStyle).merge(postStyle),
      selected: false,
      loading: loading,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      onPressed: onPressed,
      onSelected: null,
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
    properties.add(DiagnosticsProperty<bool>('loading', loading));
    properties.add(DiagnosticsProperty<bool>('disabled', disabled));
    properties.add(DiagnosticsProperty<bool>('autofocus', autofocus));
    properties.add(DiagnosticsProperty<ButtonStyle?>('style', style));
  }
}

/// Text buttons are typically used for less-pronounced actions.
class TextButton extends VariantButton {
  /// Create a text button
  TextButton({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.text(),
        );

  /// Create a block text button
  TextButton.block({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.text(),
          postStyle: const ButtonStyle().block(
            alignChildren: alignChildren,
            justifyChildren: justifyChildren,
            expanded: expanded,
          ),
        );

  /// Create an icon text button
  TextButton.icon({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.text(),
          postStyle: const ButtonStyle().icon(
            shape: shape,
            size: size,
          ),
        );
}

/// A tonal button is an alternative middle ground between filled and outlined buttons.
/// They’re useful in contexts where a lower-priority button requires slightly more emphasis
/// than an outline would give, such as "Next" in an onboarding flow.
/// Tonal buttons use the secondary color mapping.
class TonalButton extends VariantButton {
  /// Create a tonal button
  TonalButton({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.tonal(),
        );

  /// Create a block tonal button
  TonalButton.block({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.tonal(),
          postStyle: const ButtonStyle().block(
            alignChildren: alignChildren,
            justifyChildren: justifyChildren,
            expanded: expanded,
          ),
        );

  /// Create an icon tonal button
  TonalButton.icon({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.tonal(),
          postStyle: const ButtonStyle().icon(
            shape: shape,
            size: size,
          ),
        );
}

/// Filled buttons are high-emphasis,
/// distinguished by their use of elevation and fill.
/// They contain actions that are primary to your app.
class FilledButton extends VariantButton {
  /// Create a filled button
  FilledButton({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.filled(),
        );

  /// Create a block filled button
  FilledButton.block({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.filled(),
          postStyle: const ButtonStyle().block(
            alignChildren: alignChildren,
            justifyChildren: justifyChildren,
            expanded: expanded,
          ),
        );

  /// Create an icon filled button
  FilledButton.icon({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.filled(),
          postStyle: const ButtonStyle().icon(
            shape: shape,
            size: size,
          ),
        );
}

/// Outlined buttons are medium-emphasis buttons.
/// They contain actions that are important
/// but aren't the primary action in an app.
class OutlinedButton extends VariantButton {
  /// Create a outlined button
  OutlinedButton({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.outlined(),
        );

  /// Create a block outlined button
  OutlinedButton.block({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.outlined(),
          postStyle: const ButtonStyle().block(
            alignChildren: alignChildren,
            justifyChildren: justifyChildren,
            expanded: expanded,
          ),
        );

  /// Create an icon outlined button
  OutlinedButton.icon({
    Key? key,
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
  }) : super(
          key: key,
          preStyle: DrivenButtonStyle.outlined(),
          postStyle: const ButtonStyle().icon(
            shape: shape,
            size: size,
          ),
        );
}
