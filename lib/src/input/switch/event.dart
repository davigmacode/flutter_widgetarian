import 'package:widgetarian/event.dart';

/// Interactive events that [Checkbox] can take on
/// when receiving input from the user.
abstract class SwitchEvent extends WidgetEvent {
  const SwitchEvent._(String value) : super(value);

  /// The event when this widget has been selected.
  ///
  /// This applies to things that can be toggled (such as chips and checkboxes)
  /// and things that are selected from a set of options (such as tabs and radio buttons).
  static const selected = WidgetEvent.selected;

  /// The state when this item has been indeterminate.
  static const indeterminate = WidgetEvent.indeterminate;

  /// The state when this widget is disabled and cannot be interacted with.
  ///
  /// Disabled widgets should not respond to hover, focus, or press interactions.
  static const disabled = WidgetEvent.disabled;

  /// The state when the user drags their mouse cursor over the given widget.
  static const hovered = WidgetEvent.hovered;

  /// The state when the user navigates with the keyboard to a given widget.
  ///
  /// This can also sometimes be triggered when a widget is tapped. For example,
  /// when a [TextField] is tapped, it becomes [focused].
  static const focused = WidgetEvent.focused;

  /// The state when the user is actively pressing down on the given widget.
  static const pressed = WidgetEvent.pressed;

  /// Checker for whether events considers [CheckboxEvent.selectedStyle] to be active.
  static bool isSelected(Set<WidgetEvent> events) {
    return events.contains(selected);
  }

  /// Checker for whether events considers [SwitchEvent.indeterminate] to be active.
  static bool isIndeterminate(Set<WidgetEvent> events) {
    return events.contains(indeterminate);
  }

  /// Checker for whether events considers [SwitchEvent.disabled] to be active.
  static bool isDisabled(Set<WidgetEvent> events) {
    return events.contains(disabled);
  }

  /// Checker for whether events considers [SwitchEvent.hovered] to be active.
  static bool isHovered(Set<WidgetEvent> events) {
    return events.contains(hovered);
  }

  /// Checker for whether events considers [SwitchEvent.focused] to be active.
  static bool isFocused(Set<WidgetEvent> events) {
    return events.contains(focused);
  }

  /// Checker for whether events considers [SwitchEvent.pressed] to be active.
  static bool isPressed(Set<WidgetEvent> events) {
    return events.contains(pressed);
  }
}

/// Manages a set of [SwitchEvent]s and notifies listeners of changes.
///
/// Used by widgets that expose their internal event
/// for the sake of extensions that add support for additional events.
///
/// The controller's value is its current set of events.
/// Listeners are notified whenever the value changes.
/// The value should only be changed with update;
/// it should not be modified directly.
class SwitchEventController extends WidgetEventController {}

/// Set of WidgetEvent
typedef SwitchEvents = WidgetEvents;
