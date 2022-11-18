import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';
import 'event.dart';

/// Default button's style.
class ButtonStyle {
  const ButtonStyle({
    this.width,
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
    this.shape,
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
  });

  /// Create a button's style from another style
  ButtonStyle.from(ButtonStyle? other)
      : width = other?.width,
        height = other?.height,
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
        shape = other?.shape,
        iconColor = other?.iconColor,
        iconOpacity = other?.iconOpacity,
        iconSize = other?.iconSize;

  /// Create an event driven button's style using [callback].
  factory ButtonStyle.driven(
    DrivenPropertyResolver<ButtonStyle?> callback,
  ) {
    return _ButtonStyle(callback);
  }

  /// Create a button's style when some events occurs.
  ///
  /// The [enabled] is base style to be applied to the button.
  /// if `null` will fallback with empty DrivenButtonStyle
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [ButtonEvent.disabled].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [ButtonEvent.hovered].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [ButtonEvent.focused].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [ButtonEvent.pressed].
  factory ButtonStyle.when({
    ButtonStyle? enabled,
    ButtonStyle? disabled,
    ButtonStyle? hovered,
    ButtonStyle? focused,
    ButtonStyle? pressed,
  }) {
    return ButtonStyle.driven((events) {
      return (enabled ?? const ButtonStyle())
          .merge(
              ButtonEvent.isFocused(events) ? evaluate(focused, events) : null)
          .merge(
              ButtonEvent.isHovered(events) ? evaluate(hovered, events) : null)
          .merge(
              ButtonEvent.isPressed(events) ? evaluate(pressed, events) : null)
          .merge(ButtonEvent.isDisabled(events)
              ? evaluate(disabled, events)
              : null);
    });
  }

  /// Create button's style with default value for flat style.
  ///
  /// The [disabledStyle] style to be merged,
  /// when events includes [ButtonEvent.disabled].
  ///
  /// The [hoveredStyle] style to be merged,
  /// when events includes [ButtonEvent.hovered].
  ///
  /// The [focusedStyle] style to be merged,
  /// when events includes [ButtonEvent.focused].
  ///
  /// The [pressedStyle] style to be merged,
  /// when events includes [ButtonEvent.pressed].
  factory ButtonStyle.flat({
    double? width,
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
    double? backgroundOpacity = 0,
    int? backgroundAlpha,
    Color? borderColor,
    double? borderOpacity,
    int? borderAlpha,
    double? borderWidth,
    BorderRadius? borderRadius,
    BorderStyle? borderStyle = BorderStyle.none,
    BoxShape? shape,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    ButtonStyle? disabledStyle = const ButtonStyle(
      foregroundAlpha: ButtonStyle.disabledForegroundAlpha,
    ),
    ButtonStyle? hoveredStyle,
    ButtonStyle? focusedStyle,
    ButtonStyle? pressedStyle,
  }) {
    return ButtonStyle.when(
      enabled: ButtonStyle(
        width: width,
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
        shape: shape,
        iconColor: iconColor,
        iconOpacity: iconOpacity,
        iconSize: iconSize,
      ),
      disabled: disabledStyle,
      hovered: hoveredStyle,
      focused: focusedStyle,
      pressed: pressedStyle,
    );
  }

  /// Create button's style with default value for toned style.
  ///
  /// The [disabledStyle] style to be merged,
  /// when events includes [ButtonEvent.disabled].
  ///
  /// The [hoveredStyle] style to be merged,
  /// when events includes [ButtonEvent.hovered].
  ///
  /// The [focusedStyle] style to be merged,
  /// when events includes [ButtonEvent.focused].
  ///
  /// The [pressedStyle] style to be merged,
  /// when events includes [ButtonEvent.pressed].
  factory ButtonStyle.toned({
    double? width,
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
    BorderRadius? borderRadius,
    BorderStyle? borderStyle = BorderStyle.none,
    BoxShape? shape,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    ButtonStyle? disabledStyle = const ButtonStyle(
      foregroundAlpha: ButtonStyle.disabledForegroundAlpha,
      backgroundAlpha: ButtonStyle.disabledBackgroundAlpha,
      borderAlpha: ButtonStyle.disabledBorderAlpha,
    ),
    ButtonStyle? hoveredStyle,
    ButtonStyle? focusedStyle,
    ButtonStyle? pressedStyle,
  }) {
    return ButtonStyle.when(
      enabled: ButtonStyle(
        width: width,
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
        shape: shape,
        iconColor: iconColor,
        iconOpacity: iconOpacity,
        iconSize: iconSize,
      ),
      disabled: disabledStyle,
      hovered: hoveredStyle,
      focused: focusedStyle,
      pressed: pressedStyle,
    );
  }

