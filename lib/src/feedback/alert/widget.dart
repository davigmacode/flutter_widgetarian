import 'package:flutter/widgets.dart';
import 'package:widgetarian/layout.dart';
import 'style.dart';
import 'theme.dart';

/// Attract user attention with important static message
class Alert extends StatelessWidget {
  const Alert({
    Key? key,
    this.title,
    this.message,
    this.icon,
    this.action,
    this.style,
    this.curve,
    this.duration,
  }) : super(key: key);

  /// The primary content of the [Alert].
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// The text to display below the [title]
  final Widget? message;

  /// Icon displayed prior to [title]
  final Widget? icon;

  /// Widget displayed next to [title]
  final Widget? action;

  /// The style to be applied to the alert.
  final AlertStyle? style;

  /// The curve to apply when animating the parameters of this widget.
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    final alertTheme = AlertTheme.of(context);
    return Sheet(
      curve: curve ?? alertTheme.curve,
      duration: duration ?? alertTheme.duration,
      style: alertTheme.style.merge(style),
      child: ListTile(
        leading: icon,
        trailing: action,
        title: title,
        subtitle: message,
      ),
    );
  }
}
