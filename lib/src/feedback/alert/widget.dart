import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/layout.dart';

/// Sheet widget with smooth animation, event driven style, and many more.
class Alert extends StatelessWidget {
  const Alert({
    Key? key,
    this.eventsController,
    this.duration = Alert.defaultDuration,
    this.curve = Alert.defaultCurve,
    this.style,
    this.icon,
    this.action,
    this.title,
    this.child,
  }) : super(key: key);

  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  final Widget? icon;

  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  final Widget? action;

  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  final Widget? child;

  /// The style to be applied to the chip.
  ///
  /// If [style] is an event driven [SheetStyle]
  /// by [DrivenSheetStyle.driven], then [SheetStyle.evaluate]
  /// is used for the following [WidgetEvent]s:
  ///
  ///  * [WidgetEvent.selected].
  ///  * [WidgetEvent.indeterminate].
  ///  * [WidgetEvent.error].
  ///  * [WidgetEvent.loading].
  ///  * [WidgetEvent.focused].
  ///  * [WidgetEvent.hovered].
  ///  * [WidgetEvent.pressed].
  ///  * [WidgetEvent.dragged].
  ///  * [WidgetEvent.disabled].
  final SheetStyle? style;

  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  final WidgetEventController? eventsController;

  /// The curve to apply when animating the parameters of this widget.
  final Curve curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration duration;

  static const defaultCurve = Curves.linear;
  static const defaultDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return Sheet(
      curve: curve,
      duration: duration,
      style: style ?? SheetTheme.of(context),
      eventsController: eventsController,
      child: ListTile(
        style: const ListTileStyle(
          alignItems: CrossAxisAlignment.start,
          spacing: 15,
        ),
        leading: icon,
        trailing: action,
        title: title,
        subtitle: child,
      ),
    );
  }
}
