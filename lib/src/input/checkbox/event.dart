import 'package:widgetarian/event.dart';

/// Interactive events that [Checkbox] can take on
/// when receiving input from the user.
abstract class CheckboxEvent extends WidgetEvent {
  const CheckboxEvent(String value) : super(value);

  /// The state when this widget is disabled and cannot be interacted with.
  ///
  /// Disabled widgets should not respond to hover, focus, press, or drag
  /// interactions.
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

  /// Checker for whether events considers [CheckboxEvent.disabled] to be active.
  static bool isDisabled(Set<WidgetEvent> events) {
    return events.contains(CheckboxEvent.disabled);
  }

  /// Checker for whether events considers [CheckboxEvent.hovered] to be active.
  static bool isHovered(Set<WidgetEvent> events) {
    return events.contains(CheckboxEvent.hovered);
  }

  /// Checker for whether events considers [CheckboxEvent.focused] to be active.
  static bool isFocused(Set<WidgetEvent> events) {
    return events.contains(CheckboxEvent.focused);
  }

  /// Checker for whether events considers [CheckboxEvent.pressed] to be active.
  static bool isPressed(Set<WidgetEvent> events) {
    return events.contains(CheckboxEvent.pressed);
  }
}

/// Manages a set of [CheckboxEvent]s and notifies listeners of changes.
///
/// Used by widgets that expose their internal event
/// for the sake of extensions that add support for additional events.
///
/// The controller's value is its current set of events.
/// Listeners are notified whenever the value changes.
/// The value should only be changed with update;
/// it should not be modified directly.
class CheckboxEventController extends WidgetEventController {}

/// Set of WidgetEvent
typedef CheckboxEvents = WidgetEvents;
