import 'package:flutter/material.dart' hide Chip, TextButton, OutlinedButton;
import 'package:widgetarian/theme.dart';
import 'package:widgetarian/anchor.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/display.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/layout.dart';

import '../template.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: title,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Gap(50),
              ThemeConsumer(
                builder: (context, theme) {
                  return Column(
                    children: [
                      FilledButton(
                        onPressed: () => theme.toggleMode(),
                        leading: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            theme.modeIcon,
                            key: ValueKey(theme.mode),
                          ),
                        ),
                        child: Text('${theme.mode.name.toUpperCase()} MODE'),
                      ),
                      const SizedBox(height: 10),
                      OutlinedButton(
                        onPressed: () => theme.resetMode(),
                        child: const Text('Reset to Initial Mode'),
                      ),
                    ],
                  );
                },
              ),
              const Gap(30),
              ThemeConsumer(
                builder: (context, theme) {
                  return Wrap(
                    spacing: 5,
                    children: theme.availableEntries
                        .map((e) => Chip(
                              label: Text(e.key),
                              onSelected: (_) => theme.select(e.key),
                              selected: theme.selected == e.key,
                              checkmark: true,
                              style: DrivenChipStyle.tonal(
                                avatarStyle: AvatarStyle(
                                  backgroundColor:
                                      e.value.colorSchemeOf(context).primary,
                                ),
                              ),
                            ))
                        .toList(),
                  );
                },
              ),
              const Gap(20),
              Wrap(
                spacing: 5,
                children: [
                  TextButton(
                    onPressed: () => ThemePatrol.of(context).selectPrev(),
                    child: const Text('Prev Theme'),
                  ),
                  FilledButton(
                    onPressed: () => ThemeProvider.of(context).resetTheme(),
                    child: const Text('Reset to Initial Theme'),
                  ),
                  TextButton(
                    onPressed: () => ThemeProvider.of(context).selectNext(),
                    child: const Text('Next Theme'),
                  ),
                ],
              ),
              const Gap(10),
              OutlinedButton(
                onPressed: () => ThemePatrol.of(context).selectRandom(),
                child: const Text('Random Theme'),
              ),
              const Gap(30),
              const Text(
                'Override Theme Color',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const Gap(10),
              ThemeConsumer(builder: (context, theme) {
                return Container(
                  width: 200,
                  alignment: Alignment.center,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: Colors.primaries.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      crossAxisCount: 6,
                    ),
                    itemBuilder: (_, i) {
                      final color = Colors.primaries[i];
                      return Card(
                        color: color,
                        child: Anchor(
                          onTap: () => theme.toColor(color),
                          child: AnimatedCheckmark(
                            weight: 4,
                            color: Colors.white70,
                            value: color == theme.color,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              const Gap(10),
              TextButton(
                onPressed: () => ThemePatrol.of(context).resetColor(),
                child: const Text('Reset Color to Theme Color'),
              ),
              const Gap(30),
              FilledButton(
                onPressed: () => ThemePatrol.of(context).reset(),
                child: const Text('Reset All to Initial Values'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
