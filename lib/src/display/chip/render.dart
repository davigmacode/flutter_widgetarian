import 'package:flutter/foundation.dart';
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
    super.key,
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
    this.variant,
    this.severity,
    required this.style,
    required this.theme,
    required super.curve,
    required super.duration,
  });

  /// {@template widgetarian.chip.label}
  /// The primary content of the chip.
  ///
  /// Typically a [Text] widget.
  /// {@endtemplate}
  final Widget label;

  /// {@template widgetarian.chip.avatarImage}
  /// Typically used as profile image.
  ///
  /// If the avatar is to have the user's initials, use [avatarText] instead.
  /// {@endtemplate}
  final ImageProvider? avatarImage;

  /// {@template widgetarian.chip.avatarText}
  /// The primary content of the chip avatar.
  ///
  /// Typically a [Text] widget.
  /// {@endtemplate}
  final Widget? avatarText;

  /// {@template widgetarian.chip.leading}
  /// A custom widget to display prior to the chip's [label].
  /// {@endtemplate}
  final Widget? leading;

  /// {@template widgetarian.chip.trailing}
  /// A custom widget to display next to the chip's [label].
  /// {@endtemplate}
  final Widget? trailing;

  /// {@template widgetarian.chip.tooltip}
  /// Tooltip string to be used for the body area
  /// (where the label and avatar are) of the chip.
  /// {@endtemplate}
  final String? tooltip;

  /// {@template widgetarian.chip.deleteIcon}
  /// The icon displayed when [onDeleted] is set.
  ///
  /// Defaults to an [Icon] widget set to use [Icons.cancel].
  /// {@endtemplate}
  final Widget? deleteIcon;

  /// {@template widgetarian.chip.deleteTooltip}
  /// The message to be used for the chip's delete button tooltip.
  ///
  /// If provided with an empty string, the tooltip of the delete button will be
  /// disabled.
  ///
  /// If null, the default [MaterialLocalizations.deleteButtonTooltip] will be
  /// used.
  /// {@endtemplate}
  final String? deleteTooltip;

  /// {@template widgetarian.chip.selected}
  /// Whether or not this chip is selected.
  ///
  /// Must not be null. Defaults to false.
  /// {@endtemplate}
  final bool selected;

  /// {@template widgetarian.chip.disabled}
  /// Whether or not this chip is disabled for input.
  ///
  /// Defaults to false. Cannot be null.
  /// {@endtemplate}
  final bool disabled;

  /// {@template widgetarian.chip.checkmark}
  /// Whether or not to show a checkmark when [selected] is true.
  ///
  /// Defaults to false. Cannot ve null.
  /// {@endtemplate}
  final bool checkmark;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@template widgetarian.chip.onPressed}
  /// Called when the user taps the chip.
  ///
  /// If [onPressed] is set, then this callback will be called when the user
  /// taps on the label or avatar parts of the chip. If [onPressed] is null,
  /// then the chip will be disabled.
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
  /// {@endtemplate}
  final VoidCallback? onPressed;

  /// {@template widgetarian.chip.onDeleted}
  /// Called when the user taps the [deleteIcon] to delete the chip.
  ///
  /// If null, the delete button will not appear on the chip.
  ///
  /// The chip will not automatically remove itself: this just tells the app
  /// that the user tapped the delete button.
  /// {@endtemplate}
  final VoidCallback? onDeleted;

  /// {@template widgetarian.chip.onSelected}
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
  /// {@endtemplate}
  final ValueChanged<bool>? onSelected;

  /// {@template widgetarian.chip.variant}
  /// Type of the chip variant
  /// {@endtemplate}
  final SheetVariant? variant;

  /// {@template widgetarian.chip.severity}
  /// Type of the chip severity
  /// {@endtemplate}
  final ChipSeverity? severity;

  /// {@template widgetarian.chip.style}
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
  /// {@endtemplate}
  final ChipStyle? style;

  /// {@template widgetarian.chip.theme}
  /// The [ChipThemeData] that provides fallback values.
  /// {@endtemplate}
  final ChipThemeData theme;

  /// {@template widgetarian.chip.eventsController}
  /// Used by widgets that expose their internal event
  /// for the sake of extensions that add support for additional events.
  /// {@endtemplate}
  final ChipEventController? eventsController;

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
  Curve get curve => widget.curve;
  Duration get duration => widget.duration;

  ChipStyle style = const ChipStyle();

  void setStyle() {
    final fromProps = ChipStyle(
      variant: widget.variant,
      severity: widget.severity,
    );
    final raw = fromProps.merge(widget.style);
    final specs = DrivenChipStyle.evaluate(raw, widgetEvents.value);
    final fallback = widget.theme.resolve(
      variant: specs?.variant,
      severity: specs?.severity,
    );
    final withFallback = fallback.merge(raw);
    final result = DrivenChipStyle.evaluate(withFallback, widgetEvents.value);

    style = ChipStyle.from(result);
    setState(() {});
  }

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
    final padding = style.padding ?? EdgeInsets.zero;
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
            child: widget.deleteIcon ?? Icon(widget.theme.deleteIcon),
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
  void didUpdateWidget(ChipRender oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      widgetEvents.toggle(ChipEvent.disabled, widget.disabled);
      widgetEvents.toggle(ChipEvent.selected, widget.selected);
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ChipStyle>('style', style));
  }
}
