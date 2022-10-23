import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/colors.dart';
import 'event.dart';

typedef ChipCheckmarkStyle = CheckmarkStyle;

/// Default chip's style.
class ChipStyle {
  const ChipStyle({
    this.height,
    this.margin,
    this.padding,
    this.clipBehavior,
    this.overlayColor,
    this.shadowColor,
    this.elevation,
    this.foregroundStyle,
    this.foregroundColor,
    this.foregroundOpacity,
    this.foregroundAlpha,
    this.foregroundSpacing,
    this.backgroundColor,
    this.backgroundOpacity,
    this.backgroundAlpha,
    this.borderColor,
    this.borderOpacity,
    this.borderAlpha,
    this.borderWidth,
    this.borderRadius,
    this.borderStyle,
    this.avatarSize,
    this.avatarForegroundStyle,
    this.avatarForegroundColor,
    this.avatarBackgroundColor,
    this.avatarBorderRadius,
    this.checkmarkColor,
    this.checkmarkSize,
    this.checkmarkWeight,
    this.checkmarkStyle,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
  });

  /// Create a chip's style from another style
  ChipStyle.from(ChipStyle? other)
      : height = other?.height,
        margin = other?.margin,
        padding = other?.padding,
        clipBehavior = other?.clipBehavior,
        overlayColor = other?.overlayColor,
        shadowColor = other?.shadowColor,
        elevation = other?.elevation,
        foregroundStyle = other?.foregroundStyle,
        foregroundColor = other?.foregroundColor,
        foregroundOpacity = other?.foregroundOpacity,
        foregroundAlpha = other?.foregroundAlpha,
        foregroundSpacing = other?.foregroundSpacing,
        backgroundColor = other?.backgroundColor,
        backgroundOpacity = other?.backgroundOpacity,
        backgroundAlpha = other?.backgroundAlpha,
        borderColor = other?.borderColor,
        borderOpacity = other?.borderOpacity,
        borderAlpha = other?.borderAlpha,
        borderWidth = other?.borderWidth,
        borderRadius = other?.borderRadius,
        borderStyle = other?.borderStyle,
        avatarSize = other?.avatarSize,
        avatarForegroundStyle = other?.avatarForegroundStyle,
        avatarForegroundColor = other?.avatarForegroundColor,
        avatarBackgroundColor = other?.avatarBackgroundColor,
        avatarBorderRadius = other?.avatarBorderRadius,
        checkmarkColor = other?.checkmarkColor,
        checkmarkSize = other?.checkmarkSize,
        checkmarkWeight = other?.checkmarkWeight,
        checkmarkStyle = other?.checkmarkStyle,
        iconColor = other?.iconColor,
        iconOpacity = other?.iconOpacity,
        iconSize = other?.iconSize;

  /// Create an event driven chip's style using [callback].
  factory ChipStyle.driven(
    DrivenPropertyResolver<ChipStyle?> callback,
  ) {
    return _ChipStyle(callback);
  }

  /// Create a chip's style when some events occurs.
  ///
  /// The [enabled] is base style to be applied to the chip.
  /// if `null` will fallback with empty ChipStyle
  ///
  /// The [selected] is style to be merged with [enabled],
  /// when events includes [ChipEvent.selected].
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [ChipEvent.disabled].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [ChipEvent.hovered].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [ChipEvent.focused].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [ChipEvent.pressed].
  factory ChipStyle.when({
    ChipStyle? enabled,
    ChipStyle? selected,
    ChipStyle? disabled,
    ChipStyle? hovered,
    ChipStyle? focused,
    ChipStyle? pressed,
  }) {
    return ChipStyle.driven((events) {
      return (enabled ?? const ChipStyle())
          .merge(
              ChipEvent.isSelected(events) ? evaluate(selected, events) : null)
          .merge(
              ChipEvent.isDisabled(events) ? evaluate(disabled, events) : null)
          .merge(ChipEvent.isHovered(events) ? evaluate(hovered, events) : null)
          .merge(ChipEvent.isFocused(events) ? evaluate(focused, events) : null)
          .merge(
              ChipEvent.isPressed(events) ? evaluate(pressed, events) : null);
    });
  }

