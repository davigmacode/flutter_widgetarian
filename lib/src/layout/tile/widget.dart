import 'package:flutter/widgets.dart';
import 'package:widgetarian/anchor.dart';
import '../gap.dart';
import 'style.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    this.direction,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisExpanded,
    this.spacingEnforced,
    this.spacing,
    this.margin,
    this.trailing,
    this.leading,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final Axis? direction;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? mainAxisExpanded;
  final bool? spacingEnforced;
  final double? spacing;
  final EdgeInsetsGeometry? margin;

  bool get isHorizontal => direction == Axis.horizontal;
  bool get isVertical => !isHorizontal;

  bool get isMainAxisExpanded => mainAxisExpanded ?? false;
  bool get isSpacingEnforced => spacingEnforced ?? true;

  bool get hasLeading => leading != null;
  bool get hasTrailing => trailing != null;

  @override
  Widget build(BuildContext context) {
    final spacer = Gap(spacing ?? 0.0);
    Widget content = Flex(
      direction: direction ?? Axis.horizontal,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: isMainAxisExpanded ? MainAxisSize.max : MainAxisSize.min,
      children: [
        leading,
        if (hasLeading || isSpacingEnforced) spacer,
        isMainAxisExpanded ? Expanded(child: child) : child,
        if (hasTrailing || isSpacingEnforced) spacer,
        trailing,
      ].whereType<Widget>().toList(growable: false),
    );

    if (margin != null) {
      content = Padding(
        padding: margin!,
        child: content,
      );
    }

    return content;
  }
}

//---------------------------------------------------------------

class TextTile extends StatelessWidget {
  const TextTile({
    Key? key,
    this.title,
    this.subtitle,
    this.spacing,
  }) : super(key: key);

  final Widget? title;
  final Widget? subtitle;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return Tile(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacingEnforced: false,
      spacing: spacing,
      trailing: subtitle,
      child: Container(child: title),
    );
  }
}

//---------------------------------------------------------------

class ListTile extends StatelessWidget {
  const ListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.margin,
    this.spacing,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisExpanded,
    this.style,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final double? spacing;
  final bool? spacingEnforced;
  final EdgeInsetsGeometry? margin;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final bool? mainAxisExpanded;
  final ListTileStyle? style;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  ListTileStyle get effectiveStyle {
    return const ListTileStyle.fallback().merge(style).copyWith(
          margin: margin,
          spacing: spacing,
          spacingEnforced: spacingEnforced,
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisExpanded: mainAxisExpanded,
        );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Tile(
      margin: effectiveStyle.margin,
      spacing: effectiveStyle.spacing,
      spacingEnforced: effectiveStyle.spacingEnforced,
      crossAxisAlignment: effectiveStyle.crossAxisAlignment,
      mainAxisAlignment: effectiveStyle.mainAxisAlignment,
      mainAxisExpanded: effectiveStyle.mainAxisExpanded,
      leading: leading,
      trailing: trailing,
      child: TextTile(
        title: title,
        subtitle: subtitle,
      ),
    );

    if (onTap != null || onLongPress != null) {
      content = Anchor(
        onTap: onTap,
        onLongPress: onLongPress,
        child: content,
      );
    }

    return content;
  }
}
