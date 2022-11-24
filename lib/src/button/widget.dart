import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' show Theme, ThemeData;

import 'package:widgetarian/event.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/anchor.dart';
import 'package:widgetarian/animation.dart';
import 'style.dart';
import 'theme.dart';
import 'event.dart';

/// Chip widget with smooth animation, event driven style, and many more.
class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.child,
    this.leading,
    this.trailing,
    this.tooltip,
    this.style,
    this.checked,
    this.loading = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onPressed,
    this.eventsController,
    this.curve = Curves.linear,
    this.duration = Button.defaultDuration,
  }) : super(key: key);

  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// A custom widget to display prior to the chip's [child].
  final Widget? leading;

  /// A custom widget to display next to the chip's [child].
  final Widget? trailing;

  /// Tooltip string to be used for the body area of the button.
  final String? tooltip;

  final bool? checked;

  final bool loading;

  /// Whether or not this chip is disabled for input.
  ///
  /// Defaults to false. Cannot be null.
  final bool disabled;

  /// True if this widget will be selected as the initial focus
  /// when no other node in its scope is currently focused.
  ///
  /// Ideally, there is only one widget with autofocus set in each [FocusScope].
  /// If there is more than one widget with autofocus set,
  /// then the first one added to the tree will get focus.
  ///
  /// Must not be null. Defaults to false.
  final bool autofocus;

  /// An optional focus node to use as the focus node for this widget.
  ///
  /// If one is not supplied, then one will be automatically allocated, owned,
  /// and managed by this widget. The widget will be focusable even if a [focusNode] is not supplied.
  /// If supplied, the given focusNode will be hosted by this widget, but not owned.
  /// See [FocusNode] for more information on what being hosted and/or owned implies.
  ///
  /// Supplying a focus node is sometimes useful if an ancestor
  /// to this widget wants to control when this widget has the focus.
  /// The owner will be responsible for calling [FocusNode.dispose]
  /// on the focus node when it is done with it, but this widget
  /// will attach/detach and reparent the node when needed.
  final FocusNode? focusNode;

  /// Called when the user taps the chip.
  ///
  /// If [onPressed] is set, then this callback will be called when the user
  /// taps on the label or avatar parts of the chip. If [onPressed] is null,
  /// then the chip will be disabled.
  ///
  /// {@tool snippet}
  ///
  /// ```dart
  /// class Blacksmith extends StatelessWidget {
  ///   const Blacksmith({Key? key}) : super(key: key);
  ///
  ///   void startHammering() {
  ///     print('bang bang bang');
  ///   }
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return DrivenButton(
  ///       label: const Text('Apply Hammer'),
  ///       onPressed: startHammering,
  ///     );
  ///   }
  /// }
  /// ```
  /// {@end-tool}
  final VoidCallback? onPressed;

  /// The style to be applied to the chip.
  ///
  /// If [style] is an event driven [ButtonStyle]
  /// by [DrivenButtonStyle.driven], then [ButtonStyle.evaluate]
  /// is used for the following [ButtonEvent]s:
  ///
  ///  * [ButtonEvent.disabled].
  ///  * [ButtonEvent.selected].
  ///  * [ButtonEvent.hovered].
  ///  * [ButtonEvent.focused].
  ///  * [ButtonEvent.pressed].
  final ButtonStyle? style;

  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  final ButtonEventController? eventsController;

  /// The curve to apply when animating the parameters of this widget.
  final Curve curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration duration;

  static const defaultDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return _ButtonRender(
      theme: Theme.of(context),
      style: style ?? ButtonTheme.of(context),
      checked: checked,
      loading: loading,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      onPressed: onPressed,
      eventsController: eventsController,
      leading: leading,
      trailing: trailing,
      tooltip: tooltip,
      child: child,
    );
  }
}

