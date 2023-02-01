import 'dart:developer';
import 'package:flutter/material.dart'
    hide
        ButtonThemeData,
        ChipThemeData,
        CheckboxThemeData,
        RadioThemeData,
        SwitchThemeData;
import 'package:widgetarian/theme.dart';
import 'pages/routes.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider.builder(
      controller: ThemeController(
        onAvailableChanged: (_) => log('available themes changed'),
        onThemeChanged: (theme) => log('theme changed to ${theme.selected}'),
        onModeChanged: (theme) =>
            log('theme mode changed to ${theme.mode.name}'),
        onColorChanged: (theme) =>
            log('theme color changed to ${theme.color.toString()}'),
        onChanged: (theme) => log('value changed'),
        themes: {
          'm2': ThemeConfig.fromColor(
            Colors.blue,
            description: 'Material 2',
            extensionBuilder: ThemePreset.m2,
          ),
          'm3': ThemeConfig.fromColor(
            Colors.purple,
            description: 'Material 3',
            extensionBuilder: ThemePreset.m3,
          ),
          'ios': ThemeConfig.fromColor(
            Colors.pink,
            description: 'IOS',
            extensionBuilder: ThemePreset.ios,
          ),
        },
        extensionBuilder: ThemePreset.m2,
      ),
      builder: (context, theme) {
        return MaterialApp(
          title: 'Widgetarian',
          theme: theme.lightData,
          darkTheme: theme.darkData,
          themeMode: theme.mode,
          initialRoute: '/',
          routes: routes,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                extensions: theme.extensionBuilder?.call(context),
              ),
              child: child ?? const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}
