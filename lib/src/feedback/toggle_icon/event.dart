import 'package:widgetarian/event.dart';

/// Interactive events that [ToggleIcon] can take on
/// when receiving input from the user.
abstract class ToggleIconEvent extends WidgetEvent {
  const ToggleIconEvent(String value) : super(value);

  /// The state when this item has been selected.
  static const selected = WidgetEvent.selected;

  /// The state when this widget is disabled and cannot be interacted with.
  static const disabled = WidgetEvent.disabled;

  /// Checker for whether events considers [ToggleIconEvent.selected] to be active.
  static bool isSelected(Set<WidgetEvent> events) {
    return events.contains(selected);
  }

  /// Checker for whether events considers [ToggleIconEvent.disabled] to be active.
  static bool isDisabled(Set<WidgetEvent> events) {
    return events.contains(disabled);
  }
}

/// Manages a set of [ToggleIconEvent]s and notifies listeners of changes.
///
/// Used by widgets that expose their internal event
/// for the sake of extensions that add support for additional events.
///
/// The controller's value is its current set of events.
/// Listeners are notified whenever the value changes.
/// The value should only be changed with update;
/// it should not be modified directly.
typedef ToggleIconEventController = WidgetEventController;

/// Set of WidgetEvent
typedef ToggleIconEvents = WidgetEvents;