  /// Create button's style with default value for filled style.
  ///
  /// The [disabledStyle] style to be merged,
  /// when events includes [ButtonEvent.disabled].
  ///
  /// The [hoveredStyle] style to be merged,
  /// when events includes [ButtonEvent.hovered].
  ///
  /// The [focusedStyle] style to be merged,
  /// when events includes [ButtonEvent.focused].
  ///
  /// The [pressedStyle] style to be merged,
  /// when events includes [ButtonEvent.pressed].
  factory ButtonStyle.filled({
    Color? color,
    double? width,
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
    BorderRadius? borderRadius,
    BorderStyle? borderStyle = BorderStyle.none,
    BoxShape? shape,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    ButtonStyle? disabledStyle = const ButtonStyle(
      foregroundAlpha: ButtonStyle.disabledForegroundAlpha,
      backgroundAlpha: ButtonStyle.disabledBackgroundAlpha,
      borderAlpha: ButtonStyle.disabledBorderAlpha,
    ),
    ButtonStyle? hoveredStyle,
    ButtonStyle? focusedStyle,
    ButtonStyle? pressedStyle = const ButtonStyle(
      elevation: 5,
    ),
  }) {
    return ButtonStyle.when(
      enabled: ButtonStyle(
        backgroundColor: color,
        borderColor: color,
        width: width,
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
        shape: shape,
        iconColor: iconColor,
        iconOpacity: iconOpacity,
        iconSize: iconSize,
      ),
      disabled: disabledStyle,
      hovered: hoveredStyle,
      focused: focusedStyle,
      pressed: pressedStyle,
    );
  }

  /// Create button's style with default value for outlined style.
  ///
  /// The [disabled] style to be merged,
  /// when events includes [ButtonEvent.disabled].
  ///
  /// The [hovered] style to be merged,
  /// when events includes [ButtonEvent.hovered].
  ///
  /// The [focused] style to be merged,
  /// when events includes [ButtonEvent.focused].
  ///
  /// The [pressed] style to be merged,
  /// when events includes [ButtonEvent.pressed].
  factory ButtonStyle.outlined({
    Color? color,
    double? width,
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
    BorderRadius? borderRadius,
    BorderStyle? borderStyle = BorderStyle.solid,
    BoxShape? shape,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    ButtonStyle? disabledStyle = const ButtonStyle(
      foregroundAlpha: ButtonStyle.disabledForegroundAlpha,
      borderAlpha: ButtonStyle.disabledBorderAlpha,
    ),
    ButtonStyle? hoveredStyle,
    ButtonStyle? focusedStyle,
    ButtonStyle? pressedStyle,
  }) {
    return ButtonStyle.when(
      enabled: ButtonStyle(
        borderColor: color,
        foregroundColor: color,
        width: width,
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
        shape: shape,
        iconColor: iconColor,
        iconOpacity: iconOpacity,
        iconSize: iconSize,
      ),
      disabled: disabledStyle,
      hovered: hoveredStyle,
      focused: focusedStyle,
      pressed: pressedStyle,
    );
  }

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [ButtonStyle],
  /// otherwise returns the value itself.
  static ButtonStyle? evaluate(
    ButtonStyle? value,
    Set<WidgetEvent> events,
  ) {
    return value?.merge(DrivenProperty.evaluate<ButtonStyle?>(value, events));
  }

  static const defaultClipBehavior = Clip.antiAlias;
  static const defaultBorderWidth = 1.0;
  static const defaultBorderStyle = BorderStyle.solid;
  static const defaultBorderRadius = BorderRadius.all(Radius.circular(8));
  static const defaultMargin = EdgeInsets.zero;
  static const defaultPadding = EdgeInsets.symmetric(horizontal: 16);
  static const defaultHeight = 40.0;
  static const defaultIconSize = 18.0;
  static const defaultForegroundSpacing = 8.0;
  static const disabledForegroundAlpha = 0x61; // 38%
  static const disabledBackgroundAlpha = 0x0c; // 38% * 12% = 5%
  static const disabledBorderAlpha = 0x0c; // 38% * 12% = 5%
  static const colorTransparent = Color(0x00000000);
  static const colorBlack = Color(0xFF000000);
  static const colorWhite = Color(0xFFFFFFFF);

