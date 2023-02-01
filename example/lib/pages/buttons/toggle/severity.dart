import 'package:flutter/material.dart'
    hide TextButton, ElevatedButton, OutlinedButton;
import 'package:widgetarian/button.dart';
import 'package:widgetarian/choice.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class ToggleButtonSeverityUsage extends StatelessWidget {
  const ToggleButtonSeverityUsage({Key? key}) : super(key: key);

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
                TextToggleButton(
                  severity: ButtonSeverity.danger,
                  selected: group.has('text'),
                  onSelected: group.select('text'),
                  child: const Text('Danger Text'),
                ),
                TonalToggleButton(
                  severity: ButtonSeverity.danger,
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  child: const Text('Danger Tonal'),
                ),
                ElevatedToggleButton(
                  severity: ButtonSeverity.danger,
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  child: const Text('Danger Elevated'),
                ),
                FilledToggleButton(
                  severity: ButtonSeverity.danger,
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  child: const Text('Danger Filled'),
                ),
                OutlinedToggleButton(
                  severity: ButtonSeverity.danger,
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  child: const Text('Danger Outlined'),
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
                TextToggleButton(
                  severity: ButtonSeverity.warning,
                  selected: group.has('text'),
                  onSelected: group.select('text'),
                  child: const Text('Warning Text'),
                ),
                TonalToggleButton(
                  severity: ButtonSeverity.warning,
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  child: const Text('Warning Tonal'),
                ),
                ElevatedToggleButton(
                  severity: ButtonSeverity.warning,
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  child: const Text('Warning Elevated'),
                ),
                FilledToggleButton(
                  severity: ButtonSeverity.warning,
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  child: const Text('Warning Filled'),
                ),
                OutlinedToggleButton(
                  severity: ButtonSeverity.warning,
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  child: const Text('Warning Outlined'),
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
                TextToggleButton(
                  severity: ButtonSeverity.success,
                  selected: group.has('text'),
                  onSelected: group.select('text'),
                  child: const Text('Success Text'),
                ),
                TonalToggleButton(
                  severity: ButtonSeverity.success,
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  child: const Text('Success Tonal'),
                ),
                ElevatedToggleButton(
                  severity: ButtonSeverity.success,
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  child: const Text('Success Elevated'),
                ),
                FilledToggleButton(
                  severity: ButtonSeverity.success,
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  child: const Text('Success Filled'),
                ),
                OutlinedToggleButton(
                  severity: ButtonSeverity.success,
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  child: const Text('Success Outlined'),
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
                TextToggleButton(
                  severity: ButtonSeverity.info,
                  selected: group.has('text'),
                  onSelected: group.select('text'),
                  child: const Text('Info Text'),
                ),
                TonalToggleButton(
                  severity: ButtonSeverity.info,
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  child: const Text('Info Tonal'),
                ),
                ElevatedToggleButton(
                  severity: ButtonSeverity.info,
                  selected: group.has('elevated'),
                  onSelected: group.select('elevated'),
                  child: const Text('Info Elevated'),
                ),
                FilledToggleButton(
                  severity: ButtonSeverity.info,
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  child: const Text('Info Filled'),
                ),
                OutlinedToggleButton(
                  severity: ButtonSeverity.info,
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  child: const Text('Info Outlined'),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

const script = '''ListView(
  shrinkwrap: true,
  children: [
    Choice<String>(
      multiple: true,
      builder: (context, group, _) {
        return Wrap(
          spacing: 15,
          children: [
            TextToggleButton(
              severity: ButtonSeverity.danger,
              selected: group.has('text'),
              onSelected: group.select('text'),
              child: const Text('Danger Text'),
            ),
            TonalToggleButton(
              severity: ButtonSeverity.danger,
              selected: group.has('tonal'),
              onSelected: group.select('tonal'),
              child: const Text('Danger Tonal'),
            ),
            ElevatedToggleButton(
              severity: ButtonSeverity.danger,
              selected: group.has('elevated'),
              onSelected: group.select('elevated'),
              child: const Text('Danger Elevated'),
            ),
            FilledToggleButton(
              severity: ButtonSeverity.danger,
              selected: group.has('filled'),
              onSelected: group.select('filled'),
              child: const Text('Danger Filled'),
            ),
            OutlinedToggleButton(
              severity: ButtonSeverity.danger,
              selected: group.has('outlined'),
              onSelected: group.select('outlined'),
              child: const Text('Danger Outlined'),
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
            TextToggleButton(
              severity: ButtonSeverity.warning,
              selected: group.has('text'),
              onSelected: group.select('text'),
              child: const Text('Warning Text'),
            ),
            TonalToggleButton(
              severity: ButtonSeverity.warning,
              selected: group.has('tonal'),
              onSelected: group.select('tonal'),
              child: const Text('Warning Tonal'),
            ),
            ElevatedToggleButton(
              severity: ButtonSeverity.warning,
              selected: group.has('elevated'),
              onSelected: group.select('elevated'),
              child: const Text('Warning Elevated'),
            ),
            FilledToggleButton(
              severity: ButtonSeverity.warning,
              selected: group.has('filled'),
              onSelected: group.select('filled'),
              child: const Text('Warning Filled'),
            ),
            OutlinedToggleButton(
              severity: ButtonSeverity.warning,
              selected: group.has('outlined'),
              onSelected: group.select('outlined'),
              child: const Text('Warning Outlined'),
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
            TextToggleButton(
              severity: ButtonSeverity.success,
              selected: group.has('text'),
              onSelected: group.select('text'),
              child: const Text('Success Text'),
            ),
            TonalToggleButton(
              severity: ButtonSeverity.success,
              selected: group.has('tonal'),
              onSelected: group.select('tonal'),
              child: const Text('Success Tonal'),
            ),
            ElevatedToggleButton(
              severity: ButtonSeverity.success,
              selected: group.has('elevated'),
              onSelected: group.select('elevated'),
              child: const Text('Success Elevated'),
            ),
            FilledToggleButton(
              severity: ButtonSeverity.success,
              selected: group.has('filled'),
              onSelected: group.select('filled'),
              child: const Text('Success Filled'),
            ),
            OutlinedToggleButton(
              severity: ButtonSeverity.success,
              selected: group.has('outlined'),
              onSelected: group.select('outlined'),
              child: const Text('Success Outlined'),
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
            TextToggleButton(
              severity: ButtonSeverity.info,
              selected: group.has('text'),
              onSelected: group.select('text'),
              child: const Text('Info Text'),
            ),
            TonalToggleButton(
              severity: ButtonSeverity.info,
              selected: group.has('tonal'),
              onSelected: group.select('tonal'),
              child: const Text('Info Tonal'),
            ),
            ElevatedToggleButton(
              severity: ButtonSeverity.info,
              selected: group.has('elevated'),
              onSelected: group.select('elevated'),
              child: const Text('Info Elevated'),
            ),
            FilledToggleButton(
              severity: ButtonSeverity.info,
              selected: group.has('filled'),
              onSelected: group.select('filled'),
              child: const Text('Info Filled'),
            ),
            OutlinedToggleButton(
              severity: ButtonSeverity.info,
              selected: group.has('outlined'),
              onSelected: group.select('outlined'),
              child: const Text('Info Outlined'),
            ),
          ],
        );
      },
    ),
  ],
)''';