  /// Create chip's style with default value for toned style.
  ///
  /// The [selectedStyle] is style to be merged,
  /// when events includes [ChipEvent.selected].
  ///
  /// The [disabledStyle] style to be merged,
  /// when events includes [ChipEvent.disabled].
  ///
  /// The [hoveredStyle] style to be merged,
  /// when events includes [ChipEvent.hovered].
  ///
  /// The [focusedStyle] style to be merged,
  /// when events includes [ChipEvent.focused].
  ///
  /// The [pressedStyle] style to be merged,
  /// when events includes [ChipEvent.pressed].
  factory ChipStyle.toned({
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    Color? backgroundColor,
    double? backgroundOpacity = .12,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity = 1,
    int? borderAlpha,
    double? borderWidth = 1,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle = BorderStyle.none,
    Size? avatarSize,
    TextStyle? avatarForegroundStyle,
    Color? avatarForegroundColor,
    Color? avatarBackgroundColor,
    BorderRadiusGeometry? avatarBorderRadius,
    Color? checkmarkColor,
    double? checkmarkSize,
    double? checkmarkWeight,
    ChipCheckmarkStyle? checkmarkStyle,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    ChipStyle? selectedStyle,
    ChipStyle? disabledStyle = const ChipStyle(
      foregroundAlpha: ChipStyle.disabledForegroundAlpha,
      backgroundAlpha: ChipStyle.disabledBackgroundAlpha,
      borderAlpha: ChipStyle.disabledBorderAlpha,
    ),
    ChipStyle? hoveredStyle,
    ChipStyle? focusedStyle,
    ChipStyle? pressedStyle,
  }) {
    return ChipStyle.when(
      enabled: ChipStyle(
        height: height,
        margin: margin,
        padding: padding,
        clipBehavior: clipBehavior,
        overlayColor: overlayColor,
        shadowColor: shadowColor,
        elevation: elevation,
        foregroundStyle: foregroundStyle,
        foregroundColor: foregroundColor,
        foregroundOpacity: foregroundOpacity,
        foregroundAlpha: foregroundAlpha,
        foregroundSpacing: foregroundSpacing,
        backgroundColor: backgroundColor,
        backgroundOpacity: backgroundOpacity,
        backgroundAlpha: backgroundAlpha,
        borderColor: borderColor,
        borderOpacity: borderOpacity,
        borderAlpha: borderAlpha,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        borderStyle: borderStyle,
        avatarSize: avatarSize,
        avatarForegroundStyle: avatarForegroundStyle,
        avatarForegroundColor: avatarForegroundColor,
        avatarBackgroundColor: avatarBackgroundColor,
        avatarBorderRadius: avatarBorderRadius,
        checkmarkColor: checkmarkColor,
        checkmarkSize: checkmarkSize,
        checkmarkWeight: checkmarkWeight,
        checkmarkStyle: checkmarkStyle,
        iconColor: iconColor,
        iconOpacity: iconOpacity,
        iconSize: iconSize,
      ),
      selected: selectedStyle,
      disabled: disabledStyle,
      hovered: hoveredStyle,
      focused: focusedStyle,
      pressed: pressedStyle,
    );
  }

