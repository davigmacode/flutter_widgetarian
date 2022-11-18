import 'package:flutter/material.dart';
import 'package:widgetarian/theme.dart';
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
        child: ListView.builder(
          itemCount: routesMenu.entries.length,
          itemBuilder: (context, i) {
            final menuItem = routesMenu.entries.elementAt(i);
            return ListTile(
              title: Text(menuItem.value),
              onTap: () {
                Navigator.pushReplacementNamed(context, menuItem.key);
              },
            );
          },
        ),
      ),
      body: body,
    );
  }
}
