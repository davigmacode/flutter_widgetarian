import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart'
    show
        Theme,
        ThemeData,
        Material,
        MaterialType,
        MaterialStateMouseCursor,
        MaterialStateProperty,
        InteractiveInkFeatureFactory,
        ShapeBorderTween,
        InkWell,
        Tooltip;

import 'package:widgetarian/event.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/colors.dart';
import 'style.dart';
import 'event.dart';

/// Chip widget with smooth animation, event driven style, and many more.
class Checkbox extends StatelessWidget {
  const Checkbox({
    Key? key,
    required this.label,
    this.leading,
    this.trailing,
    this.tooltip,
    this.style,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.splashColor,
    this.splashFactory,
    this.onPressed,
    this.eventsController,
    this.curve = Curves.linear,
    this.duration = Checkbox.defaultDuration,
  }) : super(key: key);

  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  final Widget label;

  /// A custom widget to display prior to the chip's [label].
  final Widget? leading;

  /// A custom widget to display next to the chip's [label].
  final Widget? trailing;

  /// Tooltip string to be used for the body area (where the label and avatar
  /// are) of the chip.
  final String? tooltip;

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

  /// The splash color of the ink response. If this property is null then the
  /// splash color of the theme, [ThemeData.splashColor], will be used.
  final Color? splashColor;

  /// Defines the appearance of the splash.
  ///
  /// Defaults to the value of the theme's splash factory: [ThemeData.splashFactory].
  final InteractiveInkFeatureFactory? splashFactory;

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
  /// If [style] is an event driven [CheckboxStyle]
  /// by [DrivenButtonStyle.driven], then [CheckboxStyle.evaluate]
  /// is used for the following [CheckboxEvent]s:
  ///
  ///  * [CheckboxEvent.disabled].
  ///  * [CheckboxEvent.selected].
  ///  * [CheckboxEvent.hovered].
  ///  * [CheckboxEvent.focused].
  ///  * [CheckboxEvent.pressed].
  final CheckboxStyle? style;

  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  final CheckboxEventController? eventsController;

  /// The curve to apply when animating the parameters of this widget.
  final Curve curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration duration;

  static const defaultDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return _CheckboxRender(
      label: label,
      leading: leading,
      trailing: trailing,
      tooltip: tooltip,
      style: style,
      disabled: disabled,
      autofocus: autofocus,
      focusNode: focusNode,
      splashColor: splashColor,
      splashFactory: splashFactory,
      onPressed: onPressed,
      eventsController: eventsController,
      theme: Theme.of(context),
    );
  }
}

