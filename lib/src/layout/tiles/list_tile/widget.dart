import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/anchor.dart';
import '../tile/widget.dart';
import '../text_tile/widget.dart';
import 'style.dart';
import 'theme.dart';

class ListTile extends StatelessWidget {
  const ListTile({
    Key? key,
    this.margin,
    this.spacing,
    this.spacingEnforced,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.mainAxisExpanded,
    this.childExpanded,
    this.style,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.subtitle,
    this.title,
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
  final bool? childExpanded;
  final ListTileStyle? style;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  ListTileStyle get effectiveStyle {
    return ListTileStyle.from(style).copyWith(
      margin: margin,
      spacing: spacing,
      spacingEnforced: spacingEnforced,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisExpanded: mainAxisExpanded,
      childExpanded: childExpanded,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themedStyle = ListTileTheme.of(context).style.merge(effectiveStyle);
    Widget content = Tile(
      direction: Axis.horizontal,
      margin: themedStyle.margin,
      spacing: themedStyle.spacing,
      spacingEnforced: themedStyle.spacingEnforced,
      crossAxisAlignment: themedStyle.crossAxisAlignment,
      mainAxisAlignment: themedStyle.mainAxisAlignment,
      mainAxisExpanded: themedStyle.mainAxisExpanded,
      childExpanded: themedStyle.childExpanded,
      leading: leading,
      trailing: trailing,
      child: TextTile(
        title: title,
        subtitle: subtitle,
        align: themedStyle.textAlign,
        margin: themedStyle.textMargin,
        spacing: themedStyle.textSpacing,
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    effectiveStyle.debugFillProperties(properties);
  }
}
