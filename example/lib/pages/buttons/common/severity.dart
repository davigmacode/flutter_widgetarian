import 'package:flutter/material.dart'
    hide TextButton, FilledButton, ElevatedButton, OutlinedButton;
import 'package:widgetarian/button.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class ButtonSeverityUsage extends StatelessWidget {
  const ButtonSeverityUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Severity Colors',
      script: script,
      wrapped: false,
      children: [
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            TextButton(
              severity: ButtonSeverity.danger,
              onPressed: () {},
              child: const Text('Danger Text'),
            ),
            TonalButton(
              severity: ButtonSeverity.danger,
              onPressed: () {},
              child: const Text('Danger Tonal'),
            ),
            ElevatedButton(
              severity: ButtonSeverity.danger,
              onPressed: () {},
              child: const Text('Danger Elevated'),
            ),
            FilledButton(
              severity: ButtonSeverity.danger,
              onPressed: () {},
              child: const Text('Danger Filled'),
            ),
            OutlinedButton(
              severity: ButtonSeverity.danger,
              onPressed: () {},
              child: const Text('Danger Outlined'),
            ),
          ],
        ),
        const Gap(15),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            TextButton(
              severity: ButtonSeverity.warning,
              onPressed: () {},
              child: const Text('Warning Text'),
            ),
            TonalButton(
              severity: ButtonSeverity.warning,
              onPressed: () {},
              child: const Text('Warning Tonal'),
            ),
            ElevatedButton(
              severity: ButtonSeverity.warning,
              onPressed: () {},
              child: const Text('Warning Elevated'),
            ),
            FilledButton(
              severity: ButtonSeverity.warning,
              onPressed: () {},
              child: const Text('Warning Filled'),
            ),
            OutlinedButton(
              severity: ButtonSeverity.warning,
              onPressed: () {},
              child: const Text('Warning Outlined'),
            ),
          ],
        ),
        const Gap(15),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            TextButton(
              severity: ButtonSeverity.success,
              onPressed: () {},
              child: const Text('Success Text'),
            ),
            TonalButton(
              severity: ButtonSeverity.success,
              onPressed: () {},
              child: const Text('Success Tonal'),
            ),
            ElevatedButton(
              severity: ButtonSeverity.success,
              onPressed: () {},
              child: const Text('Success Elevated'),
            ),
            FilledButton(
              severity: ButtonSeverity.success,
              onPressed: () {},
              child: const Text('Success Filled'),
            ),
            OutlinedButton(
              severity: ButtonSeverity.success,
              onPressed: () {},
              child: const Text('Success Outlined'),
            ),
          ],
        ),
        const Gap(15),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            TextButton(
              severity: ButtonSeverity.info,
              onPressed: () {},
              child: const Text('Info Text'),
            ),
            TonalButton(
              severity: ButtonSeverity.info,
              onPressed: () {},
              child: const Text('Info Tonal'),
            ),
            ElevatedButton(
              severity: ButtonSeverity.info,
              onPressed: () {},
              child: const Text('Info Elevated'),
            ),
            FilledButton(
              severity: ButtonSeverity.info,
              onPressed: () {},
              child: const Text('Info Filled'),
            ),
            OutlinedButton(
              severity: ButtonSeverity.info,
              onPressed: () {},
              child: const Text('Info Outlined'),
            ),
          ],
        ),
      ],
    );
  }
}

const script = '''ListView(
  shrinkwrap: true
  children: [
    Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        TextButton(
          severity: ButtonSeverity.danger,
          onPressed: () {},
          child: const Text('Danger Text'),
        ),
        TonalButton(
          severity: ButtonSeverity.danger,
          onPressed: () {},
          child: const Text('Danger Tonal'),
        ),
        ElevatedButton(
          severity: ButtonSeverity.danger,
          onPressed: () {},
          child: const Text('Danger Elevated'),
        ),
        FilledButton(
          severity: ButtonSeverity.danger,
          onPressed: () {},
          child: const Text('Danger Filled'),
        ),
        OutlinedButton(
          severity: ButtonSeverity.danger,
          onPressed: () {},
          child: const Text('Danger Outlined'),
        ),
      ],
    ),
    const Gap(15),
    Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        TextButton(
          severity: ButtonSeverity.warning,
          onPressed: () {},
          child: const Text('Warning Text'),
        ),
        TonalButton(
          severity: ButtonSeverity.warning,
          onPressed: () {},
          child: const Text('Warning Tonal'),
        ),
        ElevatedButton(
          severity: ButtonSeverity.warning,
          onPressed: () {},
          child: const Text('Warning Elevated'),
        ),
        FilledButton(
          severity: ButtonSeverity.warning,
          onPressed: () {},
          child: const Text('Warning Filled'),
        ),
        OutlinedButton(
          severity: ButtonSeverity.warning,
          onPressed: () {},
          child: const Text('Warning Outlined'),
        ),
      ],
    ),
    const Gap(15),
    Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        TextButton(
          severity: ButtonSeverity.success,
          onPressed: () {},
          child: const Text('Success Text'),
        ),
        TonalButton(
          severity: ButtonSeverity.success,
          onPressed: () {},
          child: const Text('Success Tonal'),
        ),
        ElevatedButton(
          severity: ButtonSeverity.success,
          onPressed: () {},
          child: const Text('Success Elevated'),
        ),
        FilledButton(
          severity: ButtonSeverity.success,
          onPressed: () {},
          child: const Text('Success Filled'),
        ),
        OutlinedButton(
          severity: ButtonSeverity.success,
          onPressed: () {},
          child: const Text('Success Outlined'),
        ),
      ],
    ),
    const Gap(15),
    Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        TextButton(
          severity: ButtonSeverity.info,
          onPressed: () {},
          child: const Text('Info Text'),
        ),
        TonalButton(
          severity: ButtonSeverity.info,
          onPressed: () {},
          child: const Text('Info Tonal'),
        ),
        ElevatedButton(
          severity: ButtonSeverity.info,
          onPressed: () {},
          child: const Text('Info Elevated'),
        ),
        FilledButton(
          severity: ButtonSeverity.info,
          onPressed: () {},
          child: const Text('Info Filled'),
        ),
        OutlinedButton(
          severity: ButtonSeverity.info,
          onPressed: () {},
          child: const Text('Info Outlined'),
        ),
      ],
    ),
  ],
)''';
