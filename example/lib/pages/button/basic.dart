import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/button.dart';

import '../sample.dart';

class ButtonBasicUsage extends StatelessWidget {
  const ButtonBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        Button(
          onPressed: () => {},
          style: ButtonStyle.flat(),
          child: const Text('Flat Button'),
        ),
        Button(
          onPressed: () => {},
          style: ButtonStyle.toned(),
          child: const Text('Toned Button'),
        ),
        Button(
          onPressed: () => {},
          style: ButtonStyle.outlined(),
          child: const Text('Outlined Button'),
        ),
        Button(
          onPressed: () => {},
          style: ButtonStyle.filled(),
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
    Button(
      onPressed: () => {},
      style: ButtonStyle.flat(),
      child: const Text('Flat Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.toned(),
      child: const Text('Toned Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.outlined(),
      child: const Text('Outlined Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.filled(),
      child: const Text('Filled Button'),
    ),
  ],
)''';
