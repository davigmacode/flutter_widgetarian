import 'package:flutter/widgets.dart';
import 'package:widgetarian/layout.dart';
import 'style.dart';
import 'theme.dart';

typedef AlertTransitionBuilder = ExpansionTransitionBuilder;
typedef AlertLayoutBuilder = ExpansionLayoutBuilder;
typedef AlertTransition = ExpansionTransition;
typedef AlertLayout = ExpansionLayout;
typedef AlertButton = ExpansionButton;
typedef AlertButtonStyle = ExpansionButtonStyle;
typedef AlertButtonCallback = ExpansionButtonCallback;
typedef AlertButtonAction = ExpansionButtonAction;
typedef AlertClose = ExpansionCollapse;

/// Attract user attention with important static message
class Alert extends StatelessWidget {
  /// {@template widgetarian.alert.collapsed}
  /// Whether or not this alert is visible.
  ///
  /// Must not be null. Defaults to true.
  /// {@endtemplate}
  final bool visible;

  /// {@template widgetarian.alert.onChanged}
  /// Called when the alert should change
  /// between visible and hidden states.
  ///
  /// The callback provided to [onChanged] should update the state of the
  /// parent [StatefulWidget] using the [State.setState] method, so that the
  /// parent gets rebuilt.
  ///
  /// {@tool snippet}
  ///
  /// A [StatefulWidget] that illustrates use of onSelected in an [Alert].
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
  ///   bool _visible = true;
  ///
  ///   @override
  ///   Widget build(BuildContext context) {
  ///     return Alert(
  ///       title: const Text('Use Chisel'),
  ///       visible: _visible,
  ///       onChanged: (bool newValue) {
  ///         setState(() {
  ///           _visible = newValue;
  ///         });
  ///       },
  ///     );
  ///   }
  /// }
  /// ```
  /// {@end-tool}
  /// {@endtemplate}
  final ValueChanged<bool>? onChanged;

  /// {@template widgetarian.alert.transitionBuilder}
  /// A function that wraps a new [content] with an animation that transitions the [content] in when the animation runs in the forward direction and out when the animation runs in the reverse direction. This is only called when a new [content] is set (not for each build), or when a new [transitionBuilder] is set. If a new [transitionBuilder] is set, then the transition is rebuilt for the current content and all previous children using the new [transitionBuilder]. The function must not return null.
  /// {@endtemplate}
  final AlertTransitionBuilder? transitionBuilder;

  /// {@template widgetarian.alert.layoutBuilder}
  /// A function that wraps all of the children that are transitioning out, and the [child] that's transitioning in, with a widget that lays all of them out. This is called every time this widget is built. The function must not return null.
  /// {@endtemplate}
  final AlertLayoutBuilder layoutBuilder;

  /// {@template widgetarian.alert.title}
  /// The primary content of the [Alert].
  ///
  /// Typically a [Text] widget.
  /// {@endtemplate}
  final Widget? title;

  /// {@template widgetarian.alert.message}
  /// The text to display below the [title]
  /// {@endtemplate}
  final Widget? message;

  /// {@template widgetarian.alert.icon}
  /// Icon displayed prior to [title]
  /// {@endtemplate}
  final Widget? icon;

  /// {@template widgetarian.alert.action}
  /// Widget displayed next to [title]
  /// {@endtemplate}
  final Widget? action;

  /// {@template widgetarian.alert.variant}
  /// Type of the alert variant
  /// {@endtemplate}
  final AlertVariant? variant;

  /// {@template widgetarian.alert.severity}
  /// Type of the alert severity
  /// {@endtemplate}
  final AlertSeverity? severity;

  /// {@template widgetarian.alert.margin}
  /// Empty space to surround the outside alert.
  /// {@endtemplate}
  final EdgeInsetsGeometry? margin;

  /// {@template widgetarian.alert.padding}
  /// The padding between the contents of the alert and the outside alert.
  /// {@endtemplate}
  final EdgeInsetsGeometry? padding;

  /// {@template widgetarian.alert.spacing}
  /// How much space to place between alert's foreground widget in a run in the main axis.
  /// {@endtemplate}
  final double? spacing;

  /// {@template widgetarian.alert.elevation}
  /// The alert's z-coordinate relative to
  /// the parent at which to place this physical object.
  ///
  /// The value is non-negative.
  /// {@endtemplate}
  final double? elevation;

  /// {@template widgetarian.alert.borderRadius}
  /// The radii for each corner of the alert's border.
  /// {@endtemplate}
  final BorderRadius? borderRadius;

  /// {@template widgetarian.alert.iconSize}
  /// The size of the icon's inside the alert, in logical pixels.
  /// {@endtemplate}
  final double? iconSize;

