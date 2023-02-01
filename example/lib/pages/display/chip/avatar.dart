import 'package:flutter/material.dart' hide Chip;
import 'package:widgetarian/display.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class ChipAvatarUsage extends StatelessWidget {
  const ChipAvatarUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'With Avatar',
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
                  avatarImage:
                      const NetworkImage('https://i.pravatar.cc/50?u=tonal'),
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  label: const Text('Tonal Button'),
                ),
                ElevatedChip(
                  avatarImage:
                      const NetworkImage('https://i.pravatar.cc/50?u=elevated'),
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  label: const Text('Elevated Button'),
                ),
                FilledChip(
                  avatarImage:
                      const NetworkImage('https://i.pravatar.cc/50?u=filled'),
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  label: const Text('Filled Button'),
                ),
                OutlinedChip(
                  avatarImage:
                      const NetworkImage('https://i.pravatar.cc/50?u=outlined'),
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
          avatarImage: const NetworkImage('https://i.pravatar.cc/50?u=tonal'),
          selected: group.has('tonal'),
          onSelected: group.select('tonal'),
          label: const Text('Tonal Button'),
        ),
        ElevatedChip(
          avatarImage: const NetworkImage('https://i.pravatar.cc/50?u=elevated'),
          selected: group.has('elevated'),
          onSelected: group.select('elevated'),
          label: const Text('Elevated Button'),
        ),
        FilledChip(
          avatarImage: const NetworkImage('https://i.pravatar.cc/50?u=filled'),
          selected: group.has('filled'),
          onSelected: group.select('filled'),
          label: const Text('Filled Button'),
        ),
        OutlinedChip(
          avatarImage: const NetworkImage('https://i.pravatar.cc/50?u=outlined'),
          selected: group.has('outlined'),
          onSelected: group.select('outlined'),
          label: const Text('Outlined Button'),
        ),
      ],
    );
  },
)''';
