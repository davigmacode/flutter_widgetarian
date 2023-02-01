import 'package:flutter/material.dart' hide Chip;
import 'package:widgetarian/display.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class ChipDeleteUsage extends StatelessWidget {
  const ChipDeleteUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'With Delete Button',
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
                  onDeleted: () {},
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  label: const Text('Tonal Button'),
                ),
                ElevatedChip(
                  onDeleted: () {},
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  label: const Text('Elevated Button'),
                ),
                FilledChip(
                  onDeleted: () {},
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  label: const Text('Filled Button'),
                ),
                OutlinedChip(
                  onDeleted: () {},
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

const script = '''Choice<String>(
  multiple: true,
  builder: (context, group, _) {
    return Wrap(
      spacing: 15,
      children: [
        TonalChip(
          onDeleted: () {},
          selected: group.has('tonal'),
          onSelected: group.select('tonal'),
          label: const Text('Tonal Button'),
        ),
        ElevatedChip(
          onDeleted: () {},
          selected: group.has('elevated'),
          onSelected: group.select('elevated'),
          label: const Text('Elevated Button'),
        ),
        FilledChip(
          onDeleted: () {},
          selected: group.has('filled'),
          onSelected: group.select('filled'),
          label: const Text('Filled Button'),
        ),
        OutlinedChip(
          onDeleted: () {},
          selected: group.has('outlined'),
          onSelected: group.select('outlined'),
          label: const Text('Outlined Button'),
        ),
      ],
    );
  },
)''';