  /// Create chip's style with default value for filled style.
  ///
  /// The [selectedStyle] is style to be merged,
  /// when events includes [ChipEvent.selected].
  ///
  /// The [disabledStyle] style to be merged,
  /// when events includes [ChipEvent.disabled].
  ///
  /// The [hoveredStyle] style to be merged,
  /// when events includes [ChipEvent.hovered].
  ///
  /// The [focusedStyle] style to be merged,
  /// when events includes [ChipEvent.focused].
  ///
  /// The [pressedStyle] style to be merged,
  /// when events includes [ChipEvent.pressed].
  factory ChipStyle.filled({
    Color? color,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    double? backgroundOpacity = .8,
    int? backgroundAlpha,
    double? borderOpacity = 0,
    int? borderAlpha,
    double? borderWidth = 0,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle = BorderStyle.none,
    Size? avatarSize,
    TextStyle? avatarForegroundStyle,
    Color? avatarForegroundColor,
    Color? avatarBackgroundColor,
    BorderRadiusGeometry? avatarBorderRadius,
    Color? checkmarkColor,
    double? checkmarkSize,
    double? checkmarkWeight,
    ChipCheckmarkStyle? checkmarkStyle,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    ChipStyle? selectedStyle,
    ChipStyle? disabledStyle = const ChipStyle(
      foregroundAlpha: ChipStyle.disabledForegroundAlpha,
      backgroundAlpha: ChipStyle.disabledBackgroundAlpha,
      borderAlpha: ChipStyle.disabledBorderAlpha,
    ),
    ChipStyle? hoveredStyle,
    ChipStyle? focusedStyle,
    ChipStyle? pressedStyle = const ChipStyle(
      elevation: 5,
    ),
  }) {
    return ChipStyle.when(
      enabled: ChipStyle(
        backgroundColor: color,
        borderColor: color,
        height: height,
        margin: margin,
        padding: padding,
        clipBehavior: clipBehavior,
        overlayColor: overlayColor,
        shadowColor: shadowColor,
        elevation: elevation,
        foregroundStyle: foregroundStyle,
        foregroundColor: foregroundColor,
        foregroundOpacity: foregroundOpacity,
        foregroundAlpha: foregroundAlpha,
        foregroundSpacing: foregroundSpacing,
        backgroundOpacity: backgroundOpacity,
        backgroundAlpha: backgroundAlpha,
        borderOpacity: borderOpacity,
        borderAlpha: borderAlpha,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        borderStyle: borderStyle,
        avatarSize: avatarSize,
        avatarForegroundStyle: avatarForegroundStyle,
        avatarForegroundColor: avatarForegroundColor,
        avatarBackgroundColor: avatarBackgroundColor,
        avatarBorderRadius: avatarBorderRadius,
        checkmarkColor: checkmarkColor,
        checkmarkSize: checkmarkSize,
        checkmarkWeight: checkmarkWeight,
        checkmarkStyle: checkmarkStyle,
        iconColor: iconColor,
        iconOpacity: iconOpacity,
        iconSize: iconSize,
      ),
      selected: selectedStyle,
      disabled: disabledStyle,
      hovered: hoveredStyle,
      focused: focusedStyle,
      pressed: pressedStyle,
    );
  }

  /// Create chip's style with default value for outlined style.
  ///
  /// The [selected] is style to be merged,
  /// when events includes [ChipEvent.selected].
  ///
  /// The [disabled] style to be merged,
  /// when events includes [ChipEvent.disabled].
  ///
  /// The [hovered] style to be merged,
  /// when events includes [ChipEvent.hovered].
  ///
  /// The [focused] style to be merged,
  /// when events includes [ChipEvent.focused].
  ///
  /// The [pressed] style to be merged,
  /// when events includes [ChipEvent.pressed].
  factory ChipStyle.outlined({
    Color? color,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? foregroundStyle,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    Color? backgroundColor,
    double? backgroundOpacity = 0,
    int? backgroundAlpha,
    double? borderOpacity = 1,
    int? borderAlpha,
    double? borderWidth = 1,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle = BorderStyle.solid,
    Size? avatarSize,
    TextStyle? avatarForegroundStyle,
    Color? avatarForegroundColor,
    BorderRadiusGeometry? avatarBorderRadius,
    Color? checkmarkColor,
    double? checkmarkSize,
    double? checkmarkWeight,
    ChipCheckmarkStyle? checkmarkStyle,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    ChipStyle? selectedStyle,
    ChipStyle? disabledStyle = const ChipStyle(
      foregroundAlpha: ChipStyle.disabledForegroundAlpha,
      borderAlpha: ChipStyle.disabledBorderAlpha,
    ),
    ChipStyle? hoveredStyle,
    ChipStyle? focusedStyle,
    ChipStyle? pressedStyle,
  }) {
    return ChipStyle.when(
      enabled: ChipStyle(
        borderColor: color,
        foregroundColor: color,
        avatarBackgroundColor: color,
        height: height,
        margin: margin,
        padding: padding,
        clipBehavior: clipBehavior,
        overlayColor: overlayColor,
        shadowColor: shadowColor,
        elevation: elevation,
        foregroundStyle: foregroundStyle,
        foregroundOpacity: foregroundOpacity,
        foregroundAlpha: foregroundAlpha,
        foregroundSpacing: foregroundSpacing,
        backgroundColor: backgroundColor,
        backgroundOpacity: backgroundOpacity,
        backgroundAlpha: backgroundAlpha,
        borderOpacity: borderOpacity,
        borderAlpha: borderAlpha,
        borderWidth: borderWidth,
        borderRadius: borderRadius,
        borderStyle: borderStyle,
        avatarSize: avatarSize,
        avatarForegroundStyle: avatarForegroundStyle,
        avatarForegroundColor: avatarForegroundColor,
        avatarBorderRadius: avatarBorderRadius,
        checkmarkColor: checkmarkColor,
        checkmarkSize: checkmarkSize,
        checkmarkWeight: checkmarkWeight,
        checkmarkStyle: checkmarkStyle,
        iconColor: iconColor,
        iconOpacity: iconOpacity,
        iconSize: iconSize,
      ),
      selected: selectedStyle,
      disabled: disabledStyle,
      hovered: hoveredStyle,
      focused: focusedStyle,
      pressed: pressedStyle,
    );
  }

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [ChipStyle],
  /// otherwise returns the value itself.
  static ChipStyle? evaluate(
    ChipStyle? value,
    Set<WidgetEvent> events,
  ) {
    return value?.merge(DrivenProperty.evaluate<ChipStyle?>(value, events));
  }

