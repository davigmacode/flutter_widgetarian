import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/src/utils/lerp.dart';
import 'package:widgetarian/src/display/avatar/style.dart';
import 'package:widgetarian/src/layout/sheet/style.dart';
import 'package:widgetarian/src/layout/sheet/types.dart';

export 'package:widgetarian/feedback.dart' show StrokeStyle;

typedef ChipVariant = SheetVariant;
typedef ChipSeverity = SheetSeverity;

/// The style to be applied to chip widget
@immutable
class ChipStyle extends SheetStyle {
  /// The style to be applied to the avatar
  final AvatarStyle? avatarStyle;

  /// The Color to be apply to the checkmark.
  ///
  /// If null fallback to [avatarStyle] or [foregroundColor].
  final Color? checkmarkColor;

  /// Defaults to [ChipStyle.defaultCheckmarkSize].
  final double? checkmarkSize;

  /// Stroke width of the checkmark.
  ///
  /// Defaults to [ChipStyle.defaultCheckmarkWeight].
  final double? checkmarkWeight;

  /// Defaults to [StrokeStyle.sharp].
  final StrokeStyle? checkmarkStyle;

  /// Create a raw chip's style
  const ChipStyle({
    super.variant,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundColor,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundColor,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderColor,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    this.checkmarkColor,
    this.checkmarkSize,
    this.checkmarkWeight,
    this.checkmarkStyle,
    this.avatarStyle,
  });

  /// Create a chip's style from another style
  ChipStyle.from(ChipStyle? other)
      : checkmarkColor = other?.checkmarkColor,
        checkmarkSize = other?.checkmarkSize,
        checkmarkWeight = other?.checkmarkWeight,
        checkmarkStyle = other?.checkmarkStyle,
        avatarStyle = other?.avatarStyle,
        super(
          variant: other?.variant,
          height: other?.height,
          margin: other?.margin,
          padding: other?.padding,
          clipBehavior: other?.clipBehavior,
          overlayDisabled: other?.overlayDisabled,
          overlayColor: other?.overlayColor,
          shadowColor: other?.shadowColor,
          surfaceTint: other?.surfaceTint,
          elevation: other?.elevation,
          foregroundStyle: other?.foregroundStyle,
          foregroundColor: other?.foregroundColor,
          foregroundOpacity: other?.foregroundOpacity,
          foregroundAlpha: other?.foregroundAlpha,
          foregroundSpacing: other?.foregroundSpacing,
          foregroundLoosen: other?.foregroundLoosen,
          foregroundExpanded: other?.foregroundExpanded,
          foregroundAlign: other?.foregroundAlign,
          foregroundJustify: other?.foregroundJustify,
          backgroundColor: other?.backgroundColor,
          backgroundOpacity: other?.backgroundOpacity,
          backgroundAlpha: other?.backgroundAlpha,
          borderColor: other?.borderColor,
          borderOpacity: other?.borderOpacity,
          borderAlpha: other?.borderAlpha,
          borderWidth: other?.borderWidth,
          borderRadius: other?.borderRadius,
          borderStyle: other?.borderStyle,
          iconColor: other?.iconColor,
          iconOpacity: other?.iconOpacity,
          iconSize: other?.iconSize,
        );

  /// An [ChipStyle] with some reasonable default values.
  static const defaults = ChipStyle(
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    foregroundLoosen: true,
    foregroundJustify: MainAxisAlignment.center,
  );

  static const defaultPadding = EdgeInsets.symmetric(horizontal: 8);
  static const defaultPaddingWithAvatar = EdgeInsets.symmetric(horizontal: 4);
  static const disabledForegroundAlpha = 0x61; // 38%
  static const disabledBackgroundAlpha = 0x0c; // 38% * 12% = 5%
  static const disabledBorderAlpha = 0x0c; // 38% * 12% = 5%

