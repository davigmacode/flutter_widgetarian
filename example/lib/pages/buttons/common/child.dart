import 'package:flutter/material.dart'
    hide TextButton, FilledButton, OutlinedButton;
import 'package:widgetarian/button.dart';

import '../../sample.dart';

class ButtonChildUsage extends StatelessWidget {
  const ButtonChildUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Button Children',
      script: script,
      children: [
        TextButton(
          onPressed: () {},
          leading: const Icon(Icons.calendar_month),
          child: const Text('Text Button'),
        ),
        TonalButton(
          onPressed: () {},
          trailing: const Icon(Icons.close),
          child: const Text('Tonal Button'),
        ),
        OutlinedButton(
          onPressed: () {},
          leading: const Icon(Icons.calendar_month),
          trailing: const Icon(Icons.close),
          child: const Text('Outlined Button'),
        ),
        FilledButton(
          onPressed: () {},
          leading: const SizedBox.square(
            dimension: 18,
            child: CircularProgressIndicator(color: Colors.white),
          ),
          child: const Text('Filled Button'),
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
      leading: const Icon(Icons.calendar_month),
      child: const Text('Text Button'),
    ),
    TonalButton(
      onPressed: () {},
      trailing: const Icon(Icons.close),
      child: const Text('Tonal Button'),
    ),
    OutlinedButton(
      onPressed: () {},
      leading: const Icon(Icons.calendar_month),
      trailing: const Icon(Icons.close),
      child: const Text('Outlined Button'),
    ),
    FilledButton(
      onPressed: () {},
      leading: const SizedBox.square(
        dimension: 18,
        child: CircularProgressIndicator(color: Colors.white),
      ),
      child: const Text('Filled Button'),
    ),
  ],
)''';
