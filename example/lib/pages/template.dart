import 'package:flutter/material.dart' hide ListTile, ListTileStyle;
import 'package:widgetarian/choice.dart';
import 'package:widgetarian/theme.dart';
import 'package:widgetarian/layout.dart';
import 'routes.dart';

class PageTemplate extends StatelessWidget {
  const PageTemplate({
    Key? key,
    required this.title,
    this.body,
  }) : super(key: key);

  final String title;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          ThemeConsumer(builder: ((context, theme) {
            return IconButton(
              onPressed: () => theme.toggleMode(),
              icon: Icon(theme.modeIcon),
            );
          })),
        ],
      ),
      drawer: Drawer(
        child: Choice(
          builder: (context, state, child) {
            return ListView.builder(
              itemCount: menu.entries.length,
              itemBuilder: (context, i) {
                final menuEntry = menu.entries.elementAt(i);
                final menuPath = menuEntry.key;
                final menuData = menuEntry.value;

                if (menuData is MenuLeaf) {
                  return ListTile(
                    title: Text(menuData.name),
                    style: const ListTileStyle(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, menuPath);
                    },
                  );
                }

                final menuItems = (menuData as MenuNest).items;
                return Expansion(
                  value: state.has(menuPath),
                  onChanged: state.select(menuPath),
                  header: ExpansionConsumer(builder: (context, state, _) {
                    return ListTile(
                      onTap: state.toggle,
                      style: const ListTileStyle(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      trailing: const ExpansionIcon(),
                      title: Text(menuData.name),
                    );
                  }),
                  child: ListView.builder(
                    shrinkWrap: true,
                    // padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    itemCount: menuItems.length,
                    itemBuilder: (context, i) {
                      final menuEntry = menuItems.entries.elementAt(i);
                      final menuPath = menuEntry.key;
                      final menuData = menuEntry.value;
                      return ListTile(
                        title: Text(menuData.name),
                        leading: const Icon(Icons.call_missed_outgoing),
                        style: const ListTileStyle(
                          spacing: 15,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, menuPath);
                        },
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      body: body,
    );
  }
}
