import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/utils.dart';

@immutable
class SheetStyle with Diagnosticable {
  /// If non-null, requires the child to have exactly this width.
  final double? width;

  /// Defaults to [SheetStyle.defaultHeight]
  final double? height;

  /// Empty space to surround the outside sheet.
  final EdgeInsetsGeometry? margin;

  /// The padding between the contents of the sheet and the outside sheet.
  ///
  /// defaults to [SheetStyle.defaultPadding].
  final EdgeInsetsGeometry? padding;

  final Alignment? alignment;

  /// The sheet's content will be clipped (or not) according to this option.
  ///
  /// See the enum [Clip] for details of all possible options and their common use cases.
  ///
  /// Defaults to [SheetStyle.defaultClipBehavior]
  final Clip? clipBehavior;

  /// Defines the ink response colors.
  final Color? overlayColor;

  /// When [elevation] is non zero the color
  /// to use for the sheet's shadow color.
  final Color? shadowColor;

  /// The sheet's z-coordinate relative to
  /// the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  final double? elevation;

  /// The style to be applied to the sheet's label.
  ///
  /// The default label style is [TextTheme.bodyText1] from the overall
  /// theme's [ThemeData.textTheme].
  //
  /// This only has an effect on widgets that respect the [DefaultTextStyle],
  /// such as [Text].
  final TextStyle? foregroundStyle;

  /// The color to be applied to the sheet's label, and icon
  final Color? foregroundColor;

  /// Opacity to be apply to [foregroundColor].
  final double? foregroundOpacity;

  /// Alpha to be apply to [foregroundColor].
  final int? foregroundAlpha;

  /// How much space to place between sheet's foreground widget in a run in the main axis.
  final double? foregroundSpacing;

  /// Color to be used for the sheet's background.
  final Color? backgroundColor;

  /// Opacity to be apply to [backgroundColor].
  final double? backgroundOpacity;

  /// Alpha to be apply to [backgroundColor].
  final int? backgroundAlpha;

  /// Color to be used for the sheet's border.
  final Color? borderColor;

  /// Opacity to be apply to [borderColor].
  final double? borderOpacity;

  /// Alpha to be apply to [borderColor].
  final int? borderAlpha;

  /// The width of this side of the sheet's border, in logical pixels.
  final double? borderWidth;

  /// The radii for each corner of the sheet's border.
  final BorderRadius? borderRadius;

  /// The style of this side of the sheet's border.
  ///
  /// To omit a side, set [borderStyle] to [BorderStyle.none].
  /// This skips painting the border, but the border still has a [borderWidth].
  final BorderStyle? borderStyle;

  /// The type of shape.
  final BoxShape? shape;

  /// Color to be used for the icon's inside the sheet.
  final Color? iconColor;

  /// Opacity to be apply to [iconColor].
  final double? iconOpacity;

  /// The size of the icon's inside the sheet, in logical pixels.
  ///
  /// Defaults to [SheetStyle.defaultIconSize].
  final double? iconSize;

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

  /// Whether the sheet's has outline or not
  bool get isOutlined {
    final width = borderWidth;
    return borderStyle == BorderStyle.solid && width != null && width >= 1;
  }

  /// Whether the sheet's has solid background color or not
  bool get isFilled {
    Color? color = backgroundColor;
    final opacity = backgroundOpacity;
    final alpha = backgroundAlpha;

    const kOpacityThreshold = 0.4;
    const kAlphaThreshold = 102;

    if (color != null) {
      color = Colors.colorWithOpacity(color, opacity);
      color = Colors.colorWithAlpha(color, alpha);
      final colorIsNotTransparent = color != Colors.transparent;
      final colorIsSolid = color.opacity > kOpacityThreshold;
      return colorIsNotTransparent && colorIsSolid;
    }

    final isSolidByOpacity = opacity != null && opacity > kOpacityThreshold;
    final isSolidByAlpha = alpha != null && alpha > kAlphaThreshold;

    return isSolidByOpacity || isSolidByAlpha;
  }

  /// Whether the sheet's has toned background color or not
  bool get isToned => !isFilled;

