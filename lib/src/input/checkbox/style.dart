import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/colors.dart';
import 'event.dart';

/// Default checkbox's style.
class CheckboxStyle {
  const CheckboxStyle({
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
    this.iconColor,
    this.iconOpacity,
    this.iconSize,
  });

  /// Create a checkbox's style from another style
  CheckboxStyle.from(CheckboxStyle? other)
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
        iconColor = other?.iconColor,
        iconOpacity = other?.iconOpacity,
        iconSize = other?.iconSize;

  /// Create an event driven checkbox's style using [callback].
  factory CheckboxStyle.driven(
    DrivenPropertyResolver<CheckboxStyle?> callback,
  ) {
    return _CheckboxStyle(callback);
  }

  /// Create a checkbox's style when some events occurs.
  ///
  /// The [enabled] is base style to be applied to the checkbox.
  /// if `null` will fallback with empty DrivenButtonStyle
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [CheckboxEvent.disabled].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [CheckboxEvent.hovered].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [CheckboxEvent.focused].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [CheckboxEvent.pressed].
  factory CheckboxStyle.when({
    CheckboxStyle? enabled,
    CheckboxStyle? disabled,
    CheckboxStyle? hovered,
    CheckboxStyle? focused,
    CheckboxStyle? pressed,
  }) {
    return CheckboxStyle.driven((events) {
      return (enabled ?? const CheckboxStyle())
          .merge(CheckboxEvent.isDisabled(events)
              ? evaluate(disabled, events)
              : null)
          .merge(CheckboxEvent.isFocused(events)
              ? evaluate(focused, events)
              : null)
          .merge(CheckboxEvent.isHovered(events)
              ? evaluate(hovered, events)
              : null)
          .merge(CheckboxEvent.isPressed(events)
              ? evaluate(pressed, events)
              : null);
    });
  }