  static const defaultClipBehavior = Clip.antiAlias;
  static const defaultBorderWidth = 1.0;
  static const defaultBorderStyle = BorderStyle.solid;
  static const defaultBorderRadius = BorderRadius.all(Radius.circular(8));
  static const defaultMargin = EdgeInsets.zero;
  static const defaultPadding = EdgeInsets.symmetric(horizontal: 8);
  static const defaultPaddingWithAvatar = EdgeInsets.symmetric(horizontal: 4);
  static const defaultAvatarSize = Size.square(24);
  static const defaultHeight = 32.0;
  static const defaultIconSize = 18.0;
  static const defaultCheckmarkWeight = 2.0;
  static const defaultCheckmarkSize = 18.0;
  static const defaultForegroundSpacing = 8.0;
  static const disabledForegroundAlpha = 0x61; // 38%
  static const disabledBackgroundAlpha = 0x0c; // 38% * 12% = 5%
  static const disabledBorderAlpha = 0x0c; // 38% * 12% = 5%
  static const colorTransparent = Color(0x00000000);
  static const colorBlack = Color(0xFF000000);
  static const colorWhite = Color(0xFFFFFFFF);

  /// Defaults to [ChipStyle.defaultHeight]
  final double? height;

  /// Empty space to surround the outside chip.
  final EdgeInsetsGeometry? margin;

  /// The padding between the contents of the chip and the outside chip.
  ///
  /// If chip has avatar defaults to [ChipStyle.defaultPaddingWithAvatar],
  /// else defaults to [ChipStyle.defaultPadding].
  final EdgeInsetsGeometry? padding;

  /// The chip's content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  ///
  /// Defaults to [ChipStyle.defaultClipBehavior]
  final Clip? clipBehavior;

  /// Defines the ink response colors.
  final Color? overlayColor;

  /// When [elevation] is non zero the color to use for the chip's shadow color.
  final Color? shadowColor;

  /// The chip's z-coordinate relative to the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  final double? elevation;

  /// The style to be applied to the chip's label.
  ///
  /// The default label style is [TextTheme.bodyText1] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  final TextStyle? foregroundStyle;

  /// The color to be applied to the chip's label, icon, and checkmark
  final Color? foregroundColor;

  /// Opacity to be apply to [foregroundColor].
  final double? foregroundOpacity;

  /// Alpha to be apply to [foregroundColor].
  final int? foregroundAlpha;

  /// How much space to place between chip's foreground widget in a run in the main axis.
  final double? foregroundSpacing;

  /// Color to be used for the chip's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

  /// Color to be used for the chip's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the chip's border, in logical pixels.
  final double? borderWidth;

  /// The radii for each corner of the chip's border.
  final BorderRadiusGeometry? borderRadius;

  /// The style of this side of the chip's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  /// Color to be used for the avatar's background.
  final Color? avatarBackgroundColor;