  /// Creates a copy of this [ChipStyle] but with
  /// the given fields replaced with the new values.
  @override
  ChipStyle copyWith({
    ChipVariant? variant,
    SheetSeverity? severity,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Alignment? alignment,
    Clip? clipBehavior,
    bool? overlayDisabled,
    Color? overlayColor,
    Color? shadowColor,
    Color? surfaceTint,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    bool? foregroundLoosen,
    bool? foregroundExpanded,
    CrossAxisAlignment? foregroundAlign,
    MainAxisAlignment? foregroundJustify,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadius? borderRadius,
    BorderStyle? borderStyle,
    BoxShape? shape,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    AvatarStyle? avatarStyle,
    Color? checkmarkColor,
    double? checkmarkSize,
    double? checkmarkWeight,
    StrokeStyle? checkmarkStyle,
    bool? mergeResolved,
    ChipStyle? selectedStyle,
    ChipStyle? disabledStyle,
    ChipStyle? hoveredStyle,
    ChipStyle? focusedStyle,
    ChipStyle? pressedStyle,
  }) {
    final style = ChipStyle(
      variant: variant ?? this.variant,
      height: height ?? this.height,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      overlayDisabled: overlayDisabled ?? this.overlayDisabled,
      overlayColor: overlayColor ?? this.overlayColor,
      shadowColor: shadowColor ?? this.shadowColor,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      elevation: elevation ?? this.elevation,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      foregroundSpacing: foregroundSpacing ?? this.foregroundSpacing,
      foregroundLoosen: foregroundLoosen ?? this.foregroundLoosen,
      foregroundExpanded: foregroundExpanded ?? this.foregroundExpanded,
      foregroundAlign: foregroundAlign ?? this.foregroundAlign,
      foregroundJustify: foregroundJustify ?? this.foregroundJustify,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      avatarStyle: AvatarStyle.from(this.avatarStyle).merge(avatarStyle),
      checkmarkColor: checkmarkColor ?? this.checkmarkColor,
      checkmarkSize: checkmarkSize ?? this.checkmarkSize,
      checkmarkWeight: checkmarkWeight ?? this.checkmarkWeight,
      checkmarkStyle: checkmarkStyle ?? this.checkmarkStyle,
      iconColor: iconColor ?? this.iconColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconSize: iconSize ?? this.iconSize,
    );

    final hasDrivenStyle = [
      mergeResolved,
      selectedStyle,
      focusedStyle,
      hoveredStyle,
      pressedStyle,
      disabledStyle,
    ].any((el) => el != null);

    if (hasDrivenStyle) {
      return DrivenChipStyle.from(
        style,
        selectedStyle: selectedStyle,
        disabledStyle: disabledStyle,
        hoveredStyle: hoveredStyle,
        focusedStyle: focusedStyle,
        pressedStyle: pressedStyle,
        mergeResolved: mergeResolved,
      );
    }
    return style;
  }

