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
import 'event.dart';
import 'theme_data.dart';

/// Chip widget with smooth animation, event driven style, and many more.
class ChipRender extends ImplicitlyAnimatedWidget {
  const ChipRender({
    Key? key,
    required this.label,
    this.avatarImage,
    this.avatarText,
    this.leading,
    this.trailing,
    this.tooltip,
    this.deleteIcon,
    this.deleteTooltip,
    this.selected = false,
    this.disabled = false,
    this.checkmark = false,
    this.autofocus = false,
    this.focusNode,
    this.onPressed,
    this.onDeleted,
    this.onSelected,
    this.eventsController,
    required this.style,
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
  final ChipThemeData theme;
  final ChipEventController? eventsController;

  static const deleteIconData = IconData(0xe16a, fontFamily: 'MaterialIcons');

  bool get enabled => !disabled;

  bool get canTap => enabled && hasCallback;

  bool get canDelete => onDeleted != null;

  bool get hasCallback {
    return onPressed != null || onSelected != null;
  }

  @override
  ChipRenderState createState() => ChipRenderState();
}

class ChipRenderState extends AnimatedWidgetBaseState<ChipRender>
    with WidgetEventMixin<ChipRender> {
  // ChipStyle style = const ChipStyle();
  // ChipStyle fallback = const ChipStyle();

  // @protected
  // void setStyle() {
  //   final rawStyle = ChipStyle.defaults.merge(widget.style);
  //   final resStyle = DrivenChipStyle.evaluate(rawStyle, widgetEvents.value);
  //   style = ChipStyle.from(resStyle);

  //   final rawFallback = widget.fallback.resolve(style.variant);
  //   final resFallback =
  //       DrivenChipStyle.evaluate(rawFallback, widgetEvents.value);
  //   fallback = ChipStyle.from(resFallback);
  //   setState(() {});
  // }

  // Color? get defaultBackgroundColor {
  //   return fallback.backgroundColor;
  // }

  // Color? get defaultBorderColor {
  //   return fallback.borderColor;
  // }

  ChipStyle get style {
    final raw = ChipStyle.defaults.merge(widget.style);
    final fallback = widget.theme.resolve(
      variant: raw.variant,
      severity: raw.severity,
    );
    final driven = fallback.merge(raw);
    final evaluated = DrivenChipStyle.evaluate(driven, widgetEvents.value);
    return ChipStyle.from(evaluated);
  }

  // @protected
  // void setStyle() {

  //   final rawStyle = ChipStyle.defaults.merge(widget.style);
  //   final resStyle = DrivenChipStyle.evaluate(rawStyle, widgetEvents.value);
  //   style = ChipStyle.from(resStyle);

  //   final rawFallback = widget.theme.resolve(style.variant);
  //   final resFallback =
  //       DrivenChipStyle.evaluate(rawFallback, widgetEvents.value);
  //   fallback = ChipStyle.from(resFallback);
  //   setState(() {});
  // }

  Curve get curve => widget.curve;

  Duration get duration => widget.duration;

  Color? get defaultForegroundColor {
    return style.isFilled || style.isElevated
        ? widget.selected && widget.disabled
            ? backgroundColor
            : Colors.onSurface(backgroundColor)
        : null;
  }

  Color? get backgroundColor => Colors.withTransparency(
        style.backgroundColor,
        opacity: style.backgroundOpacity,
        alpha: style.backgroundAlpha,
      );

  Color? get borderColor => Colors.withTransparency(
        style.borderColor,
        opacity: style.borderOpacity,
        alpha: style.borderAlpha,
      );

  Color? get foregroundColor => Colors.withTransparency(
        style.foregroundColor ?? defaultForegroundColor,
        opacity: style.foregroundOpacity,
        alpha: style.foregroundAlpha,
      );

  Color? get overlayColor =>
      style.overlayColor ?? Colors.onSurface(backgroundColor);

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
    return const TextStyle()
        .merge(style.foregroundStyle)
        .copyWith(color: foregroundColor);
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
  bool get hasTrailing => widget.trailing != null || deleteChip != null;

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
    return widget.trailing ?? deleteChip;
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
  Widget? get deleteChip {
    return widget.canDelete
        ? Anchor(
            radius: style.height! * .35,
            // tooltip: widget.deleteTooltip,
            disabled: !widget.canDelete || widget.disabled,
            onTap: widget.onDeleted!,
            child: widget.deleteIcon ?? const Icon(ChipRender.deleteIconData),
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
    // setStyle();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    didUpdateWidget(widget);
  }

  @override
  void didUpdateWidget(ChipRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(ChipEvent.disabled, widget.disabled);
      widgetEvents.toggle(ChipEvent.selected, widget.selected);
      // setStyle();
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
        curve: curve,
        duration: duration,
        style: style,
        padding: EdgeInsets.zero,
        foregroundStyle: foregroundStyle,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        tooltip: widget.canTap ? widget.tooltip : null,
        child: Anchor(
          curve: curve,
          duration: duration,
          disabled: !widget.canTap,
          autofocus: widget.autofocus,
          focusNode: widget.focusNode,
          overlayColor: overlayColor,
          overlayDisabled: style.overlayDisabled,
          onTap: onTap,
          onTapDown: onTapDown,
          onTapCancel: onTapCancel,
          onHover: onHover,
          onFocus: onFocus,
          child: AnimatedPadding(
            curve: curve,
            duration: duration,
            padding: padding,
            child: AnchorTheme.merge(
              curve: curve,
              duration: duration,
              style: AnchorStyle(
                radius: style.height! * .35,
                shape: BoxShape.circle,
              ),
              child: AvatarTheme.merge(
                curve: curve,
                duration: duration,
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
