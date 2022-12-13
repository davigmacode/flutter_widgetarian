import 'package:flutter/widgets.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/choice.dart';

class MenuItem {
  final String name;
  final Widget? trailing;
  final double spacing;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  MenuItem({
    required this.name,
    this.trailing,
    this.spacing = 0.0,
    this.padding,
    this.onPressed,
  });
}

class MenuLeaf extends MenuItem {
  final WidgetBuilder builder;

  MenuLeaf({
    required super.name,
    required this.builder,
    super.trailing,
    super.spacing,
    super.padding,
    super.onPressed,
  });
}

class MenuNest extends MenuItem {
  final Map<String, MenuItem> items;

  MenuNest({
    required super.name,
    required this.items,
    super.trailing = const ExpansionIcon(),
    super.spacing,
    super.padding,
    super.onPressed,
  });
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
    required this.items,
    this.shrinkWrap = true,
  }) : super(key: key);

  final Map<String, MenuItem> items;
  final bool shrinkWrap;

  Map<String, WidgetBuilder> _getRoutes(Map<String, MenuItem> menu) {
    Map<String, WidgetBuilder> routes = {};
    menu.forEach((key, value) {
      if (value is MenuLeaf) routes[key] = value.builder;
      if (value is MenuNest) routes.addAll(_getRoutes(value.items));
    });
    return routes;
  }

  Map<String, WidgetBuilder> get routes {
    return _getRoutes(items);
  }

  @override
  Widget build(BuildContext context) {
    return Choice(
      builder: (context, state, child) {
        return ListView.builder(
          shrinkWrap: shrinkWrap,
          itemCount: items.entries.length,
          itemBuilder: (context, i) {
            final menuEntry = items.entries.elementAt(i);
            final menuPath = menuEntry.key;
            final menuData = menuEntry.value;

            void defaultOnPressed() {
              Navigator.pushReplacementNamed(context, menuPath);
            }

            if (menuData is MenuNest) {
              final menuItems = menuData.items;
              return Expansion(
                value: state.has(menuPath),
                onChanged: state.select(menuPath),
                header: ExpansionConsumer(builder: (context, state, _) {
                  return ListTile(
                    title: Text(menuData.name),
                    trailing: menuData.trailing,
                    style: ListTileStyle(
                      spacing: menuData.spacing,
                      margin: menuData.padding,
                    ),
                    onTap: () {
                      state.toggle();
                      menuData.onPressed?.call();
                    },
                  );
                }),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: menuItems.length,
                  itemBuilder: (context, i) {
                    final menuEntry = menuItems.entries.elementAt(i);
                    final menuPath = menuEntry.key;
                    final menuData = menuEntry.value;
                    return ListTile(
                      title: Text(menuData.name),
                      trailing: menuData.trailing,
                      style: ListTileStyle(
                        spacing: menuData.spacing,
                        margin: menuData.padding,
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, menuPath);
                      },
                    );
                  },
                ),
              );
            }

            return ListTile(
              title: Text(menuData.name),
              trailing: menuData.trailing,
              style: ListTileStyle(
                spacing: menuData.spacing,
                margin: menuData.padding,
              ),
              onTap: menuData.onPressed ?? defaultOnPressed,
            );
          },
        );
      },
    );
  }
}