  /// Color to be used for the avatar's foreground (checkmark, or text).
  final Color? avatarForegroundColor;

  /// The style to be applied to the avatar's label.
  ///
  /// The default label style is [TextTheme.bodyText1] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  final TextStyle? avatarForegroundStyle;

  /// The radii for each corner of the avatar's border.
  final BorderRadiusGeometry? avatarBorderRadius;

  /// Defaults to [ChipStyle.defaultAvatarSize].
  final Size? avatarSize;

  /// The Color to be apply to the checkmark.
  ///
  /// If null fallback to [avatarForegroundColor] or [foregroundColor].
  final Color? checkmarkColor;

  /// Defaults to [ChipStyle.defaultCheckmarkSize].
  final double? checkmarkSize;

  /// Stroke width of the checkmark.
  ///
  /// Defaults to [ChipStyle.defaultCheckmarkWeight].
  final double? checkmarkWeight;

  /// Defaults to [ChipCheckmarkStyle.sharp].
  final ChipCheckmarkStyle? checkmarkStyle;

  /// Color to be used for the icon's inside the chip.
  final Color? iconColor;

  /// Opacity to be apply to [iconColor].
  final double? iconOpacity;

  /// The size of the icon's inside the chip, in logical pixels.
  ///
  /// Defaults to [ChipStyle.defaultIconSize].
  final double? iconSize;

  /// Whether the chip's has outline or not
  bool get isOutlined {
    final width = borderWidth;
    return borderStyle == BorderStyle.solid && width != null && width >= 1;
  }

  /// Whether the chip's has solid background color or not
  bool get isFilled {
    Color? color = backgroundColor;
    final opacity = backgroundOpacity;
    final alpha = backgroundAlpha;

    const kOpacityThreshold = 0.4;
    const kAlphaThreshold = 102;

    if (color != null) {
      color = Colors.colorWithOpacity(color, opacity);
      color = Colors.colorWithAlpha(color, alpha);
      final colorIsNotTransparent = color != colorTransparent;
      final colorIsSolid = color.opacity > kOpacityThreshold;
      return colorIsNotTransparent && colorIsSolid;
    }

    final isSolidByOpacity = opacity != null && opacity > kOpacityThreshold;
    final isSolidByAlpha = alpha != null && alpha > kAlphaThreshold;

    return isSolidByOpacity || isSolidByAlpha;
  }

  /// Whether the chip's has toned background color or not
  bool get isToned => !isFilled;

  /// Creates a copy of this [ChipStyle] but with
  /// the given fields replaced with the new values.
  ChipStyle copyWith({
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
    Color? overlayColor,
    Color? shadowColor,
    double? elevation,
    TextStyle? foregroundStyle,
    Color? foregroundColor,
    double? foregroundOpacity,
    int? foregroundAlpha,
    double? foregroundSpacing,
    Color? backgroundColor,
    double? backgroundOpacity,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadiusGeometry? borderRadius,
    BorderStyle? borderStyle,
    Size? avatarSize,
    TextStyle? avatarForegroundStyle,
    Color? avatarForegroundColor,
    Color? avatarBackgroundColor,
    BorderRadiusGeometry? avatarBorderRadius,
    Color? checkmarkColor,
    double? checkmarkSize,
    double? checkmarkWeight,
    ChipCheckmarkStyle? checkmarkStyle,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    ChipStyle? selectedStyle,
    ChipStyle? disabledStyle,
    ChipStyle? hoveredStyle,
    ChipStyle? focusedStyle,
    ChipStyle? pressedStyle,
  }) {
    final hasEvent = selectedStyle != null ||
        disabledStyle != null ||
        hoveredStyle != null ||
        focusedStyle != null ||
        pressedStyle != null;
    final style = ChipStyle(
      height: height ?? this.height,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      overlayColor: overlayColor ?? this.overlayColor,
      shadowColor: shadowColor ?? this.shadowColor,
      elevation: elevation ?? this.elevation,
      foregroundStyle: foregroundStyle ?? this.foregroundStyle,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      foregroundOpacity: foregroundOpacity ?? this.foregroundOpacity,
      foregroundAlpha: foregroundAlpha ?? this.foregroundAlpha,
      foregroundSpacing: foregroundSpacing ?? this.foregroundSpacing,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundOpacity: backgroundOpacity ?? this.backgroundOpacity,
      backgroundAlpha: backgroundAlpha ?? this.backgroundAlpha,
      borderColor: borderColor ?? this.borderColor,
      borderOpacity: borderOpacity ?? this.borderOpacity,
      borderAlpha: borderAlpha ?? this.borderAlpha,
      borderWidth: borderWidth ?? this.borderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      borderStyle: borderStyle ?? this.borderStyle,
      avatarSize: avatarSize ?? this.avatarSize,
      avatarForegroundStyle:
          avatarForegroundStyle ?? this.avatarForegroundStyle,
      avatarForegroundColor:
          avatarForegroundColor ?? this.avatarForegroundColor,
      avatarBackgroundColor:
          avatarBackgroundColor ?? this.avatarBackgroundColor,
      avatarBorderRadius: avatarBorderRadius ?? this.avatarBorderRadius,
      checkmarkColor: checkmarkColor ?? this.checkmarkColor,
      checkmarkSize: checkmarkSize ?? this.checkmarkSize,
      checkmarkWeight: checkmarkWeight ?? this.checkmarkWeight,
      checkmarkStyle: checkmarkStyle ?? this.checkmarkStyle,
      iconColor: iconColor ?? this.iconColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconSize: iconSize ?? this.iconSize,
    );
    return hasEvent
        ? ChipStyle.when(
            enabled: style,
            selected: selectedStyle,
            disabled: disabledStyle,
            hovered: hoveredStyle,
            focused: focusedStyle,
            pressed: pressedStyle,
          )
        : style;
  }

