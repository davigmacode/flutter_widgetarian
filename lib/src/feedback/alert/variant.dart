import 'package:flutter/widgets.dart';
import 'style.dart';
import 'widget.dart';

class TonalAlert extends Alert {
  const TonalAlert({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon,
    super.action,
    super.variant,
    super.severity,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(key: key);

  const TonalAlert.danger({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe237, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.danger,
        );

  const TonalAlert.warning({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe6cb, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.warning,
        );

  const TonalAlert.success({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe159, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.success,
        );

  const TonalAlert.info({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe33c, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.info,
        );

  @override
  AlertStyle get effectiveStyle {
    return const AlertStyle.tonal().merge(style).copyWith(
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
}

class FilledAlert extends Alert {
  const FilledAlert({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon,
    super.action,
    super.variant,
    super.severity,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(key: key);

  const FilledAlert.danger({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe237, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.danger,
        );

  const FilledAlert.warning({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe6cb, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.warning,
        );

  const FilledAlert.success({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe159, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.success,
        );

  const FilledAlert.info({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe33c, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.info,
        );

  @override
  AlertStyle get effectiveStyle {
    return const AlertStyle.filled().merge(style).copyWith(
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
}

class OutlinedAlert extends Alert {
  const OutlinedAlert({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon,
    super.action,
    super.variant,
    super.severity,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(key: key);

  const OutlinedAlert.danger({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe237, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.danger,
        );

  const OutlinedAlert.warning({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe6cb, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.warning,
        );

  const OutlinedAlert.success({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe159, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.success,
        );

  const OutlinedAlert.info({
    Key? key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = const Icon(IconData(0xe33c, fontFamily: 'MaterialIcons')),
    super.action,
    super.variant,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super(
          key: key,
          severity: AlertSeverity.info,
        );

  @override
  AlertStyle get effectiveStyle {
    return const AlertStyle.outlined().merge(style).copyWith(
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
}