/// Chip widget with smooth animation, event driven style, and many more.
class _CheckboxRender extends ImplicitlyAnimatedWidget {
  const _CheckboxRender({
    Key? key,
    required this.label,
    this.leading,
    this.trailing,
    this.tooltip,
    this.style,
    this.disabled = false,
    this.autofocus = false,
    this.focusNode,
    this.splashColor,
    this.splashFactory,
    this.onPressed,
    this.eventsController,
    required this.theme,
    Curve curve = Curves.linear,
    Duration duration = Checkbox.defaultDuration,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  final Widget label;
  final Widget? leading;
  final Widget? trailing;
  final String? tooltip;
  final bool disabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final VoidCallback? onPressed;
  final CheckboxStyle? style;
  final CheckboxEventController? eventsController;
  final ThemeData theme;

  bool get enabled => !disabled;

  bool get canTap => enabled && hasCallback;

  bool get hasCallback {
    return onPressed != null;
  }

  @override
  _CheckboxRenderState createState() => _CheckboxRenderState();
}

class _CheckboxRenderState extends AnimatedWidgetBaseState<_CheckboxRender>
    with WidgetEventMixin<_CheckboxRender> {
  CheckboxStyle style = const CheckboxStyle();

  @protected
  void setStyle() {
    final style = widget.style ?? CheckboxStyle.toned();
    final resolved = CheckboxStyle.evaluate(style, widgetEvents.value);
    final result = CheckboxStyle.from(resolved);
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
    return style.clipBehavior ?? CheckboxStyle.defaultClipBehavior;
  }

  EdgeInsetsGeometry get containerPadding {
    const defaultPadding = CheckboxStyle.defaultPadding;
    final padding = style.padding ?? defaultPadding;
    return padding.clamp(
      EdgeInsets.only(right: hasTrailing ? 8 : 0),
      EdgeInsetsGeometry.infinity,
    );
  }

  EdgeInsetsGeometry get containerMargin {
    return style.margin ?? CheckboxStyle.defaultMargin;
  }

  BorderRadiusGeometry get containerRadius {
    return style.borderRadius ?? CheckboxStyle.defaultBorderRadius;
  }

  Color get containerShadowColor {
    return style.shadowColor ?? widget.theme.colorScheme.shadow;
  }

  ShapeBorder get containerBorder {
    return RoundedRectangleBorder(
      borderRadius: containerRadius,
      side: BorderSide(
        color: borderColor,
        width: style.borderWidth ?? CheckboxStyle.defaultBorderWidth,
        style: style.borderStyle ?? CheckboxStyle.defaultBorderStyle,
      ),
    );
  }

  TextStyle get foregroundStyle {
    return const TextStyle()
        .merge(widget.theme.chipTheme.labelStyle)
        // .merge(defaultTheme.labelStyle)
        .copyWith(color: foregroundColor)
        .merge(style.foregroundStyle);
  }

  Color get iconColor {
    return style.iconColor ?? foregroundColor;
  }

  Tween<double>? _containerHeightTween;
  double get animatedContainerHeight {
    return _containerHeightTween?.evaluate(animation) ??
        CheckboxStyle.defaultHeight;
  }

  ColorTween? _containerColorTween;
  Color get animatedContainerColor {
    return _containerColorTween?.evaluate(animation) ?? backgroundColor;
  }

  ColorTween? _containerShadowColorTween;
  Color get animatedContainerShadowColor {
    return _containerShadowColorTween?.evaluate(animation) ??
        containerShadowColor;
  }

  ColorTween? _containerOverlayColorTween;
  Color? get animatedContainerOverlayColor {
    return _containerOverlayColorTween?.evaluate(animation) ??
        style.overlayColor;
  }

  Tween<double>? _containerElevationTween;
  double get animatedContainerElevation {
    return _containerElevationTween?.evaluate(animation) ?? 0.0;
  }

  BorderRadiusTween? _containerRadiusTween;
  BorderRadiusGeometry? get animatedContainerRadius {
    return _containerRadiusTween?.evaluate(animation);
  }

  ShapeBorderTween? _containerBorderTween;
  ShapeBorder get animatedContainerBorder {
    return _containerBorderTween?.evaluate(animation) ?? containerBorder;
  }

  EdgeInsetsGeometryTween? _containerPaddingTween;
  EdgeInsetsGeometry get animatedContainerPadding {
    return _containerPaddingTween?.evaluate(animation) ?? containerPadding;
  }

  EdgeInsetsGeometryTween? _containerMarginTween;
  EdgeInsetsGeometry get animatedContainerMargin {
    return _containerMarginTween?.evaluate(animation) ?? containerMargin;
  }

  ColorTween? _foregroundColorTween;
  Color? get animatedForegroundColor {
    return _foregroundColorTween?.evaluate(animation);
  }

  Tween<double>? _foregroundSpacingTween;
  double get animatedForegroundSpacing {
    return _foregroundSpacingTween?.evaluate(animation) ??
        CheckboxStyle.defaultForegroundSpacing;
  }

  TextStyleTween? _foregroundStyleTween;
  TextStyle get animatedForegroundStyle {
    return const TextStyle().merge(_foregroundStyleTween?.evaluate(animation));
  }

  ColorTween? _iconColorTween;
  Color get animatedIconColor {
    return _iconColorTween?.evaluate(animation) ?? iconColor;
  }

  Tween<double>? _iconSizeTween;
  double get animatedIconSize {
    return _iconSizeTween?.evaluate(animation) ?? CheckboxStyle.defaultIconSize;
  }

  Tween<double>? _iconOpacityTween;
  double? get animatedIconOpacity {
    return _iconOpacityTween?.evaluate(animation);
  }

  bool get hasLeading => widget.leading != null;
  bool get hasTrailing => widget.trailing != null;

  Widget get label {
    return Baseline(
      baseline: foregroundStyle.fontSize ?? 14,
      baselineType: TextBaseline.alphabetic,
      child: widget.label,
    );
  }

  void onTap() {
    widgetEvents.toggle(CheckboxEvent.pressed, false);
    widget.onPressed?.call();
  }

  void onTapCancel() {
    widgetEvents.toggle(CheckboxEvent.pressed, false);
  }

  void onTapDown(TapDownDetails details) {
    widgetEvents.toggle(CheckboxEvent.pressed, true);
  }

  void onHover(bool value) {
    widgetEvents.toggle(CheckboxEvent.hovered, value);
  }

  void onFocus(bool value) {
    widgetEvents.toggle(CheckboxEvent.focused, value);
  }

  @override
  void initState() {
    initWidgetEvents(widget.eventsController);
    widgetEvents.toggle(CheckboxEvent.disabled, widget.disabled);
    setStyle();
    super.initState();
  }

  @override
  void didUpdateWidget(_CheckboxRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(CheckboxEvent.disabled, widget.disabled);
      setStyle();
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void forEachTween(visitor) {
    _containerHeightTween = visitor(
      _containerHeightTween,
      style.height ?? CheckboxStyle.defaultHeight,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>;

    _containerRadiusTween = visitor(
      _containerRadiusTween,
      containerRadius,
      (value) => BorderRadiusTween(begin: value),
    ) as BorderRadiusTween?;

    _containerPaddingTween = visitor(
      _containerPaddingTween,
      containerPadding,
      (value) => EdgeInsetsGeometryTween(begin: value),
    ) as EdgeInsetsGeometryTween?;

    _containerMarginTween = visitor(
      _containerMarginTween,
      containerMargin,
      (value) => EdgeInsetsGeometryTween(begin: value),
    ) as EdgeInsetsGeometryTween?;

    _containerBorderTween = visitor(
      _containerBorderTween,
      containerBorder,
      (value) => ShapeBorderTween(begin: value),
    ) as ShapeBorderTween?;

    _containerColorTween = visitor(
      _containerColorTween,
      backgroundColor,
      (value) => ColorTween(begin: value),
    ) as ColorTween?;

    _containerShadowColorTween = visitor(
      _containerShadowColorTween,
      containerShadowColor,
      (value) => ColorTween(begin: value),
    ) as ColorTween?;

    _containerOverlayColorTween = visitor(
      _containerOverlayColorTween,
      style.overlayColor,
      (value) => ColorTween(begin: value),
    ) as ColorTween?;

    _containerElevationTween = visitor(
      _containerElevationTween,
      style.elevation ?? 0.0,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>;

    _foregroundColorTween = visitor(
      _foregroundColorTween,
      foregroundColor,
      (value) => ColorTween(begin: value),
    ) as ColorTween?;

    _foregroundSpacingTween = visitor(
      _foregroundSpacingTween,
      style.foregroundSpacing ?? CheckboxStyle.defaultForegroundSpacing,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    _foregroundStyleTween = visitor(
      _foregroundStyleTween,
      foregroundStyle,
      (value) => TextStyleTween(begin: value),
    ) as TextStyleTween?;

    _iconColorTween = visitor(
      _iconColorTween,
      iconColor,
      (value) => ColorTween(begin: value),
    ) as ColorTween?;

    _iconSizeTween = visitor(
      _iconSizeTween,
      style.iconSize ?? CheckboxStyle.defaultIconSize,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    _iconOpacityTween = visitor(
      _iconOpacityTween,
      style.iconOpacity,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>?;
  }

  @override
  void didChangeWidgetEvents() {
    super.didChangeWidgetEvents();
    // print('${widget.label.toString()} ${widgetEvents.value.toString()}');
    didUpdateWidget(widget);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      button: widget.canTap,
      enabled: widget.enabled,
      child: _Tooltip(
        message: widget.tooltip,
        enabled: widget.canTap,
        child: Padding(
          padding: animatedContainerMargin,
          child: Box(
            color: animatedContainerColor,
            clipBehavior: containerClipBehavior,
            shape: animatedContainerBorder,
            shadowColor: animatedContainerShadowColor,
            elevation: animatedContainerElevation,
            height: animatedContainerHeight,
            child: _ButtonEvent(
              enabled: widget.canTap,
              autofocus: widget.autofocus,
              focusNode: widget.focusNode,
              splashFactory: widget.splashFactory,
              overlayColor: animatedContainerOverlayColor,
              splashColor: widget.splashColor,
              onTap: onTap,
              onTapCancel: onTapCancel,
              onTapDown: onTapDown,
              onHover: onHover,
              onFocus: onFocus,
              child: _ButtonForeground(
                textStyle: animatedForegroundStyle,
                iconTheme: IconThemeData(
                  color: animatedIconColor,
                  size: animatedIconSize,
                  opacity: animatedIconOpacity,
                ),
                padding: animatedContainerPadding,
                spacing: animatedForegroundSpacing,
                label: label,
                leading: widget.leading,
                trailing: widget.trailing,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonEvent extends StatelessWidget {
  const _ButtonEvent({
    Key? key,
    required this.child,
    required this.onTap,
    required this.onTapDown,
    required this.onTapCancel,
    required this.onHover,
    required this.onFocus,
    this.overlayColor,
    this.splashColor,
    this.splashFactory,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
  }) : super(key: key);

  final Widget child;
  final bool enabled;
  final bool autofocus;
  final FocusNode? focusNode;
  final Color? overlayColor;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final GestureTapCallback onTap;
  final GestureTapCancelCallback onTapCancel;
  final GestureTapDownCallback onTapDown;
  final ValueChanged<bool> onHover;
  final ValueChanged<bool> onFocus;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        overlayColor: MaterialStateProperty.all<Color?>(overlayColor),
        canRequestFocus: enabled,
        autofocus: autofocus,
        focusNode: focusNode,
        splashColor: splashColor,
        splashFactory: splashFactory,
        onTap: enabled ? onTap : null,
        onTapCancel: enabled ? onTapCancel : null,
        onTapDown: enabled ? onTapDown : null,
        onHover: onHover,
        onFocusChange: onFocus,
        child: child,
      ),
    );
  }
}

class _ButtonForeground extends StatelessWidget {
  const _ButtonForeground({
    Key? key,
    required this.padding,
    required this.textStyle,
    required this.iconTheme,
    required this.label,
    this.leading,
    this.trailing,
    this.spacing = 0.0,
  }) : super(key: key);

  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;
  final IconThemeData iconTheme;
  final Widget label;
  final Widget? leading;
  final Widget? trailing;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    // to keep the wrap spacing
    const placeholder = SizedBox.square(dimension: 0);
    return DefaultTextStyle(
      style: textStyle,
      overflow: TextOverflow.fade,
      textAlign: TextAlign.start,
      softWrap: false,
      maxLines: 1,
      child: IconTheme(
        data: iconTheme,
        child: Padding(
          padding: padding,
          child: Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: spacing,
            children: [
              leading ?? placeholder,
              label,
              trailing ?? placeholder,
            ].whereType<Widget>().toList(growable: false),
          ),
        ),
      ),
    );
  }
}

class _Tooltip extends StatelessWidget {
  const _Tooltip({
    Key? key,
    this.message,
    this.enabled = true,
    required this.child,
  }) : super(key: key);

  final String? message;
  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (enabled && message != null) {
      return Tooltip(
        message: message,
        child: child,
      );
    }
    return child;
  }
}