  /// Creates a copy of this [ChipStyle] but with
  /// the given fields replaced with the new values.
  ChipStyle merge(ChipStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      height: other.height,
      margin: other.margin,
      padding: other.padding,
      clipBehavior: other.clipBehavior,
      overlayColor: other.overlayColor,
      shadowColor: other.shadowColor,
      elevation: other.elevation,
      foregroundStyle: other.foregroundStyle,
      foregroundColor: other.foregroundColor,
      foregroundOpacity: other.foregroundOpacity,
      foregroundAlpha: other.foregroundAlpha,
      foregroundSpacing: other.foregroundSpacing,
      backgroundColor: other.backgroundColor,
      backgroundOpacity: other.backgroundOpacity,
      backgroundAlpha: other.backgroundAlpha,
      borderColor: other.borderColor,
      borderOpacity: other.borderOpacity,
      borderAlpha: other.borderAlpha,
      borderWidth: other.borderWidth,
      borderRadius: other.borderRadius,
      borderStyle: other.borderStyle,
      avatarSize: other.avatarSize,
      avatarForegroundStyle: other.avatarForegroundStyle,
      avatarForegroundColor: other.avatarForegroundColor,
      avatarBackgroundColor: other.avatarBackgroundColor,
      avatarBorderRadius: other.avatarBorderRadius,
      checkmarkColor: other.checkmarkColor,
      checkmarkSize: other.checkmarkSize,
      checkmarkWeight: other.checkmarkWeight,
      checkmarkStyle: other.checkmarkStyle,
      iconColor: other.iconColor,
      iconOpacity: other.iconOpacity,
      iconSize: other.iconSize,
      selectedStyle:
          other is _ChipStyle ? evaluate(other, {ChipEvent.selected}) : null,
      disabledStyle:
          other is _ChipStyle ? evaluate(other, {ChipEvent.disabled}) : null,
      hoveredStyle:
          other is _ChipStyle ? evaluate(other, {ChipEvent.hovered}) : null,
      focusedStyle:
          other is _ChipStyle ? evaluate(other, {ChipEvent.focused}) : null,
      pressedStyle:
          other is _ChipStyle ? evaluate(other, {ChipEvent.pressed}) : null,
    );
  }
}

class _ChipStyle extends ChipStyle implements DrivenProperty<ChipStyle?> {
  _ChipStyle(this._resolver) : super.from(_resolver({}));

  final DrivenPropertyResolver<ChipStyle?> _resolver;

  @override
  ChipStyle? resolve(Set<WidgetEvent> events) => _resolver(events);
}
