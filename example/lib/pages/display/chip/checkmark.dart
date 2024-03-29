import 'package:flutter/material.dart' hide Chip;
import 'package:widgetarian/display.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class ChipCheckmarkUsage extends StatelessWidget {
  const ChipCheckmarkUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'With Checkmark',
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
                  checkmark: true,
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  label: const Text('Tonal Button'),
                ),
                ElevatedChip(
                  checkmark: true,
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  label: const Text('Elevated Button'),
                ),
                FilledChip(
                  checkmark: true,
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  label: const Text('Filled Button'),
                ),
                OutlinedChip(
                  checkmark: true,
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
          checkmark: true,
          selected: group.has('tonal'),
          onSelected: group.select('tonal'),
          label: const Text('Tonal Button'),
        ),
        ElevatedChip(
          checkmark: true,
          selected: group.has('elevated'),
          onSelected: group.select('elevated'),
          label: const Text('Elevated Button'),
        ),
        FilledChip(
          checkmark: true,
          selected: group.has('filled'),
          onSelected: group.select('filled'),
          label: const Text('Filled Button'),
        ),
        OutlinedChip(
          checkmark: true,
          selected: group.has('outlined'),
          onSelected: group.select('outlined'),
          label: const Text('Outlined Button'),
        ),
      ],
    );
  },
)''';
