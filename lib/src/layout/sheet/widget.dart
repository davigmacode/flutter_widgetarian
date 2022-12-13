import 'package:flutter/material.dart' show Theme, ThemeData;

import 'package:flutter/widgets.dart';
import 'package:widgetarian/animation.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';
import '../box.dart';
import 'style.dart';
import 'theme.dart';

/// Sheet widget with smooth animation, event driven style, and many more.
class Sheet extends StatelessWidget {
  const Sheet({
    Key? key,
    this.selected,
    this.loading = false,
    this.disabled = false,
    this.eventsController,
    this.duration = Sheet.defaultDuration,
    this.curve = Sheet.defaultCurve,
    this.tooltip,
    this.style,
    this.child,
  }) : super(key: key);

  /// Tooltip string to be used for the body area of the button.
  final String? tooltip;

  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  final Widget? child;

  final bool? selected;

  final bool loading;

  /// Whether or not this chip is disabled for input.
  ///
  /// Defaults to false. Cannot be null.
  final bool disabled;

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
    return _SheetRender(
      curve: curve,
      duration: duration,
      theme: Theme.of(context),
      style: style ?? SheetTheme.of(context).style,
      selected: selected,
      loading: loading,
      disabled: disabled,
      eventsController: eventsController,
      tooltip: tooltip,
      child: child,
    );
  }
}

class _SheetRender extends StatefulWidget {
  const _SheetRender({
    Key? key,
    this.selected,
    this.loading = false,
    this.disabled = false,
    this.eventsController,
    this.curve = Sheet.defaultCurve,
    this.duration = Sheet.defaultDuration,
    this.tooltip,
    required this.theme,
    required this.style,
    required this.child,
  }) : super(key: key);

  final Widget? child;
  final String? tooltip;
  final bool? selected;
  final bool loading;
  final bool disabled;
  final SheetStyle style;
  final WidgetEventController? eventsController;
  final ThemeData theme;

  /// The curve to apply when animating the parameters of this widget.
  final Curve curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration duration;

  bool get enabled => !disabled && !loading;

  @override
  State<_SheetRender> createState() => _SheetRenderState();
}

class _SheetRenderState extends State<_SheetRender>
    with WidgetEventMixin<_SheetRender> {
  SheetStyle style = const SheetStyle();

  @protected
  void setStyle() {
    final raw = widget.style;
    final resolved = SheetStyle.evaluate(raw, widgetEvents.value);
    style = SheetStyle.from(resolved);
    setState(() {});
  }

  Color get defaultBackgroundColor {
    return style.isOutlined
        ? widget.theme.colorScheme.surface
        : widget.theme.unselectedWidgetColor;
  }

  Color get defaultBorderColor {
    return widget.theme.colorScheme.outline;
  }

  Color get defaultForegroundColor {
    return style.isFilled
        ? Colors.colorOnSurface(backgroundColor)!
        : widget.theme.colorScheme.onSurface;
  }

  Color get backgroundColor => Colors.colorWithOpacityOrAlpha(
        style.backgroundColor ?? defaultBackgroundColor,
        style.backgroundOpacity,
        style.backgroundAlpha,
      );

  Color get borderColor => Colors.colorWithOpacityOrAlpha(
        style.borderColor ?? defaultBorderColor,
        style.borderOpacity,
        style.borderAlpha,
      );

  Color get foregroundColor => Colors.colorWithOpacityOrAlpha(
        style.foregroundColor ?? defaultForegroundColor,
        style.foregroundOpacity,
        style.foregroundAlpha,
      );

  Clip get clipBehavior {
    return style.clipBehavior ?? SheetStyle.defaultClipBehavior;
  }

  double? get width {
    return style.shape == BoxShape.circle ? height : style.width;
  }

  double? get height {
    return style.height;
  }

  EdgeInsetsGeometry get padding {
    final defaultPadding = style.shape == BoxShape.circle
        ? EdgeInsets.zero
        : SheetStyle.defaultPadding;
    return style.padding ?? defaultPadding;
  }

  EdgeInsetsGeometry get margin {
    return style.margin ?? SheetStyle.defaultMargin;
  }

  Color get shadowColor {
    return style.shadowColor ?? widget.theme.colorScheme.shadow;
  }

  BoxShape get shape {
    return style.shape ?? BoxShape.rectangle;
  }

  BorderRadius get borderRadius {
    return style.borderRadius ?? SheetStyle.defaultBorderRadius;
  }

  BorderSide get borderSide {
    return BorderSide(
      color: borderColor,
      width: style.borderWidth ?? SheetStyle.defaultBorderWidth,
      style: style.borderStyle ?? SheetStyle.defaultBorderStyle,
    );
  }

  TextStyle get foregroundStyle {
    return const TextStyle()
        .copyWith(color: foregroundColor)
        .merge(style.foregroundStyle);
  }

  Color get iconColor {
    return style.iconColor ?? foregroundColor;
  }

  double get iconSize {
    return style.iconSize ?? SheetStyle.defaultIconSize;
  }

  @override
  void initState() {
    initWidgetEvents(widget.eventsController);
    widgetEvents.toggle(WidgetEvent.indeterminate, widget.selected == null);
    widgetEvents.toggle(WidgetEvent.selected, widget.selected == true);
    widgetEvents.toggle(WidgetEvent.loading, widget.loading);
    widgetEvents.toggle(WidgetEvent.disabled, widget.disabled);
    setStyle();
    super.initState();
  }

  @override
  void didUpdateWidget(_SheetRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(WidgetEvent.indeterminate, widget.selected == null);
      widgetEvents.toggle(WidgetEvent.selected, widget.selected == true);
      widgetEvents.toggle(WidgetEvent.loading, widget.loading);
      widgetEvents.toggle(WidgetEvent.disabled, widget.disabled);
      setStyle();
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void didChangeWidgetEvents() {
    super.didChangeWidgetEvents();
    didUpdateWidget(widget);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      enabled: widget.enabled,
      child: AnimatedDefaultTextStyle(
        curve: widget.curve,
        duration: widget.duration,
        style: foregroundStyle,
        child: AnimatedIconTheme(
          data: IconThemeData(
            color: iconColor,
            size: style.iconSize,
            opacity: style.iconOpacity,
          ),
          child: AnimatedBox(
            curve: widget.curve,
            duration: widget.duration,
            tooltip: widget.tooltip,
            color: backgroundColor,
            clipBehavior: clipBehavior,
            shape: shape,
            borderSide: borderSide,
            borderRadius: borderRadius,
            shadowColor: shadowColor,
            elevation: style.elevation,
            padding: padding,
            margin: margin,
            width: width,
            height: height,
            alignment: style.alignment,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
