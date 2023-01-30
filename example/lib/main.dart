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
          'basic': ThemeConfig.fromColor(Colors.green),
          'pro': ThemeConfig.fromColor(Colors.red),
          'premium': ThemeConfig.fromColor(Colors.amber),
        },
        // light: ThemeData.light(),
        // dark: ThemeData.dark(),
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
                extensions: ThemePreset.m3(context),
              ),
              child: child ?? const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}
