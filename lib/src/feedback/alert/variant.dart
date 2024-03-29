import 'style.dart';
import 'widget.dart';

class TonalAlert extends Alert {
  @override
  get variant => AlertVariant.tonal;

  const TonalAlert({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon,
    super.action,
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
  });

  const TonalAlert.danger({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.danger,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.danger();

  const TonalAlert.warning({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.warning,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.warning();

  const TonalAlert.success({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.success,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.success();

  const TonalAlert.info({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.info,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.info();
}

class FilledAlert extends Alert {
  @override
  get variant => AlertVariant.filled;

  const FilledAlert({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon,
    super.action,
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
  });

  const FilledAlert.danger({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.danger,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.danger();

  const FilledAlert.warning({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.warning,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.warning();

  const FilledAlert.success({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.success,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.success();

  const FilledAlert.info({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.info,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.info();
}

class OutlinedAlert extends Alert {
  @override
  get variant => AlertVariant.outlined;

  const OutlinedAlert({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon,
    super.action,
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
  });

  const OutlinedAlert.danger({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.danger,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.danger();

  const OutlinedAlert.warning({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.warning,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.warning();

  const OutlinedAlert.success({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.success,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.success();

  const OutlinedAlert.info({
    super.key,
    super.visible = true,
    super.onChanged,
    super.transitionBuilder = AlertTransition.crossFade,
    super.layoutBuilder = AlertLayout.defaults,
    super.title,
    super.message,
    super.icon = AlertIcons.info,
    super.action,
    super.margin,
    super.padding,
    super.spacing,
    super.elevation,
    super.borderRadius,
    super.iconSize,
    super.style,
    super.curve,
    super.duration,
  }) : super.info();
}