/// Chip widget with smooth animation, event driven style, and many more.
class _ButtonRender extends ImplicitlyAnimatedWidget {
  const _ButtonRender({
    Key? key,
    required this.child,
    this.leading,
    this.trailing,
    this.tooltip,
    required this.style,
    this.checked,
    this.loading = false,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.onPressed,
    this.eventsController,
    required this.theme,
    Curve curve = Curves.linear,
    Duration duration = Button.defaultDuration,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final String? tooltip;
  final bool? checked;
  final bool loading;
  final bool disabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final VoidCallback? onPressed;
  final ButtonStyle style;
  final ButtonEventController? eventsController;
  final ThemeData theme;

  bool get enabled => !disabled && !loading;

  bool get canTap => enabled && hasCallback;

  bool get hasCallback {
    return onPressed != null;
  }

  @override
  _ButtonRenderState createState() => _ButtonRenderState();
}

class _ButtonRenderState extends AnimatedWidgetBaseState<_ButtonRender>
    with WidgetEventMixin<_ButtonRender> {
  ButtonStyle style = const ButtonStyle();

  @protected
  void setStyle() {
    final style = widget.style;
    final resolved = ButtonStyle.evaluate(style, widgetEvents.value);
    final result = ButtonStyle.from(resolved);
    this.style = result;
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

  Color get backgroundColor {
    Color color = style.backgroundColor ?? defaultBackgroundColor;
    color = Colors.colorWithOpacity(color, style.backgroundOpacity);
    color = Colors.colorWithAlpha(color, style.backgroundAlpha);
    return color;
  }

  Color get borderColor {
    Color color = style.borderColor ?? defaultBorderColor;
    color = Colors.colorWithOpacity(color, style.borderOpacity);
    color = Colors.colorWithAlpha(color, style.borderAlpha);
    return color;
  }

  Color get foregroundColor {
    Color color = style.foregroundColor ?? defaultForegroundColor;
    color = Colors.colorWithOpacity(color, style.foregroundOpacity);
    color = Colors.colorWithAlpha(color, style.foregroundAlpha);
    return color;
  }

  Clip get containerClipBehavior {
    return style.clipBehavior ?? ButtonStyle.defaultClipBehavior;
  }

  double? get containerWidth {
    return style.shape == BoxShape.circle
        ? ButtonStyle.defaultHeight
        : style.width;
  }

  double get containerHeight {
    return style.height ?? ButtonStyle.defaultHeight;
  }

  EdgeInsetsGeometry get containerPadding {
    final defaultPadding = style.shape == BoxShape.circle
        ? EdgeInsets.zero
        : ButtonStyle.defaultPadding;
    final padding = style.padding ?? defaultPadding;
    return padding.clamp(
      EdgeInsets.only(right: hasTrailing ? 8 : 0),
      EdgeInsetsGeometry.infinity,
    );
  }

  EdgeInsetsGeometry get containerMargin {
    return style.margin ?? ButtonStyle.defaultMargin;
  }

  Color get containerShadowColor {
    return style.shadowColor ?? widget.theme.colorScheme.shadow;
  }

  BoxShape get containerShape {
    return style.shape ?? BoxShape.rectangle;
  }

  BorderRadius get containerBorderRadius {
    return style.borderRadius ?? ButtonStyle.defaultBorderRadius;
  }

  BorderSide get containerBorderSide {
    return BorderSide(
      color: borderColor,
      width: style.borderWidth ?? ButtonStyle.defaultBorderWidth,
      style: style.borderStyle ?? ButtonStyle.defaultBorderStyle,
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
    return style.iconSize ?? ButtonStyle.defaultIconSize;
  }

  ColorTween? _containerOverlayColorTween;
  Color? get animatedContainerOverlayColor {
    return _containerOverlayColorTween?.evaluate(animation) ??
        style.overlayColor;
  }

  EdgeInsetsGeometryTween? _containerPaddingTween;
  EdgeInsetsGeometry get animatedContainerPadding {
    return _containerPaddingTween?.evaluate(animation) ?? containerPadding;
  }

  Tween<double>? _foregroundSpacingTween;
  double get animatedForegroundSpacing {
    return _foregroundSpacingTween?.evaluate(animation) ??
        ButtonStyle.defaultForegroundSpacing;
  }

  bool get hasLeading => widget.leading != null;
  bool get hasTrailing => widget.trailing != null;

  void onTap() {
    widgetEvents.toggle(ButtonEvent.pressed, false);
    widget.onPressed?.call();
  }

  void onTapCancel() {
    widgetEvents.toggle(ButtonEvent.pressed, false);
  }

  void onTapDown(TapDownDetails details) {
    widgetEvents.toggle(ButtonEvent.pressed, true);
  }

  void onHover(bool value) {
    widgetEvents.toggle(ButtonEvent.hovered, value);
  }

  void onFocus(bool value) {
    widgetEvents.toggle(ButtonEvent.focused, value);
  }

  @override
  void initState() {
    initWidgetEvents(widget.eventsController);
    widgetEvents.toggle(ButtonEvent.indeterminate, widget.checked == null);
    widgetEvents.toggle(ButtonEvent.selected, widget.checked == true);
    widgetEvents.toggle(ButtonEvent.loading, widget.loading);
    widgetEvents.toggle(ButtonEvent.disabled, widget.disabled);
    setStyle();
    super.initState();
  }

  @override
  void didUpdateWidget(_ButtonRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(ButtonEvent.indeterminate, widget.checked == null);
      widgetEvents.toggle(ButtonEvent.selected, widget.checked == true);
      widgetEvents.toggle(ButtonEvent.loading, widget.loading);
      widgetEvents.toggle(ButtonEvent.disabled, widget.disabled);
      setStyle();
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void forEachTween(visitor) {
    _containerPaddingTween = visitor(
      _containerPaddingTween,
      containerPadding,
      (value) => EdgeInsetsGeometryTween(begin: value),
    ) as EdgeInsetsGeometryTween?;

    _containerOverlayColorTween = visitor(
      _containerOverlayColorTween,
      style.overlayColor,
      (value) => ColorTween(begin: value),
    ) as ColorTween?;

    _foregroundSpacingTween = visitor(
      _foregroundSpacingTween,
      style.foregroundSpacing ?? ButtonStyle.defaultForegroundSpacing,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>?;
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
      button: widget.canTap,
      enabled: widget.enabled,
      child: AnimatedBox(
        curve: widget.curve,
        duration: widget.duration,
        tooltip: widget.canTap ? widget.tooltip : null,
        color: backgroundColor,
        clipBehavior: containerClipBehavior,
        shape: containerShape,
        borderSide: containerBorderSide,
        borderRadius: containerBorderRadius,
        shadowColor: containerShadowColor,
        elevation: style.elevation,
        margin: containerMargin,
        width: containerWidth,
        height: containerHeight,
        child: Anchor(
          padding: animatedContainerPadding,
          disabled: !widget.canTap,
          autofocus: widget.autofocus,
          focusNode: widget.focusNode,
          overlayColor: animatedContainerOverlayColor,
          onTap: onTap,
          onTapDown: onTapDown,
          onTapCancel: onTapCancel,
          onHover: onHover,
          onFocus: onFocus,
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
              child: Tile(
                expanded: containerWidth == double.infinity,
                spacing: animatedForegroundSpacing,
                leading: widget.leading != null
                    ? DrivenWidget.evaluate(
                        widget.leading!,
                        widgetEvents.value,
                      )
                    : null,
                trailing: widget.trailing != null
                    ? DrivenWidget.evaluate(
                        widget.trailing!,
                        widgetEvents.value,
                      )
                    : null,
                child: DrivenWidget.evaluate(
                  widget.child,
                  widgetEvents.value,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
