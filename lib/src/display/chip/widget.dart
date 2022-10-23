import 'package:flutter/material.dart' hide Colors;
import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/colors.dart';
import 'style.dart';
import 'event.dart';

/// Chip widget with smooth animation, event driven style, and many more.
class Chip extends StatelessWidget {
  const Chip({
    Key? key,
    required this.label,
    this.avatarImage,
    this.avatarText,
    this.leading,
    this.trailing,
    this.tooltip,
    this.deleteIcon,
    this.deleteTooltip,
    this.style,
    this.selected = false,
    this.disabled = false,
    this.checkmark = false,
    this.autofocus = false,
    this.focusNode,
    this.splashColor,
    this.splashFactory,
    this.onPressed,
    this.onDeleted,
    this.onSelected,
    this.eventsController,
    this.curve = Curves.linear,
    this.duration = Chip.defaultDuration,
  }) : super(key: key);

  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  final Widget label;

  /// Typically used as profile image.
  ///
  /// If the avatar is to have the user's initials, use [avatarText] instead.
  final ImageProvider? avatarImage;

  /// The primary content of the chip avatar.
  ///
  /// Typically a [Text] widget.
  final Widget? avatarText;

  /// A custom widget to display prior to the chip's [label].
  final Widget? leading;

  /// A custom widget to display next to the chip's [label].
  final Widget? trailing;

  /// Tooltip string to be used for the body area (where the label and avatar
  /// are) of the chip.
  final String? tooltip;

  /// The icon displayed when [onDeleted] is set.
  ///
  /// Defaults to an [Icon] widget set to use [Icons.cancel].
  final Widget? deleteIcon;

  /// The message to be used for the chip's delete button tooltip.
  ///
  /// If provided with an empty string, the tooltip of the delete button will be
  /// disabled.
  ///
  /// If null, the default [MaterialLocalizations.deleteButtonTooltip] will be
  /// used.
  final String? deleteTooltip;

  /// Whether or not this chip is selected.
  ///
  /// If [onSelected] is not null, this value will be used to determine if the
  /// select checkmark will be shown or not.
  ///
  /// Must not be null. Defaults to false.
  final bool selected;

  /// Whether or not this chip is disabled for input.
  ///
  /// Defaults to false. Cannot be null.
  final bool disabled;

  /// Whether or not to show a checkmark when [selected] is true.
  ///
  /// Defaults to false. Cannot ve null.
  final bool checkmark;

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
  ///     return Chip(
  ///       label: const Text('Apply Hammer'),
  ///       onPressed: startHammering,
  ///     );
  ///   }
  /// }
  /// ```
  /// {@end-tool}
  final VoidCallback? onPressed;

  /// Called when the user taps the [deleteIcon] to delete the chip.
  ///
  /// If null, the delete button will not appear on the chip.
  ///
  /// The chip will not automatically remove itself: this just tells the app
  /// that the user tapped the delete button.
  final VoidCallback? onDeleted;

