import 'package:flutter/widgets.dart';

import 'input/checkbox/main.dart';
import 'input/radio/main.dart';
import 'input/switch/main.dart';
import 'button/main.dart';
import 'display/avatar/main.dart';
import 'display/chip/main.dart';
import 'feedback/checkmark.dart';
import 'layout/tile.dart';
import 'layout/expansion.dart';
import 'typography/main.dart';
import 'home.dart';

final routes = {
  '/': RouteItem(
    name: 'Home',
    builder: (context) => const HomePage(
      title: 'Widgetarian',
    ),
  ),
  '/button': RouteItem(
    name: 'Button',
    builder: (context) => const ButtonPage(
      title: 'Widgetarian Button',
    ),
  ),
  '/input/checkbox': RouteItem(
    name: 'Checkbox',
    builder: (context) => const CheckboxPage(
      title: 'Widgetarian Checkbox',
    ),
  ),
  '/input/radio': RouteItem(
    name: 'Radio',
    builder: (context) => const RadioPage(
      title: 'Widgetarian Radio',
    ),
  ),
  '/input/switch': RouteItem(
    name: 'Switch',
    builder: (context) => const SwitchPage(
      title: 'Widgetarian Switch',
    ),
  ),
  '/display/avatar': RouteItem(
    name: 'Avatar',
    builder: (context) => const AvatarPage(
      title: 'Widgetarian Avatar',
    ),
  ),
  '/display/chip': RouteItem(
    name: 'Chip',
    builder: (context) => const ChipPage(
      title: 'Widgetarian Chip',
    ),
  ),
  '/feedback/checkmark': RouteItem(
    name: 'Checkmark',
    builder: (context) => const CheckmarkPage(
      title: 'Widgetarian Checkmark',
    ),
  ),
  '/layout/tile': RouteItem(
    name: 'Tile',
    builder: (context) => const TilePage(
      title: 'Widgetarian Tile',
    ),
  ),
  '/layout/expansion': RouteItem(
    name: 'Expansion',
    builder: (context) => const ExpansionPage(
      title: 'Widgetarian Expansion',
    ),
  ),
  '/typography': RouteItem(
    name: 'Typography',
    builder: (context) => const TypographyPage(
      title: 'Widgetarian Typography',
    ),
  ),
};

final routesMenu = routes.map((key, value) => MapEntry(key, value.name));
final routesPage = routes.map((key, value) => MapEntry(key, value.builder));

class RouteItem {
  final String name;
  final WidgetBuilder builder;

  RouteItem({
    required this.name,
    required this.builder,
  });
}