  /// If non-null, requires the child to have exactly this width.
  final double? width;

  /// Defaults to [ButtonStyle.defaultHeight]
  final double? height;

  /// Empty space to surround the outside button.
  final EdgeInsetsGeometry? margin;

  /// The padding between the contents of the button and the outside button.
  ///
  /// defaults to [ButtonStyle.defaultPadding].
  final EdgeInsetsGeometry? padding;

  /// The button's content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  ///
  /// Defaults to [ButtonStyle.defaultClipBehavior]
  final Clip? clipBehavior;

  /// Defines the ink response colors.
  final Color? overlayColor;

  /// When [elevation] is non zero the color
  /// to use for the button's shadow color.
  final Color? shadowColor;

  /// The button's z-coordinate relative to
  /// the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  final double? elevation;

  /// The style to be applied to the button's label.
  ///
  /// The default label style is [TextTheme.bodyText1] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  final TextStyle? foregroundStyle;

  /// The color to be applied to the button's label, and icon
  final Color? foregroundColor;

  /// Opacity to be apply to [foregroundColor].
  final double? foregroundOpacity;

  /// Alpha to be apply to [foregroundColor].
  final int? foregroundAlpha;

  /// How much space to place between button's foreground widget in a run in the main axis.
  final double? foregroundSpacing;

  /// Color to be used for the button's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

  /// Color to be used for the button's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the button's border, in logical pixels.
  final double? borderWidth;

  /// The radii for each corner of the button's border.
  final BorderRadius? borderRadius;

  /// The style of this side of the button's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  /// The type of shape.
  final BoxShape? shape;

  /// Color to be used for the icon's inside the button.
  final Color? iconColor;

  /// Opacity to be apply to [iconColor].
  final double? iconOpacity;

  /// The size of the icon's inside the button, in logical pixels.
  ///
  /// Defaults to [ButtonStyle.defaultIconSize].
  final double? iconSize;

  /// Whether the button's has outline or not
  bool get isOutlined {
    final width = borderWidth;
    return borderStyle == BorderStyle.solid && width != null && width >= 1;
  }

  /// Whether the button's has solid background color or not
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

  /// Whether the button's has toned background color or not
  bool get isToned => !isFilled;

  /// Creates a copy of this [ButtonStyle] but with
  /// the given fields replaced with the new values.
  ButtonStyle copyWith({
    double? width,
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
    BorderRadius? borderRadius,
    BorderStyle? borderStyle,
    BoxShape? shape,
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    ButtonStyle? disabledStyle,
    ButtonStyle? hoveredStyle,
    ButtonStyle? focusedStyle,
    ButtonStyle? pressedStyle,
  }) {
    final hasEvent = disabledStyle != null ||
        hoveredStyle != null ||
        focusedStyle != null ||
        pressedStyle != null;
    final style = ButtonStyle(
      width: width ?? this.width,
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
      shape: shape ?? this.shape,
      iconColor: iconColor ?? this.iconColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconSize: iconSize ?? this.iconSize,
    );
    return hasEvent
        ? ButtonStyle.when(
            enabled: style,
            disabled: disabledStyle,
            hovered: hoveredStyle,
            focused: focusedStyle,
            pressed: pressedStyle,
          )
        : style;
  }

  /// Creates a copy of this [ButtonStyle] but with
  /// the given fields replaced with the new values.
  ButtonStyle merge(ButtonStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      width: other.width,
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
      shape: other.shape,
      iconColor: other.iconColor,
      iconOpacity: other.iconOpacity,
      iconSize: other.iconSize,
      disabledStyle: other is _ButtonStyle
          ? evaluate(other, {ButtonEvent.disabled})
          : null,
      hoveredStyle:
          other is _ButtonStyle ? evaluate(other, {ButtonEvent.hovered}) : null,
      focusedStyle:
          other is _ButtonStyle ? evaluate(other, {ButtonEvent.focused}) : null,
      pressedStyle:
          other is _ButtonStyle ? evaluate(other, {ButtonEvent.pressed}) : null,
    );
  }
}

class _ButtonStyle extends ButtonStyle implements DrivenProperty<ButtonStyle?> {
  _ButtonStyle(this._resolver) : super.from(_resolver({}));

  final DrivenPropertyResolver<ButtonStyle?> _resolver;

  @override
  ButtonStyle? resolve(Set<WidgetEvent> events) => _resolver(events);
}