  /// {@template widgetarian.alert.style}
  /// The style to be applied to the alert.
  /// {@endtemplate}
  final AlertStyle? style;

  /// {@template widgetarian.alert.curve}
  /// The curve to apply when animating the parameters of this widget.
  /// {@endtemplate}
  final Curve? curve;

  /// {@template widgetarian.alert.duration}
  /// The duration over which to animate the parameters of this widget.
  /// {@endtemplate}
  final Duration? duration;

  const Alert({
    Key? key,
    this.visible = true,
    this.onChanged,
    this.transitionBuilder = AlertTransition.crossFade,
    this.layoutBuilder = AlertLayout.defaults,
    this.title,
    this.message,
    this.icon,
    this.action,
    this.variant,
    this.severity,
    this.margin,
    this.padding,
    this.spacing,
    this.elevation,
    this.borderRadius,
    this.iconSize,
    this.style,
    this.curve,
    this.duration,
  }) : super(key: key);

  const Alert.danger({
    Key? key,
    this.visible = true,
    this.onChanged,
    this.transitionBuilder = AlertTransition.crossFade,
    this.layoutBuilder = AlertLayout.defaults,
    this.title,
    this.message,
    this.icon = const Icon(IconData(0xe237, fontFamily: 'MaterialIcons')),
    this.action,
    this.variant,
    this.margin,
    this.padding,
    this.spacing,
    this.elevation,
    this.borderRadius,
    this.iconSize,
    this.style,
    this.curve,
    this.duration,
  })  : severity = AlertSeverity.danger,
        super(key: key);

  const Alert.warning({
    Key? key,
    this.visible = true,
    this.onChanged,
    this.transitionBuilder = AlertTransition.crossFade,
    this.layoutBuilder = AlertLayout.defaults,
    this.title,
    this.message,
    this.icon = const Icon(IconData(0xe6cb, fontFamily: 'MaterialIcons')),
    this.action,
    this.variant,
    this.margin,
    this.padding,
    this.spacing,
    this.elevation,
    this.borderRadius,
    this.iconSize,
    this.style,
    this.curve,
    this.duration,
  })  : severity = AlertSeverity.warning,
        super(key: key);

  const Alert.success({
    Key? key,
    this.visible = true,
    this.onChanged,
    this.transitionBuilder = AlertTransition.crossFade,
    this.layoutBuilder = AlertLayout.defaults,
    this.title,
    this.message,
    this.icon = const Icon(IconData(0xe159, fontFamily: 'MaterialIcons')),
    this.action,
    this.variant,
    this.margin,
    this.padding,
    this.spacing,
    this.elevation,
    this.borderRadius,
    this.iconSize,
    this.style,
    this.curve,
    this.duration,
  })  : severity = AlertSeverity.success,
        super(key: key);

  const Alert.info({
    Key? key,
    this.visible = true,
    this.onChanged,
    this.transitionBuilder = AlertTransition.crossFade,
    this.layoutBuilder = AlertLayout.defaults,
    this.title,
    this.message,
    this.icon = const Icon(IconData(0xe33c, fontFamily: 'MaterialIcons')),
    this.action,
    this.variant,
    this.margin,
    this.padding,
    this.spacing,
    this.elevation,
    this.borderRadius,
    this.iconSize,
    this.style,
    this.curve,
    this.duration,
  })  : severity = AlertSeverity.info,
        super(key: key);

  AlertStyle get effectiveStyle {
    return AlertStyle.from(style).copyWith(
      variant: variant,
      severity: severity,
      margin: margin,
      padding: padding,
      foregroundSpacing: spacing,
      elevation: elevation,
      borderRadius: borderRadius,
      iconSize: iconSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    final alertTheme = AlertTheme.of(context);
    final alertStyle = alertTheme.style.merge(effectiveStyle);
    final alertCurve = curve ?? alertTheme.curve;
    final alertDuration = duration ?? alertTheme.duration;
    return Expansion(
      value: visible,
      onChanged: onChanged,
      transitionBuilder: transitionBuilder,
      layoutBuilder: layoutBuilder,
      child: Sheet(
        curve: alertCurve,
        duration: alertDuration,
        style: alertStyle,
        child: AnimatedListTileTheme(
          curve: alertCurve,
          duration: alertDuration,
          style: ListTileStyle(
            childExpanded: alertStyle.foregroundExpanded,
            crossAxisAlignment: alertStyle.foregroundAlign,
            mainAxisAlignment: alertStyle.foregroundJustify,
            mainAxisExpanded: alertStyle.width == double.infinity,
            spacing: alertStyle.foregroundSpacing,
            spacingEnforced: alertStyle.foregroundLoosen,
          ),
          child: ListTile(
            leading: icon,
            trailing: action,
            title: title,
            subtitle: message,
          ),
        ),
      ),
    );
  }
}
