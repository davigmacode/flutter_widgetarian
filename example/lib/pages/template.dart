import 'package:flutter/material.dart' hide TextButton, ButtonStyle;
import 'package:widgetarian/theme.dart';
import 'package:widgetarian/button.dart';
import 'menu.dart';

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
    return ThemeConsumer(builder: ((context, theme) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            TextButton(
              enabledStyle: const ButtonStyle(
                foregroundColor: Colors.white,
                borderRadius: BorderRadius.zero,
              ),
              onPressed: () => ThemeProvider.of(context).selectNext(),
              child: Text('${theme.description}'),
            ),
            TextButton.icon(
              enabledStyle: const ButtonStyle(
                foregroundColor: Colors.white,
              ),
              onPressed: () => theme.toggleMode(),
              child: Icon(theme.modeIcon),
            ),
          ],
        ),
        drawer: const Drawer(child: PageMenu()),
        body: body,
      );
    }));
  }
}
