import 'package:flutter/widgets.dart';
import 'package:widgetarian/anchor.dart';

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.child,
    this.leading,
    this.trailing,
    this.direction = Axis.horizontal,
    this.alignItems = CrossAxisAlignment.center,
    this.spacing = 0.0,
    this.expanded = false,
    this.forceSpacing = true,
  }) : super(key: key);

  final Widget child;
  final Widget? leading;
  final Widget? trailing;
  final Axis direction;
  final CrossAxisAlignment alignItems;
  final double spacing;
  final bool expanded;
  final bool forceSpacing;

  bool get isHorizontal => direction == Axis.horizontal;
  bool get isVertical => !isHorizontal;

  bool get hasLeading => leading != null;
  bool get hasTrailing => trailing != null;

  @override
  Widget build(BuildContext context) {
    final spacingX = isHorizontal ? spacing : 0.0;
    final spacingY = isVertical ? spacing : 0.0;

    if (!hasLeading && !hasTrailing) {
      final content = UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        child: child,
      );
      if (forceSpacing) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: spacingX,
            vertical: spacingY,
          ),
          child: content,
        );
      }
      return content;
    }

    final spacer = SizedBox(width: spacingX, height: spacingY);
    return Flex(
      direction: direction,
      crossAxisAlignment: alignItems,
      mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
      children: [
        leading,
        if (hasLeading || forceSpacing) spacer,
        expanded ? Expanded(child: child) : child,
        if (hasTrailing || forceSpacing) spacer,
        trailing,
      ].whereType<Widget>().toList(growable: false),
    );
  }
}

//---------------------------------------------------------------

class TextTile extends StatelessWidget {
  const TextTile({
    Key? key,
    this.title,
    this.subtitle,
    this.spacing = 0.0,
  }) : super(key: key);

  final Widget? title;
  final Widget? subtitle;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Tile(
      direction: Axis.vertical,
      alignItems: CrossAxisAlignment.start,
      spacing: spacing,
      forceSpacing: false,
      trailing: subtitle,
      child: Container(child: title),
    );
  }
}

//---------------------------------------------------------------

class ListTileStyle {
  const ListTileStyle({
    this.padding,
    this.spacing = 0.0,
    this.alignItems = CrossAxisAlignment.center,
  });

  final double spacing;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment alignItems;
}

class ListTile extends StatelessWidget {
  const ListTile({
    Key? key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.style,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final ListTileStyle? style;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final evaluatedStyle = style ?? const ListTileStyle();

    final content = Tile(
      leading: leading,
      trailing: trailing,
      spacing: evaluatedStyle.spacing,
      alignItems: evaluatedStyle.alignItems,
      expanded: true,
      child: TextTile(
        title: title,
        subtitle: subtitle,
      ),
    );

    if (evaluatedStyle.padding != null) {
      return Padding(
        padding: evaluatedStyle.padding!,
        child: content,
      );
    }

    if (onTap != null || onLongPress != null) {
      return Anchor(
        onTap: onTap,
        onLongPress: onLongPress,
        child: content,
      );
    }

    return content;
  }
}