  /// [SheetStyle] with an empty value.
  const SheetStyle({
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.alignment,
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

  /// Create a [SheetStyle] from another style
  const SheetStyle.fallback()
      : width = null,
        height = null,
        margin = null,
        padding = null,
        alignment = null,
        clipBehavior = null,
        overlayColor = null,
        shadowColor = null,
        elevation = null,
        foregroundStyle = null,
        foregroundColor = null,
        foregroundOpacity = null,
        foregroundAlpha = null,
        foregroundSpacing = null,
        backgroundColor = null,
        backgroundOpacity = null,
        backgroundAlpha = null,
        borderColor = null,
        borderOpacity = null,
        borderAlpha = null,
        borderWidth = null,
        borderRadius = null,
        borderStyle = null,
        shape = null,
        iconColor = null,
        iconOpacity = null,
        iconSize = null;

  /// Create a [SheetStyle] from another style
  SheetStyle.from(SheetStyle? other)
      : width = other?.width,
        height = other?.height,
        margin = other?.margin,
        padding = other?.padding,
        alignment = other?.alignment,
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

  /// Create an event driven [SheetStyle] using [callback].
  factory SheetStyle.driven(
    DrivenPropertyResolver<SheetStyle?> callback,
  ) {
    return _SheetStyle(callback);
  }

  /// Create a [SheetStyle] when some events occurs.
  ///
  /// The [enabled] is base style to be applied to the sheet.
  /// if `null` will fallback with empty DrivenButtonStyle
  ///
  /// The [selected] style to be merged with [enabled],
  /// when events includes [WidgetEvent.selected].
  ///
  /// The [indeterminate] style to be merged with [enabled],
  /// when events includes [WidgetEvent.indeterminate].
  ///
  /// The [error] style to be merged with [enabled],
  /// when events includes [WidgetEvent.error].
  ///
  /// The [loading] style to be merged with [enabled],
  /// when events includes [WidgetEvent.loading].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [WidgetEvent.focused].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [WidgetEvent.hovered].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [WidgetEvent.pressed].
  ///
  /// The [dragged] style to be merged with [enabled],
  /// when events includes [WidgetEvent.dragged].
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [WidgetEvent.disabled].
  factory SheetStyle.when({
    SheetStyle? enabled,
    SheetStyle? selected,
    SheetStyle? indeterminate,
    SheetStyle? error,
    SheetStyle? loading,
    SheetStyle? focused,
    SheetStyle? hovered,
    SheetStyle? pressed,
    SheetStyle? dragged,
    SheetStyle? disabled,
  }) {
    return SheetStyle.driven((events) {
      return (enabled ?? const SheetStyle())
          .merge(WidgetEvent.isSelected(events)
              ? SheetStyle.evaluate(selected, events)
              : null)
          .merge(WidgetEvent.isIndeterminate(events)
              ? evaluate(indeterminate, events)
              : null)
          .merge(WidgetEvent.isErrored(events)
              ? SheetStyle.evaluate(error, events)
              : null)
          .merge(WidgetEvent.isLoading(events)
              ? SheetStyle.evaluate(loading, events)
              : null)
          .merge(WidgetEvent.isFocused(events)
              ? SheetStyle.evaluate(focused, events)
              : null)
          .merge(WidgetEvent.isHovered(events)
              ? SheetStyle.evaluate(hovered, events)
              : null)
          .merge(WidgetEvent.isPressed(events)
              ? SheetStyle.evaluate(pressed, events)
              : null)
          .merge(WidgetEvent.isDragged(events)
              ? SheetStyle.evaluate(dragged, events)
              : null)
          .merge(WidgetEvent.isDisabled(events)
              ? SheetStyle.evaluate(disabled, events)
              : null);
    });
  }

  /// Resolves the value for the given set of events
  /// if `value` is an event driven [SheetStyle],
  /// otherwise returns the value itself.
  static SheetStyle? evaluate(
    SheetStyle? value,
    Set<WidgetEvent> events,
  ) {
    return value?.merge(DrivenProperty.evaluate<SheetStyle?>(value, events));
  }

  /// Create [SheetStyle] with default value for flat style.
  ///
  /// The [selected] style to be merged with [enabled],
  /// when events includes [WidgetEvent.selected].
  ///
  /// The [indeterminate] style to be merged with [enabled],
  /// when events includes [WidgetEvent.indeterminate].
  ///
  /// The [error] style to be merged with [enabled],
  /// when events includes [WidgetEvent.error].
  ///
  /// The [loading] style to be merged with [enabled],
  /// when events includes [WidgetEvent.loading].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [WidgetEvent.focused].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [WidgetEvent.hovered].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [WidgetEvent.pressed].
  ///
  /// The [dragged] style to be merged with [enabled],
  /// when events includes [WidgetEvent.dragged].
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [WidgetEvent.disabled].
  SheetStyle flat({
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Alignment? alignment,
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
    SheetStyle? selectedStyle,
    SheetStyle? indeterminateStyle,
    SheetStyle? errorStyle,
    SheetStyle? loadingStyle,
    SheetStyle? focusedStyle,
    SheetStyle? hoveredStyle,
    SheetStyle? pressedStyle,
    SheetStyle? draggedStyle,
    SheetStyle? disabledStyle = const SheetStyle(
      foregroundAlpha: SheetStyle.disabledForegroundAlpha,
    ),
  }) {
    final style = SheetStyle.when(
      enabled: SheetStyle(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: alignment,
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
      selected: selectedStyle,
      indeterminate: indeterminateStyle,
      error: errorStyle,
      loading: loadingStyle,
      focused: focusedStyle,
      hovered: hoveredStyle,
      pressed: pressedStyle,
      dragged: draggedStyle,
      disabled: disabledStyle,
    );

    return merge(style);
  }

  /// Create [SheetStyle] with default value for toned style.
  ///
  /// The [selected] style to be merged with [enabled],
  /// when events includes [WidgetEvent.selected].
  ///
  /// The [indeterminate] style to be merged with [enabled],
  /// when events includes [WidgetEvent.indeterminate].
  ///
  /// The [error] style to be merged with [enabled],
  /// when events includes [WidgetEvent.error].
  ///
  /// The [loading] style to be merged with [enabled],
  /// when events includes [WidgetEvent.loading].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [WidgetEvent.focused].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [WidgetEvent.hovered].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [WidgetEvent.pressed].
  ///
  /// The [dragged] style to be merged with [enabled],
  /// when events includes [WidgetEvent.dragged].
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [WidgetEvent.disabled].
  SheetStyle toned({
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Alignment? alignment,
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
    SheetStyle? selectedStyle,
    SheetStyle? indeterminateStyle,
    SheetStyle? errorStyle,
    SheetStyle? loadingStyle,
    SheetStyle? focusedStyle,
    SheetStyle? hoveredStyle,
    SheetStyle? pressedStyle,
    SheetStyle? draggedStyle,
    SheetStyle? disabledStyle = const SheetStyle(
      foregroundAlpha: SheetStyle.disabledForegroundAlpha,
      backgroundAlpha: SheetStyle.disabledBackgroundAlpha,
      borderAlpha: SheetStyle.disabledBorderAlpha,
    ),
  }) {
    final style = SheetStyle.when(
      enabled: SheetStyle(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: alignment,
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
      selected: selectedStyle,
      indeterminate: indeterminateStyle,
      error: errorStyle,
      loading: loadingStyle,
      focused: focusedStyle,
      hovered: hoveredStyle,
      pressed: pressedStyle,
      dragged: draggedStyle,
      disabled: disabledStyle,
    );

    return merge(style);
  }

  /// Create [SheetStyle] with default value for filled style.
  ///
  /// The [selected] style to be merged with [enabled],
  /// when events includes [WidgetEvent.selected].
  ///
  /// The [indeterminate] style to be merged with [enabled],
  /// when events includes [WidgetEvent.indeterminate].
  ///
  /// The [error] style to be merged with [enabled],
  /// when events includes [WidgetEvent.error].
  ///
  /// The [loading] style to be merged with [enabled],
  /// when events includes [WidgetEvent.loading].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [WidgetEvent.focused].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [WidgetEvent.hovered].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [WidgetEvent.pressed].
  ///
  /// The [dragged] style to be merged with [enabled],
  /// when events includes [WidgetEvent.dragged].
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [WidgetEvent.disabled].
  SheetStyle filled({
    Color? color,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Alignment? alignment,
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
    SheetStyle? selectedStyle,
    SheetStyle? indeterminateStyle,
    SheetStyle? errorStyle,
    SheetStyle? loadingStyle,
    SheetStyle? focusedStyle,
    SheetStyle? hoveredStyle,
    SheetStyle? pressedStyle = const SheetStyle(
      elevation: 5,
    ),
    SheetStyle? draggedStyle,
    SheetStyle? disabledStyle = const SheetStyle(
      foregroundAlpha: SheetStyle.disabledForegroundAlpha,
      backgroundAlpha: SheetStyle.disabledBackgroundAlpha,
      borderAlpha: SheetStyle.disabledBorderAlpha,
    ),
  }) {
    final style = SheetStyle.when(
      enabled: SheetStyle(
        backgroundColor: color,
        borderColor: color,
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: alignment,
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
      selected: selectedStyle,
      indeterminate: indeterminateStyle,
      error: errorStyle,
      loading: loadingStyle,
      focused: focusedStyle,
      hovered: hoveredStyle,
      pressed: pressedStyle,
      dragged: draggedStyle,
      disabled: disabledStyle,
    );

    return merge(style);
  }

  /// Create [SheetStyle] with default value for outlined style.
  ///
  /// The [selected] style to be merged with [enabled],
  /// when events includes [WidgetEvent.selected].
  ///
  /// The [indeterminate] style to be merged with [enabled],
  /// when events includes [WidgetEvent.indeterminate].
  ///
  /// The [error] style to be merged with [enabled],
  /// when events includes [WidgetEvent.error].
  ///
  /// The [loading] style to be merged with [enabled],
  /// when events includes [WidgetEvent.loading].
  ///
  /// The [focused] style to be merged with [enabled],
  /// when events includes [WidgetEvent.focused].
  ///
  /// The [hovered] style to be merged with [enabled],
  /// when events includes [WidgetEvent.hovered].
  ///
  /// The [pressed] style to be merged with [enabled],
  /// when events includes [WidgetEvent.pressed].
  ///
  /// The [dragged] style to be merged with [enabled],
  /// when events includes [WidgetEvent.dragged].
  ///
  /// The [disabled] style to be merged with [enabled],
  /// when events includes [WidgetEvent.disabled].
  SheetStyle outlined({
    Color? color,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Alignment? alignment,
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
    SheetStyle? selectedStyle,
    SheetStyle? indeterminateStyle,
    SheetStyle? errorStyle,
    SheetStyle? loadingStyle,
    SheetStyle? focusedStyle,
    SheetStyle? hoveredStyle,
    SheetStyle? pressedStyle,
    SheetStyle? draggedStyle,
    SheetStyle? disabledStyle = const SheetStyle(
      foregroundAlpha: SheetStyle.disabledForegroundAlpha,
      borderAlpha: SheetStyle.disabledBorderAlpha,
    ),
  }) {
    final style = SheetStyle.when(
      enabled: SheetStyle(
        borderColor: color,
        foregroundColor: color,
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: alignment,
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
      selected: selectedStyle,
      indeterminate: indeterminateStyle,
      error: errorStyle,
      loading: loadingStyle,
      focused: focusedStyle,
      hovered: hoveredStyle,
      pressed: pressedStyle,
      dragged: draggedStyle,
      disabled: disabledStyle,
    );

    return merge(style);
  }

  /// Creates a copy of this [SheetStyle] but with
  /// the given fields replaced with the new values.
  SheetStyle copyWith({
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Alignment? alignment,
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
    SheetStyle? selectedStyle,
    SheetStyle? indeterminateStyle,
    SheetStyle? errorStyle,
    SheetStyle? loadingStyle,
    SheetStyle? focusedStyle,
    SheetStyle? hoveredStyle,
    SheetStyle? pressedStyle,
    SheetStyle? draggedStyle,
    SheetStyle? disabledStyle,
  }) {
    final hasEvent = selectedStyle != null ||
        indeterminateStyle != null ||
        errorStyle != null ||
        loadingStyle != null ||
        focusedStyle != null ||
        hoveredStyle != null ||
        pressedStyle != null ||
        draggedStyle != null ||
        disabledStyle != null;
    final style = SheetStyle(
      width: width ?? this.width,
      height: height ?? this.height,
      margin: margin ?? this.margin,
      padding: padding ?? this.padding,
      alignment: alignment ?? this.alignment,
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
        ? SheetStyle.when(
            enabled: style,
            selected: selectedStyle,
            indeterminate: indeterminateStyle,
            error: errorStyle,
            loading: loadingStyle,
            focused: focusedStyle,
            hovered: hoveredStyle,
            pressed: pressedStyle,
            dragged: draggedStyle,
            disabled: disabledStyle,
          )
        : style;
  }

  /// Creates a copy of this [SheetStyle] but with
  /// the given fields replaced with the new values.
  SheetStyle merge(SheetStyle? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      width: other.width,
      height: other.height,
      margin: other.margin,
      padding: other.padding,
      alignment: other.alignment,
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
      selectedStyle: other is _SheetStyle
          ? SheetStyle.evaluate(other, {WidgetEvent.selected})
          : null,
      indeterminateStyle: other is _SheetStyle
          ? SheetStyle.evaluate(other, {WidgetEvent.indeterminate})
          : null,
      errorStyle: other is _SheetStyle
          ? SheetStyle.evaluate(other, {WidgetEvent.error})
          : null,
      loadingStyle: other is _SheetStyle
          ? SheetStyle.evaluate(other, {WidgetEvent.loading})
          : null,
      focusedStyle: other is _SheetStyle
          ? SheetStyle.evaluate(other, {WidgetEvent.focused})
          : null,
      hoveredStyle: other is _SheetStyle
          ? SheetStyle.evaluate(other, {WidgetEvent.hovered})
          : null,
      pressedStyle: other is _SheetStyle
          ? SheetStyle.evaluate(other, {WidgetEvent.pressed})
          : null,
      draggedStyle: other is _SheetStyle
          ? SheetStyle.evaluate(other, {WidgetEvent.dragged})
          : null,
      disabledStyle: other is _SheetStyle
          ? SheetStyle.evaluate(other, {WidgetEvent.disabled})
          : null,
    );
  }

  /// Linearly interpolate between two [SheetStyle] objects.
  static SheetStyle lerp(SheetStyle? a, SheetStyle? b, double t) {
    return SheetStyle(
      shape: lerpEnum(a?.shape, b?.shape, t),
      width: lerpDouble(a?.width, b?.width, t),
      height: lerpDouble(a?.height, b?.height, t),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      alignment: lerpEnum(a?.alignment, b?.alignment, t),
      clipBehavior: lerpEnum(a?.clipBehavior, b?.clipBehavior, t),
      overlayColor: Color.lerp(a?.overlayColor, b?.overlayColor, t),
      shadowColor: Color.lerp(a?.shadowColor, b?.overlayColor, t),
      elevation: lerpDouble(a?.elevation, b?.elevation, t),
      foregroundStyle:
          TextStyle.lerp(a?.foregroundStyle, b?.foregroundStyle, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
      foregroundOpacity:
          lerpDouble(a?.foregroundOpacity, b?.foregroundOpacity, t),
      foregroundAlpha: lerpInt(a?.foregroundAlpha, b?.foregroundAlpha, t),
      foregroundSpacing:
          lerpDouble(a?.foregroundSpacing, b?.foregroundSpacing, t),
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
    );
  }

  Map<String, dynamic> toMap() => {
        'shape': shape,
        'width': width,
        'height': height,
        'margin': margin,
        'padding': padding,
        'alignment': alignment,
        'clipBehavior': clipBehavior,
        'overlayColor': overlayColor,
        'shadowColor': shadowColor,
        'elevation': elevation,
        'foregroundStyle': foregroundStyle,
        'foregroundColor': foregroundColor,
        'foregroundOpacity': foregroundOpacity,
        'foregroundAlpha': foregroundAlpha,
        'foregroundSpacing': foregroundSpacing,
        'backgroundColor': backgroundColor,
        'backgroundOpacity': backgroundOpacity,
        'backgroundAlpha': backgroundAlpha,
        'borderColor': borderColor,
        'borderOpacity': borderOpacity,
        'borderAlpha': borderAlpha,
        'borderWidth': borderWidth,
        'borderRadius': borderRadius,
        'borderStyle': borderStyle,
        'iconColor': iconColor,
        'iconOpacity': iconOpacity,
        'iconSize': iconSize,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is SheetStyle && mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => Object.hashAll(toMap().values);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    toMap().entries.forEach((el) {
      properties.add(DiagnosticsProperty(el.key, el.value, defaultValue: null));
    });
  }

  // @override
  // bool operator ==(Object other) {
  //   if (other.runtimeType != runtimeType) return false;
  //   return other is SheetStyle &&
  //       other.shape == shape &&
  //       other.width == width &&
  //       other.height == height &&
  //       other.margin == margin &&
  //       other.padding == padding &&
  //       other.alignment == alignment &&
  //       other.clipBehavior == clipBehavior &&
  //       other.overlayColor == overlayColor &&
  //       other.shadowColor == shadowColor &&
  //       other.elevation == elevation &&
  //       other.foregroundStyle == foregroundStyle &&
  //       other.foregroundColor == foregroundColor &&
  //       other.foregroundOpacity == foregroundOpacity &&
  //       other.foregroundAlpha == foregroundAlpha &&
  //       other.foregroundSpacing == foregroundSpacing &&
  //       other.backgroundColor == backgroundColor &&
  //       other.backgroundOpacity == backgroundOpacity &&
  //       other.backgroundAlpha == backgroundAlpha &&
  //       other.borderColor == borderColor &&
  //       other.borderOpacity == borderOpacity &&
  //       other.borderAlpha == borderAlpha &&
  //       other.borderWidth == borderWidth &&
  //       other.borderRadius == borderRadius &&
  //       other.borderStyle == borderStyle &&
  //       other.iconColor == iconColor &&
  //       other.iconOpacity == iconOpacity &&
  //       other.iconSize == iconSize;
  // }

  // @override
  // int get hashCode => Object.hashAll([
  //       shape,
  //       width,
  //       height,
  //       padding,
  //       margin,
  //       alignment,
  //       clipBehavior,
  //       overlayColor,
  //       shadowColor,
  //       elevation,
  //       foregroundStyle,
  //       foregroundColor,
  //       foregroundOpacity,
  //       foregroundAlpha,
  //       foregroundSpacing,
  //       backgroundColor,
  //       backgroundOpacity,
  //       backgroundAlpha,
  //       borderColor,
  //       borderOpacity,
  //       borderAlpha,
  //       borderWidth,
  //       borderRadius,
  //       borderStyle,
  //       iconColor,
  //       iconOpacity,
  //       iconSize,
  //     ]);

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(DiagnosticsProperty('shape', shape, defaultValue: null));
  //   properties
  //       .add(DiagnosticsProperty<BoxShape>('shape', shape, defaultValue: null));
  //   properties.add(DoubleProperty('width', width, defaultValue: null));
  //   properties.add(DoubleProperty('height', height, defaultValue: null));
  //   properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding,
  //       defaultValue: null));
  //   properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin,
  //       defaultValue: null));
  //   properties.add(DiagnosticsProperty<Alignment>('alignment', alignment,
  //       defaultValue: null));
  //   properties.add(DiagnosticsProperty<Clip>('clipBehavior', clipBehavior,
  //       defaultValue: null));
  //   properties
  //       .add(ColorProperty('overlayColor', overlayColor, defaultValue: null));
  //   properties
  //       .add(ColorProperty('shadowColor', shadowColor, defaultValue: null));
  //   properties.add(DoubleProperty('elevation', elevation, defaultValue: null));
  //   properties.add(DiagnosticsProperty<TextStyle>(
  //       'foregroundStyle', foregroundStyle,
  //       defaultValue: null));
  //   properties.add(
  //       ColorProperty('foregroundColor', foregroundColor, defaultValue: null));
  //   properties.add(DoubleProperty('foregroundOpacity', foregroundOpacity,
  //       defaultValue: null));
  //   properties.add(
  //       IntProperty('foregroundAlpha', foregroundAlpha, defaultValue: null));
  //   properties.add(DoubleProperty('foregroundSpacing', foregroundSpacing,
  //       defaultValue: null));
  //   properties.add(
  //       ColorProperty('backgroundColor', backgroundColor, defaultValue: null));
  //   properties.add(DoubleProperty('backgroundOpacity', backgroundOpacity,
  //       defaultValue: null));
  //   properties.add(
  //       IntProperty('backgroundAlpha', backgroundAlpha, defaultValue: null));
  //   properties
  //       .add(ColorProperty('borderColor', borderColor, defaultValue: null));
  //   properties.add(
  //       DoubleProperty('borderOpacity', borderOpacity, defaultValue: null));
  //   properties.add(IntProperty('borderAlpha', borderAlpha, defaultValue: null));
  //   properties
  //       .add(DoubleProperty('borderWidth', borderOpacity, defaultValue: null));
  // }
}

class _SheetStyle extends SheetStyle implements DrivenProperty<SheetStyle?> {
  _SheetStyle(this._resolver) : super.from(_resolver({}));

  final DrivenPropertyResolver<SheetStyle?> _resolver;

  @override
  SheetStyle? resolve(Set<WidgetEvent> events) => _resolver(events);
}
