import 'package:flutter/material.dart'
    hide TextButton, ElevatedButton, OutlinedButton;
import 'package:widgetarian/button.dart';

import '../../sample.dart';

class ButtonBasicUsage extends StatelessWidget {
  const ButtonBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Button Variant',
      script: script,
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