  /// Create checkbox's style with default value for toned style.
  ///
  /// The [disabledStyle] style to be merged,
  /// when events includes [CheckboxEvent.disabled].
  ///
  /// The [hoveredStyle] style to be merged,
  /// when events includes [CheckboxEvent.hovered].
  ///
  /// The [focusedStyle] style to be merged,
  /// when events includes [CheckboxEvent.focused].
  ///
  /// The [pressedStyle] style to be merged,
  /// when events includes [CheckboxEvent.pressed].
  factory CheckboxStyle.toned({
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
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    CheckboxStyle? disabledStyle = const CheckboxStyle(
      foregroundAlpha: CheckboxStyle.disabledForegroundAlpha,
      backgroundAlpha: CheckboxStyle.disabledBackgroundAlpha,
      borderAlpha: CheckboxStyle.disabledBorderAlpha,
    ),
    CheckboxStyle? hoveredStyle,
    CheckboxStyle? focusedStyle,
    CheckboxStyle? pressedStyle,
  }) {
    return CheckboxStyle.when(
      enabled: CheckboxStyle(
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

  /// Create checkbox's style with default value for filled style.
  ///
  /// The [disabledStyle] style to be merged,
  /// when events includes [CheckboxEvent.disabled].
  ///
  /// The [hoveredStyle] style to be merged,
  /// when events includes [CheckboxEvent.hovered].
  ///
  /// The [focusedStyle] style to be merged,
  /// when events includes [CheckboxEvent.focused].
  ///
  /// The [pressedStyle] style to be merged,
  /// when events includes [CheckboxEvent.pressed].
  factory CheckboxStyle.filled({
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
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    CheckboxStyle? disabledStyle = const CheckboxStyle(
      foregroundAlpha: CheckboxStyle.disabledForegroundAlpha,
      backgroundAlpha: CheckboxStyle.disabledBackgroundAlpha,
      borderAlpha: CheckboxStyle.disabledBorderAlpha,
    ),
    CheckboxStyle? hoveredStyle,
    CheckboxStyle? focusedStyle,
    CheckboxStyle? pressedStyle = const CheckboxStyle(
      elevation: 5,
    ),
  }) {
    return CheckboxStyle.when(
      enabled: CheckboxStyle(
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

  /// Create checkbox's style with default value for outlined style.
  ///
  /// The [disabled] style to be merged,
  /// when events includes [CheckboxEvent.disabled].
  ///
  /// The [hovered] style to be merged,
  /// when events includes [CheckboxEvent.hovered].
  ///
  /// The [focused] style to be merged,
  /// when events includes [CheckboxEvent.focused].
  ///
  /// The [pressed] style to be merged,
  /// when events includes [CheckboxEvent.pressed].
  factory CheckboxStyle.outlined({
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
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    CheckboxStyle? disabledStyle = const CheckboxStyle(
      foregroundAlpha: CheckboxStyle.disabledForegroundAlpha,
      borderAlpha: CheckboxStyle.disabledBorderAlpha,
    ),
    CheckboxStyle? hoveredStyle,
    CheckboxStyle? focusedStyle,
    CheckboxStyle? pressedStyle,
  }) {
    return CheckboxStyle.when(
      enabled: CheckboxStyle(
        borderColor: color,
        foregroundColor: color,
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
  /// if `value` is an event driven [CheckboxStyle],
  /// otherwise returns the value itself.
  static CheckboxStyle? evaluate(
    CheckboxStyle? value,
    Set<WidgetEvent> events,
  ) {
    return value?.merge(DrivenProperty.evaluate<CheckboxStyle?>(value, events));
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

  /// Defaults to [CheckboxStyle.defaultHeight]
  final double? height;

  /// Empty space to surround the outside checkbox.
  final EdgeInsetsGeometry? margin;

  /// The padding between the contents of the checkbox and the outside checkbox.
  ///
  /// defaults to [CheckboxStyle.defaultPadding].
  final EdgeInsetsGeometry? padding;

  /// The checkbox's content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  ///
  /// Defaults to [CheckboxStyle.defaultClipBehavior]
  final Clip? clipBehavior;

  /// Defines the ink response colors.
  final Color? overlayColor;

  /// When [elevation] is non zero the color
  /// to use for the checkbox's shadow color.
  final Color? shadowColor;

  /// The checkbox's z-coordinate relative to
  /// the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  final double? elevation;

  /// The style to be applied to the checkbox's label.
  ///
  /// The default label style is [TextTheme.bodyText1] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  final TextStyle? foregroundStyle;

  /// The color to be applied to the checkbox's label, and icon
  final Color? foregroundColor;

  /// Opacity to be apply to [foregroundColor].
  final double? foregroundOpacity;

  /// Alpha to be apply to [foregroundColor].
  final int? foregroundAlpha;

  /// How much space to place between checkbox's foreground widget in a run in the main axis.
  final double? foregroundSpacing;

  /// Color to be used for the checkbox's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

  /// Color to be used for the checkbox's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the checkbox's border, in logical pixels.
  final double? borderWidth;

  /// The radii for each corner of the checkbox's border.
  final BorderRadiusGeometry? borderRadius;

  /// The style of this side of the checkbox's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  /// Color to be used for the icon's inside the checkbox.
  final Color? iconColor;

  /// Opacity to be apply to [iconColor].
  final double? iconOpacity;

  /// The size of the icon's inside the checkbox, in logical pixels.
  ///
  /// Defaults to [CheckboxStyle.defaultIconSize].
  final double? iconSize;

  /// Whether the checkbox's has outline or not
  bool get isOutlined {
    final width = borderWidth;
    return borderStyle == BorderStyle.solid && width != null && width >= 1;
  }

  /// Whether the checkbox's has solid background color or not
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

  /// Whether the checkbox's has toned background color or not
  bool get isToned => !isFilled;

  /// Creates a copy of this [CheckboxStyle] but with
  /// the given fields replaced with the new values.
  CheckboxStyle copyWith({
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
    Color? iconColor,
    double? iconOpacity,
    double? iconSize,
    CheckboxStyle? disabledStyle,
    CheckboxStyle? hoveredStyle,
    CheckboxStyle? focusedStyle,
    CheckboxStyle? pressedStyle,
  }) {
    final hasEvent = disabledStyle != null ||
        hoveredStyle != null ||
        focusedStyle != null ||
        pressedStyle != null;
    final style = CheckboxStyle(
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
      iconColor: iconColor ?? this.iconColor,
      iconOpacity: iconOpacity ?? this.iconOpacity,
      iconSize: iconSize ?? this.iconSize,
    );
    return hasEvent
        ? CheckboxStyle.when(
            enabled: style,
            disabled: disabledStyle,
            hovered: hoveredStyle,
            focused: focusedStyle,
            pressed: pressedStyle,
          )
        : style;
  }

  /// Creates a copy of this [CheckboxStyle] but with
  /// the given fields replaced with the new values.
  CheckboxStyle merge(CheckboxStyle? other) {
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
      iconColor: other.iconColor,
      iconOpacity: other.iconOpacity,
      iconSize: other.iconSize,
      disabledStyle: other is _CheckboxStyle
          ? evaluate(other, {CheckboxEvent.disabled})
          : null,
      hoveredStyle: other is _CheckboxStyle
          ? evaluate(other, {CheckboxEvent.hovered})
          : null,
      focusedStyle: other is _CheckboxStyle
          ? evaluate(other, {CheckboxEvent.focused})
          : null,
      pressedStyle: other is _CheckboxStyle
          ? evaluate(other, {CheckboxEvent.pressed})
          : null,
    );
  }
}

class _CheckboxStyle extends CheckboxStyle
    implements DrivenProperty<CheckboxStyle?> {
  _CheckboxStyle(this._resolver) : super.from(_resolver({}));

  final DrivenPropertyResolver<CheckboxStyle?> _resolver;

  @override
  CheckboxStyle? resolve(Set<WidgetEvent> events) => _resolver(events);
}