  /// Creates a copy of this [ChipStyle] but with
  /// the given fields replaced with the new values.
  @override
  ChipStyle merge(covariant ChipStyle? other) {
    // if null return current object
    if (other == null) return this;

    var style = copyWith(
      variant: other.variant,
      height: other.height,
      margin: other.margin,
      padding: other.padding,
      clipBehavior: other.clipBehavior,
      overlayDisabled: other.overlayDisabled,
      overlayColor: other.overlayColor,
      shadowColor: other.shadowColor,
      surfaceTint: other.surfaceTint,
      elevation: other.elevation,
      foregroundStyle: other.foregroundStyle,
      foregroundColor: other.foregroundColor,
      foregroundOpacity: other.foregroundOpacity,
      foregroundAlpha: other.foregroundAlpha,
      foregroundSpacing: other.foregroundSpacing,
      foregroundLoosen: other.foregroundLoosen,
      foregroundExpanded: other.foregroundExpanded,
      foregroundAlign: other.foregroundAlign,
      foregroundJustify: other.foregroundJustify,
      backgroundColor: other.backgroundColor,
      backgroundOpacity: other.backgroundOpacity,
      backgroundAlpha: other.backgroundAlpha,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderRadius: other.borderRadius,
      borderStyle: other.borderStyle,
      avatarStyle: other.avatarStyle,
      checkmarkColor: other.checkmarkColor,
      checkmarkSize: other.checkmarkSize,
      checkmarkWeight: other.checkmarkWeight,
      checkmarkStyle: other.checkmarkStyle,
      iconColor: other.iconColor,
      iconOpacity: other.iconOpacity,
      iconSize: other.iconSize,
    );

    if (other is DrivenChipStyle) {
      style = style.copyWith(
        mergeResolved: other.mergeResolved,
        selectedStyle: other.selectedStyle,
        focusedStyle: other.focusedStyle,
        hoveredStyle: other.hoveredStyle,
        pressedStyle: other.pressedStyle,
        disabledStyle: other.disabledStyle,
      );
    }
    return style;
  }

  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      'avatarStyle': avatarStyle,
      'checkmarkColor': checkmarkColor,
      'checkmarkSize': checkmarkSize,
      'checkmarkWeight': checkmarkWeight,
      'checkmarkStyle': checkmarkStyle,
    });

  /// Linearly interpolate between two [ChipStyle] objects.
  static ChipStyle? lerp(ChipStyle? a, ChipStyle? b, double t) {
    if (a == null && b == null) return null;
    return ChipStyle(
      variant: lerpEnum(a?.variant, b?.variant, t),
      height: lerpDouble(a?.height, b?.height, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      clipBehavior: lerpEnum(a?.clipBehavior, b?.clipBehavior, t),
      overlayDisabled: lerpBool(a?.overlayDisabled, b?.overlayDisabled, t),
      overlayColor: Color.lerp(a?.overlayColor, b?.overlayColor, t),
      shadowColor: Color.lerp(a?.shadowColor, b?.shadowColor, t),
      surfaceTint: Color.lerp(a?.surfaceTint, b?.surfaceTint, t),
      elevation: lerpDouble(a?.elevation, b?.elevation, t),
      foregroundStyle:
          TextStyle.lerp(a?.foregroundStyle, b?.foregroundStyle, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      foregroundOpacity:
          lerpDouble(a?.foregroundOpacity, b?.foregroundOpacity, t),
      foregroundAlpha: lerpInt(a?.foregroundAlpha, b?.foregroundAlpha, t),
      foregroundSpacing:
          lerpDouble(a?.foregroundSpacing, b?.foregroundSpacing, t),
      foregroundLoosen: lerpBool(a?.foregroundLoosen, b?.foregroundLoosen, t),
      foregroundExpanded:
          lerpBool(a?.foregroundExpanded, b?.foregroundExpanded, t),
      foregroundAlign: lerpEnum(a?.foregroundAlign, b?.foregroundAlign, t),
      foregroundJustify:
          lerpEnum(a?.foregroundJustify, b?.foregroundJustify, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      backgroundOpacity:
          lerpDouble(a?.backgroundOpacity, b?.backgroundOpacity, t),
      backgroundAlpha: lerpInt(a?.backgroundAlpha, b?.backgroundAlpha, t),
      borderColor: Color.lerp(a?.borderColor, b?.backgroundColor, t),
      borderOpacity: lerpDouble(a?.borderOpacity, b?.borderOpacity, t),
      borderAlpha: lerpInt(a?.borderAlpha, b?.borderAlpha, t),
      borderWidth: lerpDouble(a?.borderWidth, b?.borderWidth, t),
      borderRadius: BorderRadius.lerp(a?.borderRadius, b?.borderRadius, t),
      borderStyle: lerpEnum(a?.borderStyle, b?.borderStyle, t),
      iconColor: Color.lerp(a?.iconColor, b?.iconColor, t),
      iconOpacity: lerpDouble(a?.iconOpacity, b?.iconOpacity, t),
      iconSize: lerpDouble(a?.iconSize, b?.iconSize, t),
      avatarStyle: AvatarStyle.lerp(a?.avatarStyle, b?.avatarStyle, t),
      checkmarkColor: Color.lerp(a?.checkmarkColor, b?.checkmarkColor, t),
      checkmarkWeight: lerpDouble(a?.checkmarkWeight, b?.checkmarkWeight, t),
      checkmarkSize: lerpDouble(a?.checkmarkSize, b?.checkmarkSize, t),
      checkmarkStyle: lerpEnum(a?.checkmarkStyle, b?.checkmarkStyle, t),
    );
  }
}

/// Create a [ChipStyle] when some events occurs
class DrivenChipStyle extends ChipStyle implements DrivenProperty<ChipStyle?> {
  /// Whether the resolved style is merged to
  /// the previous resolved style or not
  final bool? mergeResolved;

  /// The style to be resolved when
  /// events includes [WidgetEvent.selected].
  final ChipStyle? selectedStyle;

  /// The style to be resolved when
  /// events includes [WidgetEvent.focused].
  final ChipStyle? focusedStyle;

  /// The style to be resolved when
  /// events includes [WidgetEvent.hovered].
  final ChipStyle? hoveredStyle;

  /// The style to be resolved when
  /// events includes [WidgetEvent.pressed].
  final ChipStyle? pressedStyle;

  /// The style to be resolved when
  /// events includes [WidgetEvent.disabled].
  final ChipStyle? disabledStyle;

  /// Map of driven style, order matters
  Map<WidgetEvent, ChipStyle?> get driven => {
        WidgetEvent.selected: selectedStyle,
        WidgetEvent.focused: focusedStyle,
        WidgetEvent.hovered: hoveredStyle,
        WidgetEvent.pressed: pressedStyle,
        WidgetEvent.disabled: disabledStyle,
      };

  /// Create a raw [DrivenChipStyle].
  const DrivenChipStyle({
    super.variant,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundColor,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundColor,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderColor,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    super.checkmarkColor,
    super.checkmarkSize,
    super.checkmarkWeight,
    super.checkmarkStyle,
    super.avatarStyle,
    this.selectedStyle,
    this.disabledStyle,
    this.hoveredStyle,
    this.focusedStyle,
    this.pressedStyle,
    this.mergeResolved,
  });

  /// Create a [DrivenChipStyle] with value
  /// from another [ChipStyle].
  DrivenChipStyle.from(
    ChipStyle? enabled, {
    this.selectedStyle,
    this.focusedStyle,
    this.hoveredStyle,
    this.pressedStyle,
    this.disabledStyle,
    this.mergeResolved,
  }) : super.from(enabled);

  /// Create a [DrivenChipStyle] with default value for toned style.
  const DrivenChipStyle.tonal({
    Color? color,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderColor,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle = BorderStyle.none,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    super.checkmarkColor,
    super.checkmarkSize,
    super.checkmarkWeight,
    super.checkmarkStyle,
    super.avatarStyle,
    this.selectedStyle,
    this.disabledStyle,
    this.hoveredStyle,
    this.focusedStyle,
    this.pressedStyle,
    this.mergeResolved,
  }) : super(
          variant: SheetVariant.tonal,
          backgroundColor: color,
          foregroundColor: color,
        );

  /// Create a [DrivenChipStyle] with default value for filled style.
  const DrivenChipStyle.filled({
    Color? color,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundColor,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle = BorderStyle.none,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    super.checkmarkColor,
    super.checkmarkSize,
    super.checkmarkWeight,
    super.checkmarkStyle,
    super.avatarStyle,
    this.selectedStyle,
    this.disabledStyle,
    this.hoveredStyle,
    this.focusedStyle,
    this.pressedStyle,
    this.mergeResolved,
  }) : super(
          variant: SheetVariant.filled,
          backgroundColor: color,
          borderColor: color,
        );

  /// Create a [DrivenChipStyle] with default value for outlined style.
  DrivenChipStyle.outlined({
    Color? color,
    super.height,
    super.margin,
    super.padding,
    super.clipBehavior,
    super.overlayDisabled,
    super.overlayColor,
    super.shadowColor,
    super.surfaceTint,
    super.elevation,
    super.foregroundStyle,
    super.foregroundOpacity,
    super.foregroundAlpha,
    super.foregroundSpacing,
    super.foregroundLoosen,
    super.foregroundExpanded,
    super.foregroundAlign,
    super.foregroundJustify,
    super.backgroundColor,
    super.backgroundOpacity,
    super.backgroundAlpha,
    super.borderOpacity,
    super.borderAlpha,
    super.borderWidth,
    super.borderRadius,
    super.borderStyle = BorderStyle.solid,
    super.iconColor,
    super.iconOpacity,
    super.iconSize,
    super.checkmarkColor,
    super.checkmarkSize,
    super.checkmarkWeight,
    super.checkmarkStyle,
    AvatarStyle? avatarStyle,
    this.selectedStyle,
    this.disabledStyle,
    this.hoveredStyle,
    this.focusedStyle,
    this.pressedStyle,
    this.mergeResolved,
  }) : super(
          variant: SheetVariant.outlined,
          foregroundColor: color,
          borderColor: color,
          avatarStyle:
              AvatarStyle.from(avatarStyle).copyWith(backgroundColor: color),
        );

  /// Create a [DrivenChipStyle] from a resolver callback
  DrivenChipStyle.resolver(
    DrivenPropertyResolver<ChipStyle?> resolver, {
    this.mergeResolved = false,
  })  : selectedStyle = resolver({WidgetEvent.selected}),
        focusedStyle = resolver({WidgetEvent.focused}),
        hoveredStyle = resolver({WidgetEvent.hovered}),
        pressedStyle = resolver({WidgetEvent.pressed}),
        disabledStyle = resolver({WidgetEvent.disabled}),
        super.from(resolver({}));

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [ChipStyle],
  /// otherwise returns the value itself.
  static ChipStyle? evaluate(ChipStyle? value, Set<WidgetEvent> events) {
    return DrivenProperty.evaluate<ChipStyle?>(value, events);
  }

  @override
  ChipStyle resolve(Set<WidgetEvent> events) {
    ChipStyle style = this;
    for (var e in driven.entries) {
      if (events.contains(e.key)) {
        final evaluated = evaluate(e.value, events);
        style = mergeResolved != false
            ? style.merge(evaluated)
            : ChipStyle.from(evaluated);
      }
    }
    return style;
  }

  /// Creates a copy of this [DrivenChipStyle] but with
  /// the given fields replaced with the new values.
  @override
  DrivenChipStyle copyWith({
    ChipVariant? variant,
    SheetSeverity? severity,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Alignment? alignment,
    Clip? clipBehavior,
    bool? overlayDisabled,
    Color? overlayColor,
    Color? shadowColor,
    Color? surfaceTint,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    bool? foregroundLoosen,
    bool? foregroundExpanded,
    CrossAxisAlignment? foregroundAlign,
    MainAxisAlignment? foregroundJustify,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadius? borderRadius,
    BorderStyle? borderStyle,
    BoxShape? shape,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    AvatarStyle? avatarStyle,
    Color? checkmarkColor,
    double? checkmarkSize,
    double? checkmarkWeight,
    StrokeStyle? checkmarkStyle,
    bool? mergeResolved,
    ChipStyle? selectedStyle,
    ChipStyle? disabledStyle,
    ChipStyle? hoveredStyle,
    ChipStyle? focusedStyle,
    ChipStyle? pressedStyle,
  }) {
    return DrivenChipStyle(
      variant: variant ?? this.variant,
      height: height ?? this.height,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      overlayDisabled: overlayDisabled ?? this.overlayDisabled,
      overlayColor: overlayColor ?? this.overlayColor,
      shadowColor: shadowColor ?? this.shadowColor,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      elevation: elevation ?? this.elevation,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      foregroundSpacing: foregroundSpacing ?? this.foregroundSpacing,
      foregroundLoosen: foregroundLoosen ?? this.foregroundLoosen,
      foregroundExpanded: foregroundExpanded ?? this.foregroundExpanded,
      foregroundAlign: foregroundAlign ?? this.foregroundAlign,
      foregroundJustify: foregroundJustify ?? this.foregroundJustify,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      iconColor: iconColor ?? this.iconColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconSize: iconSize ?? this.iconSize,
      avatarStyle: AvatarStyle.from(this.avatarStyle).merge(avatarStyle),
      checkmarkColor: checkmarkColor ?? this.checkmarkColor,
      checkmarkSize: checkmarkSize ?? this.checkmarkSize,
      checkmarkWeight: checkmarkWeight ?? this.checkmarkWeight,
      checkmarkStyle: checkmarkStyle ?? this.checkmarkStyle,
      mergeResolved: mergeResolved ?? this.mergeResolved,
      selectedStyle: this.selectedStyle?.merge(selectedStyle) ?? selectedStyle,
      focusedStyle: this.focusedStyle?.merge(focusedStyle) ?? focusedStyle,
      hoveredStyle: this.hoveredStyle?.merge(hoveredStyle) ?? hoveredStyle,
      pressedStyle: this.pressedStyle?.merge(pressedStyle) ?? pressedStyle,
      disabledStyle: this.disabledStyle?.merge(disabledStyle) ?? disabledStyle,
    );
  }

  @override
  Map<String, dynamic> toMap() => super.toMap()
    ..addAll({
      'mergeResolved': mergeResolved,
      'selectedStyle': selectedStyle,
      'focusedStyle': focusedStyle,
      'hoveredStyle': hoveredStyle,
      'pressedStyle': pressedStyle,
      'disabledStyle': disabledStyle,
    });
}
