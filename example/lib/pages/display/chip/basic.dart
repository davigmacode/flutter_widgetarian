import 'package:flutter/material.dart' hide Chip;
import 'package:widgetarian/display.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class ChipBasicUsage extends StatelessWidget {
  const ChipBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Chip Variant',
      script: script,
      wrapped: false,
      children: [
        Choice<String>(
          multiple: true,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: [
                TonalChip(
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  label: const Text('Tonal Button'),
                ),
                ElevatedChip(
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  label: const Text('Elevated Button'),
                ),
                FilledChip(
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  label: const Text('Filled Button'),
                ),
                OutlinedChip(
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  label: const Text('Outlined Button'),
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
    TextButton(
      onPressed: () {},
      child: const Text('Text Button'),
    ),
    TonalButton(
      onPressed: () {},
      child: const Text('Tonal Button'),
    ),
    ElevatedButton(
      onPressed: () {},
      child: const Text('Elevated Button'),
    ),
    FilledButton(
      onPressed: () {},
      child: const Text('Filled Button'),
    ),
    OutlinedButton(
      onPressed: () {},
      child: const Text('Outlined Button'),
    ),
  ],
)''';