  /// Called when the chip should change between selected and de-selected
  /// states.
  ///
  /// When the chip is tapped, then the [onSelected] callback, if set, will be
  /// applied to `!selected` (see [selected]).
  ///
  /// The chip passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the chip with the new
  /// value.
  ///
  /// The callback provided to [onSelected] should update the state of the
  /// parent [StatefulWidget] using the [State.setState] method, so that the
  /// parent gets rebuilt.
  ///
  /// The [onSelected] and [onPressed] callbacks must not
  /// both be specified at the same time.
  ///
  /// {@tool snippet}
  ///
  /// A [StatefulWidget] that illustrates use of onSelected in an [InputChip].
  ///
  /// ```dart
  /// class Wood extends StatefulWidget {
  ///   const Wood({Key? key}) : super(key: key);
  ///
  ///   @override
  ///   State<StatefulWidget> createState() => WoodState();
  /// }
  ///
  /// class WoodState extends State<Wood> {
  ///   bool _useChisel = false;
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return Chip(
  ///       label: const Text('Use Chisel'),
  ///       selected: _useChisel,
  ///       onSelected: (bool newValue) {
  ///         setState(() {
  ///           _useChisel = newValue;
  ///         });
  ///       },
  ///     );
  ///   }
  /// }
  /// ```
  /// {@end-tool}
  final ValueChanged<bool>? onSelected;

  /// The style to be applied to the chip.
  ///
  /// If [style] is an event driven [ChipStyle]
  /// by [ChipStyle.driven], then [ChipStyle.evaluate]
  /// is used for the following [ChipEvent]s:
  ///
  ///  * [ChipEvent.disabled].
  ///  * [ChipEvent.selected].
  ///  * [ChipEvent.hovered].
  ///  * [ChipEvent.focused].
  ///  * [ChipEvent.pressed].
  final ChipStyle? style;

  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  final ChipEventController? eventsController;

  /// The curve to apply when animating the parameters of this widget.
  final Curve curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration duration;

  static const defaultDuration = Duration(milliseconds: 200);

  bool get enabled => !disabled;

  bool get canTap => enabled && hasCallback;

  bool get canDelete => onDeleted != null;

  bool get hasCallback {
    return onPressed != null || onSelected != null;
  }

  @override
  Widget build(BuildContext context) {
    return _ChipRender(
      label: label,
      avatarImage: avatarImage,
      avatarText: avatarText,
      leading: leading,
      trailing: trailing,
      tooltip: tooltip,
      deleteIcon: deleteIcon,
      deleteTooltip: deleteTooltip,
      style: style,
      selected: selected,
      disabled: disabled,
      checkmark: checkmark,
      autofocus: autofocus,
      focusNode: focusNode,
      splashColor: splashColor,
      splashFactory: splashFactory,
      onPressed: onPressed,
      onDeleted: onDeleted,
      onSelected: onSelected,
      eventsController: eventsController,
      theme: Theme.of(context),
    );
  }
}

/// Chip widget with smooth animation, event driven style, and many more.
class _ChipRender extends ImplicitlyAnimatedWidget {
  const _ChipRender({
    Key? key,
    required this.label,
    this.avatarImage,
    this.avatarText,
    this.leading,
    this.trailing,
    this.tooltip,
    this.deleteIcon,
    this.deleteTooltip,
    this.style,
    this.selected = false,
    this.disabled = false,
    this.checkmark = false,
    this.autofocus = false,
    this.focusNode,
    this.splashColor,
    this.splashFactory,
    this.onPressed,
    this.onDeleted,
    this.onSelected,
    this.eventsController,
    required this.theme,
    Curve curve = Curves.linear,
    Duration duration = Chip.defaultDuration,
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  final Widget label;
  final ImageProvider? avatarImage;
  final Widget? avatarText;
  final Widget? leading;
  final Widget? trailing;
  final String? tooltip;
  final Widget? deleteIcon;
  final String? deleteTooltip;
  final bool selected;
  final bool disabled;
  final bool checkmark;
  final bool autofocus;
  final FocusNode? focusNode;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final VoidCallback? onPressed;
  final VoidCallback? onDeleted;
  final ValueChanged<bool>? onSelected;
  final ChipStyle? style;
  final ChipEventController? eventsController;
  final ThemeData theme;

  bool get enabled => !disabled;

  bool get canTap => enabled && hasCallback;

  bool get canDelete => onDeleted != null;

  bool get hasCallback {
    return onPressed != null || onSelected != null;
  }

  @override
  _ChipRenderState createState() => _ChipRenderState();
}

class _ChipRenderState extends AnimatedWidgetBaseState<_ChipRender>
    with WidgetEventMixin<_ChipRender> {
  ChipStyle style = const ChipStyle();

  @protected
  void setStyle() {
    final style = widget.style ?? ChipStyle.toned();
    final resolved = ChipStyle.evaluate(style, widgetEvents.value);
    final result = ChipStyle.from(resolved);
    this.style = result;
    setState(() {});
  }

  Color get defaultBackgroundColor {
    return widget.selected
        ? widget.theme.brightness == Brightness.light
            ? widget.theme.colorScheme.primary
            : widget.theme.colorScheme.inversePrimary
        : style.isOutlined
            ? widget.theme.colorScheme.surface
            : widget.theme.unselectedWidgetColor;
  }

  Color get defaultBorderColor {
    return widget.selected
        ? widget.theme.colorScheme.primary
        : widget.theme.colorScheme.outline;
  }

  Color get defaultForegroundColor {
    return style.isFilled
        ? widget.selected && widget.disabled
            ? widget.theme.colorScheme.primary
            : Colors.colorOnSurface(backgroundColor)!
        : widget.selected
            ? widget.theme.colorScheme.primary
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
    return style.clipBehavior ?? ChipStyle.defaultClipBehavior;
  }

  EdgeInsetsGeometry get containerPadding {
    final defaultPadding = hasAvatar
        ? ChipStyle.defaultPaddingWithAvatar
        : ChipStyle.defaultPadding;
    final padding = style.padding ?? defaultPadding;
    return padding.clamp(
      EdgeInsets.only(right: hasTrailing ? 8 : 0),
      EdgeInsetsGeometry.infinity,
    );
  }

  EdgeInsetsGeometry get containerMargin {
    return style.margin ?? ChipStyle.defaultMargin;
  }

  BorderRadiusGeometry get containerRadius {
    return style.borderRadius ?? ChipStyle.defaultBorderRadius;
  }

  Color get containerShadowColor {
    return style.shadowColor ?? widget.theme.colorScheme.shadow;
  }

  ShapeBorder get containerBorder {
    return RoundedRectangleBorder(
      borderRadius: containerRadius,
      side: BorderSide(
        color: borderColor,
        width: style.borderWidth ?? ChipStyle.defaultBorderWidth,
        style: style.borderStyle ?? ChipStyle.defaultBorderStyle,
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

  Color get avatarBackgroundColor {
    final color = style.avatarBackgroundColor ?? foregroundColor;
    return style.isFilled ? foregroundColor.withOpacity(.7) : color;
  }

  Color get avatarForegroundColor {
    return style.avatarForegroundColor ??
        (style.isFilled
            ? backgroundColor
            : Colors.colorOnSurface(avatarBackgroundColor)) ??
        foregroundColor;
  }

  TextStyle get avatarForegroundStyle {
    return const TextStyle(
      height: 1,
      fontSize: 12,
    ).copyWith(color: avatarForegroundColor).merge(style.avatarForegroundStyle);
  }

  ShapeBorder get avatarBorder {
    final radius = style.avatarBorderRadius;
    return radius != null
        ? RoundedRectangleBorder(
            borderRadius: radius,
            side: BorderSide.none,
          )
        : const CircleBorder(
            side: BorderSide.none,
          );
  }

  BoxDecoration get avatarDecoration {
    return BoxDecoration(
      color: avatarBackgroundColor,
      image: widget.avatarImage != null
          ? DecorationImage(
              image: widget.avatarImage!,
              fit: BoxFit.cover,
            )
          : null,
      shape: BoxShape.rectangle,
    );
  }

  Color get checkmarkColor {
    return style.checkmarkColor ??
        (hasAvatar ? avatarForegroundColor : foregroundColor);
  }

  Color get iconColor {
    return style.iconColor ?? foregroundColor;
  }

  Tween<double>? _containerHeightTween;
  double get animatedContainerHeight {
    return _containerHeightTween?.evaluate(animation) ??
        ChipStyle.defaultHeight;
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
        ChipStyle.defaultForegroundSpacing;
  }

  TextStyleTween? _foregroundStyleTween;
  TextStyle get animatedForegroundStyle {
    return const TextStyle().merge(_foregroundStyleTween?.evaluate(animation));
  }

  TextStyleTween? _avatarForegroundStyleTween;
  TextStyle get animatedAvatarForegroundStyle {
    return const TextStyle()
        .merge(_avatarForegroundStyleTween?.evaluate(animation));
  }

  ColorTween? _avatarForegroundColorTween;
  Color get animatedAvatarForegroundColor {
    return _avatarForegroundColorTween?.evaluate(animation) ??
        avatarForegroundColor;
  }

  ShapeBorderTween? _avatarBorderTween;
  ShapeBorder get animatedAvatarBorder {
    return _avatarBorderTween?.evaluate(animation) ?? avatarBorder;
  }

  DecorationTween? _avatarDecorationTween;
  Decoration get animatedAvatarDecoration {
    return _avatarDecorationTween?.evaluate(animation) ?? avatarDecoration;
  }

  SizeTween? _avatarSizeTween;
  Size get animatedAvatarSize {
    return _avatarSizeTween?.evaluate(animation) ?? ChipStyle.defaultAvatarSize;
  }

  ColorTween? _checkmarkColorTween;
  Color get animatedCheckmarkColor {
    return _checkmarkColorTween?.evaluate(animation) ?? checkmarkColor;
  }

  Tween<double>? _checkmarkProgressTween;
  double get animatedCheckmarkProgress {
    return _checkmarkProgressTween?.evaluate(animation) ?? 0;
  }

  Tween<double>? _checkmarkSizeTween;
  double get animatedCheckmarkSize {
    return _checkmarkSizeTween?.evaluate(animation) ??
        ChipStyle.defaultCheckmarkSize;
  }

  Tween<double>? _checkmarkWeightTween;
  double get animatedCheckmarkWeight {
    return _checkmarkWeightTween?.evaluate(animation) ??
        ChipStyle.defaultCheckmarkWeight;
  }

  ColorTween? _iconColorTween;
  Color get animatedIconColor {
    return _iconColorTween?.evaluate(animation) ?? iconColor;
  }

  Tween<double>? _iconSizeTween;
  double get animatedIconSize {
    return _iconSizeTween?.evaluate(animation) ?? ChipStyle.defaultIconSize;
  }

  Tween<double>? _iconOpacityTween;
  double? get animatedIconOpacity {
    return _iconOpacityTween?.evaluate(animation);
  }

  bool get hasCheckmark => widget.checkmark && animatedCheckmarkProgress > 0;
  bool get hasAvatar => widget.avatarImage != null || widget.avatarText != null;
  bool get hasLeading => widget.leading != null;
  bool get hasTrailing => widget.trailing != null || deleteButton != null;

  Widget get label {
    return Baseline(
      baseline: foregroundStyle.fontSize ?? 14,
      baselineType: TextBaseline.alphabetic,
      child: widget.label,
    );
  }

  Widget? get leading {
    final withAvatar = hasAvatar
        ? _ChipAvatar(
            textStyle: animatedAvatarForegroundStyle,
            decoration: animatedAvatarDecoration,
            border: animatedAvatarBorder,
            size: animatedAvatarSize,
            child: checkmark ?? widget.avatarText,
          )
        : checkmark;

    return widget.leading ?? withAvatar;
  }

  Widget? get trailing {
    return widget.trailing ?? deleteButton;
  }

  Widget? get checkmark {
    return hasCheckmark
        ? Checkmark(
            progress: animatedCheckmarkProgress,
            size: Size.square(animatedCheckmarkSize),
            weight: animatedCheckmarkWeight,
            color: animatedCheckmarkColor,
            style: style.checkmarkStyle,
          )
        : null;
  }

  Widget? get deleteButton {
    return widget.canDelete
        ? ChipButton(
            icon: widget.deleteIcon ?? const Icon(Icons.close),
            tooltip: widget.deleteTooltip,
            disabled: !widget.canDelete || widget.disabled,
            onPressed: widget.onDeleted!,
          )
        : null;
  }

  void onTap() {
    widgetEvents.toggle(ChipEvent.pressed, false);
    widget.onPressed?.call();
    widget.onSelected?.call(!widget.selected);
  }

  void onTapCancel() {
    widgetEvents.toggle(ChipEvent.pressed, false);
  }

  void onTapDown(TapDownDetails details) {
    widgetEvents.toggle(ChipEvent.pressed, true);
  }

  void onHover(bool value) {
    widgetEvents.toggle(ChipEvent.hovered, value);
  }

  void onFocus(bool value) {
    widgetEvents.toggle(ChipEvent.focused, value);
  }

  @override
  void initState() {
    initWidgetEvents(widget.eventsController);
    widgetEvents.toggle(ChipEvent.disabled, widget.disabled);
    widgetEvents.toggle(ChipEvent.selected, widget.selected);
    setStyle();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    didUpdateWidget(widget);
  }

  @override
  void didUpdateWidget(_ChipRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(ChipEvent.disabled, widget.disabled);
      widgetEvents.toggle(ChipEvent.selected, widget.selected);
      setStyle();
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void forEachTween(visitor) {
    _containerHeightTween = visitor(
      _containerHeightTween,
      style.height ?? ChipStyle.defaultHeight,
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

    // _containerDecorationTween = visitor(
    //   _containerDecorationTween,
    //   containerDecoration,
    //   (value) => DecorationTween(begin: value),
    // ) as DecorationTween?;

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
      style.foregroundSpacing ?? ChipStyle.defaultForegroundSpacing,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    _foregroundStyleTween = visitor(
      _foregroundStyleTween,
      foregroundStyle,
      (value) => TextStyleTween(begin: value),
    ) as TextStyleTween?;

    _avatarForegroundStyleTween = visitor(
      _avatarForegroundStyleTween,
      avatarForegroundStyle,
      (value) => TextStyleTween(begin: value),
    ) as TextStyleTween?;

    _avatarForegroundColorTween = visitor(
      _avatarForegroundColorTween,
      avatarForegroundColor,
      (value) => ColorTween(begin: value),
    ) as ColorTween?;

    _avatarBorderTween = visitor(
      _avatarBorderTween,
      avatarBorder,
      (value) => ShapeBorderTween(begin: value),
    ) as ShapeBorderTween?;

    _avatarDecorationTween = visitor(
      _avatarDecorationTween,
      avatarDecoration,
      (value) => DecorationTween(begin: value),
    ) as DecorationTween?;

    _avatarSizeTween = visitor(
      _avatarSizeTween,
      style.avatarSize ?? ChipStyle.defaultAvatarSize,
      (value) => SizeTween(begin: value),
    ) as SizeTween?;

    _checkmarkColorTween = visitor(
      _checkmarkColorTween,
      checkmarkColor,
      (value) => ColorTween(begin: value),
    ) as ColorTween?;

    _checkmarkProgressTween = visitor(
      _checkmarkProgressTween,
      widget.selected ? 1.0 : 0.0,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    _checkmarkSizeTween = visitor(
      _checkmarkSizeTween,
      style.checkmarkSize ?? ChipStyle.defaultCheckmarkSize,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    _checkmarkWeightTween = visitor(
      _checkmarkWeightTween,
      style.checkmarkWeight ?? ChipStyle.defaultCheckmarkWeight,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    _iconColorTween = visitor(
      _iconColorTween,
      iconColor,
      (value) => ColorTween(begin: value),
    ) as ColorTween?;

    _iconSizeTween = visitor(
      _iconSizeTween,
      style.iconSize ?? ChipStyle.defaultIconSize,
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
      selected: widget.selected,
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
            child: _ChipEvent(
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
              child: _ChipForeground(
                textStyle: animatedForegroundStyle,
                iconTheme: IconThemeData(
                  color: animatedIconColor,
                  size: animatedIconSize,
                  opacity: animatedIconOpacity,
                ),
                padding: animatedContainerPadding,
                spacing: animatedForegroundSpacing,
                label: label,
                leading: leading,
                trailing: trailing,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChipEvent extends StatelessWidget {
  const _ChipEvent({
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
        overlayColor: MaterialStateProperty.all<Color?>(overlayColor),
        canRequestFocus: enabled,
        autofocus: autofocus,
        focusNode: focusNode,
        splashColor: splashColor,
        splashFactory: splashFactory,
        mouseCursor: MaterialStateMouseCursor.clickable,
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

class _ChipForeground extends StatelessWidget {
  const _ChipForeground({
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

class _ChipAvatar extends StatelessWidget {
  const _ChipAvatar({
    Key? key,
    required this.decoration,
    required this.border,
    required this.size,
    required this.textStyle,
    this.child,
  }) : super(key: key);

  final TextStyle textStyle;
  final Decoration decoration;
  final ShapeBorder border;
  final Size size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: PhysicalShape(
        color: Colors.transparent,
        clipper: ShapeBorderClipper(
          textDirection: Directionality.maybeOf(context),
          shape: border,
        ),
        clipBehavior: Clip.antiAlias,
        child: DecoratedBox(
          decoration: decoration,
          child: DefaultTextStyle(
            textAlign: TextAlign.center,
            textHeightBehavior: const TextHeightBehavior(
              leadingDistribution: TextLeadingDistribution.even,
            ),
            style: textStyle,
            child: Center(
              child: child,
            ),
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

class ChipButton extends StatelessWidget {
  const ChipButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.disabled = false,
    this.chipHeight = ChipStyle.defaultHeight,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback onPressed;
  final String? tooltip;
  final bool disabled;
  final double chipHeight;

  bool get enabled => !disabled;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      button: true,
      child: _Tooltip(
        message: tooltip,
        enabled: enabled,
        child: InkWell(
          // Radius should be slightly less than the full size of the chip.
          radius: chipHeight * .35,
          // Keeps the splash from being constrained to the icon alone.
          splashFactory:
              _UnconstrainedInkSplashFactory(Theme.of(context).splashFactory),
          onTap: enabled ? onPressed : null,
          customBorder: const CircleBorder(),
          child: icon,
        ),
      ),
    );
  }
}

class _UnconstrainedInkSplashFactory extends InteractiveInkFeatureFactory {
  const _UnconstrainedInkSplashFactory(this.parentFactory);

  final InteractiveInkFeatureFactory parentFactory;

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return parentFactory.create(
      controller: controller,
      referenceBox: referenceBox,
      position: position,
      color: color,
      rectCallback: rectCallback,
      borderRadius: borderRadius,
      customBorder: customBorder,
      radius: radius,
      onRemoved: onRemoved,
      textDirection: textDirection,
    );
  }
}
