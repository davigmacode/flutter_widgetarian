import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/utils.dart';
import 'package:widgetarian/anchor.dart';
import '../avatar/style.dart';
import '../avatar/theme.dart';
import '../avatar/widget.dart';
import 'style.dart';
import 'theme.dart';
import 'event.dart';

/// Chips are compact elements that represent an input, attribute, or action.
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
    this.onPressed,
    this.onDeleted,
    this.onSelected,
    this.eventsController,
    this.curve,
    this.duration,
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
  /// If [style] is an event driven [DrivenChipStyle],
  /// then [DrivenChipStyle.evaluate] is used for the following [ChipEvent]s:
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
  final Curve? curve;

  /// The duration over which to animate the parameters of this widget.
  final Duration? duration;

  bool get enabled => !disabled;

  bool get canTap => enabled && hasCallback;

  bool get canDelete => onDeleted != null;

  bool get hasCallback {
    return onPressed != null || onSelected != null;
  }

  static const deleteIconData = IconData(0xe16a, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    final theme = ChipTheme.of(context);
    return _ChipRender(
      curve: curve ?? theme.curve,
      duration: duration ?? theme.duration,
      style: theme.style.merge(style),
      theme: theme,
      label: label,
      avatarImage: avatarImage,
      avatarText: avatarText,
      leading: leading,
      trailing: trailing,
      tooltip: tooltip,
      deleteIcon: deleteIcon,
      deleteTooltip: deleteTooltip,
      selected: selected,
      disabled: disabled,
      checkmark: checkmark,
      autofocus: autofocus,
      focusNode: focusNode,
      onPressed: onPressed,
      onDeleted: onDeleted,
      onSelected: onSelected,
      eventsController: eventsController,
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
    this.onPressed,
    this.onDeleted,
    this.onSelected,
    this.eventsController,
    required this.theme,
    required Curve curve,
    required Duration duration,
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
  final VoidCallback? onPressed;
  final VoidCallback? onDeleted;
  final ValueChanged<bool>? onSelected;
  final ChipStyle? style;
  final ChipEventController? eventsController;
  final ChipThemeData theme;

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
  ChipStyle fallback = const ChipStyle();

  @protected
  void setStyle() {
    final rawStyle = ChipStyle.defaults.merge(widget.style);
    final resStyle = DrivenChipStyle.evaluate(rawStyle, widgetEvents.value);
    style = ChipStyle.from(resStyle);

    final rawFallback = widget.theme.fallback;
    final resFallback =
        DrivenChipStyle.evaluate(rawFallback, widgetEvents.value);
    fallback = ChipStyle.from(resFallback);
    setState(() {});
  }

  Color? get defaultBackgroundColor {
    return style.isOutlined ? Colors.transparent : fallback.backgroundColor;
  }

  Color? get defaultBorderColor {
    return fallback.borderColor;
  }

  Color? get defaultForegroundColor {
    return style.isFilled
        ? widget.selected && widget.disabled
            ? backgroundColor
            : Colors.onSurface(backgroundColor)
        : fallback.foregroundColor;
  }

  Color? get backgroundColor => Colors.withTransparency(
        style.backgroundColor ?? defaultBackgroundColor,
        opacity: style.backgroundOpacity,
        alpha: style.backgroundAlpha,
      );

  Color? get borderColor => Colors.withTransparency(
        style.borderColor ?? defaultBorderColor,
        opacity: style.borderOpacity,
        alpha: style.borderAlpha,
      );

  Color? get foregroundColor => Colors.withTransparency(
        style.foregroundColor ?? defaultForegroundColor,
        opacity: style.foregroundOpacity,
        alpha: style.foregroundAlpha,
      );

  EdgeInsetsGeometry get padding {
    final fallback = hasAvatar
        ? ChipStyle.defaultPaddingWithAvatar
        : ChipStyle.defaultPadding;
    final padding = style.padding ?? fallback;
    return padding.clamp(
      EdgeInsets.only(right: hasTrailing ? 8 : 0),
      EdgeInsetsGeometry.infinity,
    );
  }

  TextStyle get foregroundStyle {
    return TextStyle(color: foregroundColor).merge(style.foregroundStyle);
  }

  Color? get avatarBackgroundColor {
    final color = style.avatarStyle?.backgroundColor ?? foregroundColor;
    return style.isFilled ? foregroundColor?.withOpacity(.7) : color;
  }

  Color? get avatarForegroundColor {
    final byType = style.isFilled
        ? backgroundColor
        : Colors.onSurface(avatarBackgroundColor);
    return style.avatarStyle?.foregroundColor ?? byType ?? foregroundColor;
  }

  AvatarStyle get avatarStyle {
    return AvatarStyle.from(style.avatarStyle).copyWith(
      backgroundColor: avatarBackgroundColor,
      foregroundColor: avatarForegroundColor,
      foregroundStyle: style.avatarStyle?.foregroundStyle,
    );
  }

  Color? get checkmarkColor {
    final fallback = hasAvatar ? avatarForegroundColor : foregroundColor;
    return style.checkmarkColor ?? fallback;
  }

  ColorTween? _checkmarkColorTween;
  Color? get animatedCheckmarkColor {
    return _checkmarkColorTween?.evaluate(animation) ?? checkmarkColor;
  }

  Tween<double>? _checkmarkProgressTween;
  double get animatedCheckmarkProgress {
    return _checkmarkProgressTween?.evaluate(animation) ?? 0;
  }

  Tween<double>? _checkmarkSizeTween;
  double? get animatedCheckmarkSize {
    return _checkmarkSizeTween?.evaluate(animation);
  }

  Tween<double>? _checkmarkWeightTween;
  double? get animatedCheckmarkWeight {
    return _checkmarkWeightTween?.evaluate(animation);
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
        ? Avatar(
            image: widget.avatarImage,
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
            size: animatedCheckmarkSize,
            weight: animatedCheckmarkWeight,
            color: animatedCheckmarkColor,
            style: style.checkmarkStyle,
          )
        : null;
  }

  // TODO: delete button tooltip,
  Widget? get deleteButton {
    return widget.canDelete
        ? Anchor(
            radius: style.height! * .35,
            // tooltip: widget.deleteTooltip,
            disabled: !widget.canDelete || widget.disabled,
            onTap: widget.onDeleted!,
            child: widget.deleteIcon ?? const Icon(Chip.deleteIconData),
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
      style.checkmarkSize!,
      (value) => Tween<double>(begin: value),
    ) as Tween<double>?;

    _checkmarkWeightTween = visitor(
      _checkmarkWeightTween,
      style.checkmarkWeight!,
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
      selected: widget.selected,
      child: Sheet(
        curve: widget.curve,
        duration: widget.duration,
        style: style,
        padding: EdgeInsets.zero,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        tooltip: widget.canTap ? widget.tooltip : null,
        child: Anchor(
          disabled: !widget.canTap,
          autofocus: widget.autofocus,
          focusNode: widget.focusNode,
          overlayColor: style.overlayColor,
          onTap: onTap,
          onTapDown: onTapDown,
          onTapCancel: onTapCancel,
          onHover: onHover,
          onFocus: onFocus,
          child: AnimatedPadding(
            curve: widget.curve,
            duration: widget.duration,
            padding: padding,
            child: AnchorTheme.merge(
              curve: widget.curve,
              duration: widget.duration,
              style: AnchorStyle(
                radius: style.height! * .35,
                shape: BoxShape.circle,
              ),
              child: AvatarTheme.merge(
                curve: widget.curve,
                duration: widget.duration,
                style: avatarStyle,
                child: Tile(
                  leading: leading,
                  trailing: trailing,
                  child: label,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
