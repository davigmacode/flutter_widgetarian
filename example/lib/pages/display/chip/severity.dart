import 'package:flutter/material.dart'
    hide TextButton, ElevatedButton, OutlinedButton;
import 'package:widgetarian/display.dart';
import 'package:widgetarian/choice.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class ChipSeverityUsage extends StatelessWidget {
  const ChipSeverityUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Severity Colors',
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
                  severity: ChipSeverity.danger,
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  label: const Text('Danger Tonal'),
                ),
                ElevatedChip(
                  severity: ChipSeverity.danger,
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  label: const Text('Danger Elevated'),
                ),
                FilledChip(
                  severity: ChipSeverity.danger,
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  label: const Text('Danger Filled'),
                ),
                OutlinedChip(
                  severity: ChipSeverity.danger,
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  label: const Text('Danger Outlined'),
                ),
              ],
            );
          },
        ),
        const Gap(15),
        Choice<String>(
          multiple: true,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: [
                TonalChip(
                  severity: ChipSeverity.warning,
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  label: const Text('Warning Tonal'),
                ),
                ElevatedChip(
                  severity: ChipSeverity.warning,
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  label: const Text('Warning Elevated'),
                ),
                FilledChip(
                  severity: ChipSeverity.warning,
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  label: const Text('Warning Filled'),
                ),
                OutlinedChip(
                  severity: ChipSeverity.warning,
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  label: const Text('Warning Outlined'),
                ),
              ],
            );
          },
        ),
        const Gap(15),
        Choice<String>(
          multiple: true,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: [
                TonalChip(
                  severity: ChipSeverity.success,
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  label: const Text('Success Tonal'),
                ),
                ElevatedChip(
                  severity: ChipSeverity.success,
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  label: const Text('Success Elevated'),
                ),
                FilledChip(
                  severity: ChipSeverity.success,
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  label: const Text('Success Filled'),
                ),
                OutlinedChip(
                  severity: ChipSeverity.success,
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  label: const Text('Success Outlined'),
                ),
              ],
            );
          },
        ),
        const Gap(15),
        Choice<String>(
          multiple: true,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: [
                TonalChip(
                  severity: ChipSeverity.info,
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  label: const Text('Info Tonal'),
                ),
                ElevatedChip(
                  severity: ChipSeverity.info,
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  label: const Text('Info Elevated'),
                ),
                FilledChip(
                  severity: ChipSeverity.info,
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  label: const Text('Info Filled'),
                ),
                OutlinedChip(
                  severity: ChipSeverity.info,
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  label: const Text('Info Outlined'),
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
