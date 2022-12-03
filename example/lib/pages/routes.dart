import 'package:flutter/widgets.dart';

import 'input/checkbox/main.dart';
import 'input/radio/main.dart';
import 'input/switch/main.dart';
import 'button/main.dart';
import 'display/avatar/main.dart';
import 'display/chip/main.dart';
import 'display/spoiler/main.dart';
import 'feedback/checkmark.dart';
import 'feedback/alert/main.dart';
import 'feedback/toggle_icon/main.dart';
import 'choice/basic/main.dart';
import 'layout/tile.dart';
import 'layout/expansion/main.dart';
import 'layout/sheet/main.dart';
import 'typography/main.dart';
import 'text/main.dart';
import 'home.dart';

final Map<String, MenuItem> menu = {
  '/': MenuLeaf(
    name: 'Home',
    builder: (context) => const HomePage(
      title: 'Widgetarian',
    ),
  ),
  '/button': MenuLeaf(
    name: 'Button',
    builder: (context) => const ButtonPage(
      title: 'Widgetarian Button',
    ),
  ),
  '/input': MenuNest(
    name: 'Input',
    items: {
      '/input/checkbox': MenuLeaf(
        name: 'Checkbox',
        builder: (context) => const CheckboxPage(
          title: 'Widgetarian Checkbox',
        ),
      ),
      '/input/radio': MenuLeaf(
        name: 'Radio',
        builder: (context) => const RadioPage(
          title: 'Widgetarian Radio',
        ),
      ),
      '/input/switch': MenuLeaf(
        name: 'Switch',
        builder: (context) => const SwitchPage(
          title: 'Widgetarian Switch',
        ),
      ),
    },
  ),
  '/display': MenuNest(
    name: 'Display',
    items: {
      '/display/avatar': MenuLeaf(
        name: 'Avatar',
        builder: (context) => const AvatarPage(
          title: 'Widgetarian Avatar',
        ),
      ),
      '/display/badge': MenuLeaf(
        name: 'Badge',
        builder: (context) => const AvatarPage(
          title: 'Widgetarian Badge',
        ),
      ),
      '/display/chip': MenuLeaf(
        name: 'Chip',
        builder: (context) => const ChipPage(
          title: 'Widgetarian Chip',
        ),
      ),
      '/display/divider': MenuLeaf(
        name: 'Divider',
        builder: (context) => const ChipPage(
          title: 'Widgetarian Divider',
        ),
      ),
      '/display/spoiler': MenuLeaf(
        name: 'Spoiler',
        builder: (context) => const SpoilerPage(
          title: 'Widgetarian Spoiler',
        ),
      ),
    },
  ),
  '/choice': MenuNest(
    name: 'Choice',
    items: {
      '/choice/basic': MenuLeaf(
        name: 'Basic',
        builder: (context) => const ChoiceBasicPage(
          title: 'Widgetarian Choice Basic',
        ),
      ),
    },
  ),
  '/navigation': MenuNest(
    name: 'Navigation',
    items: {
      '/navigation/anchor': MenuLeaf(
        name: 'Anchor',
        builder: (context) => const ChoiceBasicPage(
          title: 'Widgetarian Anchor',
        ),
      ),
      '/navigation/menu': MenuLeaf(
        name: 'Menu',
        builder: (context) => const ChoiceBasicPage(
          title: 'Widgetarian Menu',
        ),
      ),
    },
  ),
  '/feedback': MenuNest(
    name: 'Feedback',
    items: {
      '/feedback/marks': MenuLeaf(
        name: 'Marks',
        builder: (context) => const CheckmarkPage(
          title: 'Widgetarian Marks',
        ),
      ),
      '/feedback/alert': MenuLeaf(
        name: 'Alert',
        builder: (context) => const AlertPage(
          title: 'Widgetarian Alert',
        ),
      ),
      '/feedback/skeleton': MenuLeaf(
        name: 'Skeleton',
        builder: (context) => const AlertPage(
          title: 'Widgetarian Skeleton',
        ),
      ),
      '/feedback/toggle-icon': MenuLeaf(
        name: 'Toggle Icon',
        builder: (context) => const ToggleIconPage(
          title: 'Widgetarian Toggle Icon',
        ),
      ),
    },
  ),
  '/layout': MenuNest(
    name: 'Layout',
    items: {
      '/layout/tile': MenuLeaf(
        name: 'Tile',
        builder: (context) => const TilePage(
          title: 'Widgetarian Tile',
        ),
      ),
      '/layout/expansion': MenuLeaf(
        name: 'Expansion',
        builder: (context) => const ExpansionPage(
          title: 'Widgetarian Expansion',
        ),
      ),
      '/layout/overlay': MenuLeaf(
        name: 'Overlay',
        builder: (context) => const ExpansionPage(
          title: 'Widgetarian Overlay',
        ),
      ),
      '/layout/overlaid': MenuLeaf(
        name: 'Overlaid',
        builder: (context) => const ExpansionPage(
          title: 'Widgetarian Overlaid',
        ),
      ),
      '/layout/gap': MenuLeaf(
        name: 'Gap',
        builder: (context) => const ExpansionPage(
          title: 'Widgetarian Gap',
        ),
      ),
      '/layout/sheet': MenuLeaf(
        name: 'Sheet',
        builder: (context) => const SheetPage(
          title: 'Widgetarian Sheet',
        ),
      ),
    },
  ),
  '/typography': MenuLeaf(
    name: 'Typography',
    builder: (context) => const TypographyPage(
      title: 'Widgetarian Typography',
    ),
  ),
  '/text': MenuLeaf(
    name: 'Text',
    builder: (context) => const TextPage(
      title: 'Widgetarian Text',
    ),
  ),
};

final routes = _getRoutes(menu);

Map<String, WidgetBuilder> _getRoutes(Map<String, MenuItem> menu) {
  Map<String, WidgetBuilder> routes = {};
  menu.forEach((key, value) {
    if (value is MenuLeaf) routes[key] = value.builder;
    if (value is MenuNest) routes.addAll(_getRoutes(value.items));
  });
  return routes;
}

class MenuItem {
  final String name;

  MenuItem(this.name);
}

class MenuLeaf extends MenuItem {
  final WidgetBuilder builder;

  MenuLeaf({
    required String name,
    required this.builder,
  }) : super(name);
}

class MenuNest extends MenuItem {
  final Map<String, MenuItem> items;

  MenuNest({
    required String name,
    required this.items,
  }) : super(name);
}
