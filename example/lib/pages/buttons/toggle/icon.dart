import 'package:flutter/material.dart'
    hide ButtonStyle, TextButton, ElevatedButton, OutlinedButton;
import 'package:widgetarian/button.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class ToggleButtonIconUsage extends StatelessWidget {
  const ToggleButtonIconUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Icon Button',
      script: script,
      wrapped: false,
      children: [
        Choice<String>(
          multiple: true,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: [
                TextToggleButton.icon(
                  selected: group.has('text'),
                  onSelected: group.select('text'),
                  child: const Icon(Icons.settings),
                ),
                TonalToggleButton.icon(
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  shape: BoxShape.rectangle,
                  child: const Icon(Icons.settings),
                ),
                FilledToggleButton.icon(
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  child: const Icon(Icons.settings),
                ),
                ElevatedToggleButton.icon(
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  child: const Icon(Icons.settings),
                ),
                OutlinedToggleButton.icon(
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  child: const Icon(Icons.settings),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    TextButton.icon(
      onPressed: () {},
      child: const Icon(Icons.settings),
    ),
    TonalButton.icon(
      onPressed: () {},
      shape: BoxShape.rectangle,
      child: const Icon(Icons.settings),
    ),
    ElevatedButton.icon(
      onPressed: () {},
      child: const Icon(Icons.settings),
    ),
    Button.icon(
      onPressed: () {},
      style: DrivenButtonStyle.filled(
        pressedStyle: ButtonStyle(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: const Icon(Icons.settings),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.outlined(
        hoveredStyle: ButtonStyle(
          borderRadius: BorderRadius.circular(5),
        ),
      ).icon(shape: BoxShape.rectangle),
      child: const Icon(Icons.settings),
    ),
  ],
)''';
