import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/button.dart';
import 'package:widgetarian/choice.dart';
import 'package:widgetarian/layout.dart';

import '../sample.dart';

List<String> strChoices = ['Flutter', 'React', 'Ionic'];
List<IconData> iconChoices = [
  Icons.format_bold,
  Icons.format_underline,
  Icons.format_italic,
];

class ButtonToggleUsage extends StatelessWidget {
  const ButtonToggleUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Toggle Button',
      script: script,
      wrapped: false,
      children: [
        Choice<String>(
          multiple: true,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: [
                ToggleButton(
                  selected: group.has('flutter'),
                  onSelected: group.select('flutter'),
                  style: DrivenButtonStyle.filled(),
                  child: const Text('Flutter'),
                ),
                ToggleButton.icon(
                  selected: group.has('bold'),
                  onSelected: group.select('bold'),
                  style: DrivenButtonStyle.outlined(
                    hoveredStyle: ButtonStyle(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    selectedStyle: DrivenButtonStyle.filled(
                      color: Theme.of(context).colorScheme.primary,
                      hoveredStyle: const ButtonStyle(backgroundOpacity: .3),
                    ),
                  ),
                  child: const Icon(Icons.format_bold),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

const script = '''bool textSelected = false;
bool iconSelected = false;

Wrap(
  spacing: 15,
  children: [
    ToggleButton(
      selected: textSelected,
      onSelected: (selected) => setState(() => textSelected = selected),
      style: DrivenButtonStyle.filled(),
      child: const Text('Flutter'),
    ),
    ToggleButton.icon(
      selected: iconSelected,
      onSelected: (selected) => setState(() => iconSelected = selected),
      style: DrivenButtonStyle.outlined(
        hoveredStyle: ButtonStyle(
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
        selectedStyle: DrivenButtonStyle.filled(
          color: Theme.of(context).colorScheme.primary,
          hoveredStyle: const ButtonStyle(backgroundOpacity: .3),
        ),
      ),
      child: const Icon(Icons.format_bold),
    )
  ],
  )''';
