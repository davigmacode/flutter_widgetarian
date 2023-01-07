import 'package:flutter/material.dart' hide ListTile, ListTileStyle;

import 'package:widgetarian/layout.dart';
import 'package:widgetarian/choice.dart';
import 'routes.dart';

class PageMenu extends StatelessWidget {
  const PageMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Choice(
      builder: (context, state, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: menu.entries.length,
          itemBuilder: (context, i) {
            final menuEntry = menu.entries.elementAt(i);
            final menuPath = menuEntry.key;
            final menuData = menuEntry.value;

            if (menuData is MenuLeaf) {
              return ListTile(
                title: Text(menuData.name),
                style: const ListTileStyle(
                  margin: EdgeInsets.symmetric(
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
                    margin: EdgeInsets.symmetric(
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
                      margin: EdgeInsets.symmetric(
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
    );
  }
}
