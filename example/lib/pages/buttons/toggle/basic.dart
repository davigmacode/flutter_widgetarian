import 'package:flutter/material.dart'
    hide TextButton, ElevatedButton, OutlinedButton;
import 'package:widgetarian/button.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class ToggleButtonBasicUsage extends StatelessWidget {
  const ToggleButtonBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Button Variant',
      script: script,
      wrapped: false,
      children: [
        Choice<String>(
          multiple: true,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: [
                TextToggleButton(
                  selected: group.has('text'),
                  onSelected: group.select('text'),
                  child: const Text('Text Button'),
                ),
                TonalToggleButton(
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  child: const Text('Tonal Button'),
                ),
                ElevatedToggleButton(
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  child: const Text('Elevated Button'),
                ),
                FilledToggleButton(
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  child: const Text('Filled Button'),
                ),
                OutlinedToggleButton(
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  child: const Text('Outlined Button'),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

const script = '''Choice<String>(
  multiple: true,
  builder: (context, group, _) {
    return Wrap(
      spacing: 15,
      children: [
        TextToggleButton(
          selected: group.has('text'),
          onSelected: group.select('text'),
          child: const Text('Text Button'),
        ),
        TonalToggleButton(
          selected: group.has('tonal'),
          onSelected: group.select('tonal'),
          child: const Text('Tonal Button'),
        ),
        ElevatedToggleButton(
          selected: group.has('elevated'),
          onSelected: group.select('elevated'),
          child: const Text('Elevated Button'),
        ),
        FilledToggleButton(
          selected: group.has('filled'),
          onSelected: group.select('filled'),
          child: const Text('Filled Button'),
        ),
        OutlinedToggleButton(
          selected: group.has('outlined'),
          onSelected: group.select('outlined'),
          child: const Text('Outlined Button'),
        ),
      ],
    );
  },
)''';
